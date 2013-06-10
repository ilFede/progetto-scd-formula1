with CORBA;
-- with CORBA.ORB;
-- with Formula1.Controller; use Formula1.Controller;

with Ada.Exceptions;  use Ada.Exceptions;

with Ada.Command_Line;

with Formula1.Car; use Formula1.Car;
with Ada.Numerics.Elementary_Functions;
with Formula1.Race; use Formula1.Race;
with Formula1.Segment; use Formula1.Segment;
with Ada.Calendar; use Ada.Calendar;

package body Formula1.Pilot is

   task body Pilot_T is

      ---------------------------------------------------
      -- PARAMETRI PER DEFINIRE I PILOTA E LA VETTURA
      ---------------------------------------------------
      -- numero del pilota
      Number             : CORBA.long;
      -- nome del pilota
      Name               : String_Ref_T;
      -- cognome del pilota
      Surname : String_Ref_T;
      -- parametro per la skill dell'accelerazione del pilota
      Skill_Acceleration : Skill_Acceleration_T;
      -- parametro per la skill della decellerazione del pilota
      Skill_Deceleration : Skill_Deceleration_T;
      -- auto del pilota
      Car                : Car_T;
      -- decelazione effettiva dell'auto
      Effective_Deceleration : Real_T;
      -- penalità per il meteo, se piove aggiungo del tempo
      Meteo_Penality : Real_T := 0.0;
      -- Riferimento alla stringa che rappresenta la strategia
      Strategy_Str_Ref : String_Ref_T := new String'("[");

      -- numero totale di giri della gara
      Num_Laps    : Positive;
      -- numero totale di segmenti del circuito
      Num_Tot_Seg : Positive;

      -- velocità di entrata nel segmento in cui mi trovo
      Segment_Enter_Speed                  : Real_T;
      -- velocità di uscita dal segmento in cui mi trovo
      Segment_Exit_Speed                   : Real_T;
      -- durata ideale di percorrenza del segmento in cui mi trovo
      Expected_Segment_Driving_Duration    : Duration;
      -- durata effetiva di percorrenza del sottosegmento in cui mi trovo
      Real_Segment_Exit_Time : Time;

      -- flag che indica se sono passato per i box
      Pit_Stop         : Boolean := false;
      -- numero totale pit stop programmati
      Num_Tot_Pit_Stop : Natural;
      -- numero di pit stop fatti
      Num_Pit_Stop     : Natural := 0;
      -- carburante necessario per fare un giro di pista
      Fuel_For_Lap     : Float;
      -- numero giri per avere i copertoni mediocri
      Poor_Tire_Threshold : Integer;
      -- numero giri per avere i copertoni usurati
      Worn_Tire_Threshold : Integer;


      -- giro dell'ultimo pitstop
      Last_Pit_Lap_Number : Integer := 0;

      -- variabile che indica se il pilota è in gara
      On_Race          : Boolean := true;

      -- ticket per determinare la sua posizione nella classifica
      Ticket           : CORBA.long := 0;

      -- istante di partenza della gara
      -- Race_Start_Time : Time;
      -- istante di inizio giro
      Lap_Start_Time : Time;

      -- motivo di fine gara
      Finish_Reason : CORBA.Long := 0;
         -- 0 => Gara conclusa
         -- 1 => Benzina finita
         -- 2 => Guasto tecnico

      ---------------------------------------------------
      -- DEFINIZIONE DELLE PROCEDURE E FUNZIONI DI APPOGGIO
      ---------------------------------------------------

      -- configura il pilota e la vettura
      procedure Configure_Pilot_And_Car;
      -- function Get_Tot_Penality return Percent_T;
      -- funzione che mappa la distanza nella velocità
      function Get_Speed_From_Distance (Distance : Real_T) return Real_T;
      -- funzione che mappa la velocità nella distanza
      function Get_Distance_From_Speed (Speed : Real_T) return Real_T;
      -- funzione che restiutisce la velocità finale in base a quella iniziale e alla distanza persorsa, tiene conto delle skill delle auto
      function Get_Final_Speed (Initial_Speed : Real_T; Distance : Real_T) return Real_T;
      -- procedura che mi calcola il tempo necessario a compiere una distanza in accelerazione
      --  e la velocità finale raggiunta in base anche alle caratteristiche dell'auto e del pilota
      procedure Do_Acceleration (Segment_Length : in Real_T; Acceleration_Time : out Duration);
      -- funzione calcola il tempo per effettuare la frenata (calcola solo il tempo di staccata, tiene conto delle skill dell'auto)
      function Get_Braking_Space (Initial_Speed : Real_T; Final_Speed : Real_T) return Real_T;
      -- funzione calcola il tempo per effettuare la frenata (calcola solo il tempo di staccata, tiene conto delle skill dell'auto)
      function Get_Braking_Time (Initial_Speed : Real_T; Final_Speed : Real_T) return Duration;
      -- procedura che mi calcola il tempo necessario a rallentare ad un certa velocità e la velocità di entrata in curva.
      -- la velocità d'entrata in curva è quella desctitta nel circuito, la procedura
      -- tiene conto delle ceratteristiche della vettura e del pilota e ricalcola tale velocità
      procedure Do_Deceleration (Segment_Length : in Real_T; Deceleration_Time : out Duration);
      -- procedura che calcola il tempo di atraversamento della corsia box
      -- dato che la velocità massima è limitata dal reglolamento, non si tieno conto delle
      -- prestazioni dell'auto
      function Do_Box (Segment_Length : Real_T) return Duration;
      -- funzione che calcola il tempo per percorrere un tratto a velocità costante (simula una curva)
      -- tiene conto delle caratteristiche dell'auto
      function Do_Constant (Segment_Length : Real_T) return Duration;


      ---------------------------------------------------
      -- CORPI DELLE PROCEDURE E FUNZIONI DI APPOGGIO
      ---------------------------------------------------

      procedure Configure_Pilot_And_Car is
      -- puntatore alla configurazione letta da file
	 Configuration        : Configuration_T.Vector;
      begin
	 -- configuro il pilota
	 -- Read_Config_File (Pilots_Set_Path & Pilot_Config_File_Ref.all, Configuration);
	 Number := CORBA.long'Value(Pilot_Configuration_Ref.all.Element (0).all.Element (0).all);
	 Name := Pilot_Configuration_Ref.all.Element (1).all.Element (0);
	 Surname := Pilot_Configuration_Ref.all.Element (1).all.Element (1);
	 Skill_Acceleration := Skill_Acceleration_T'Value (Pilot_Configuration_Ref.all.Element (2).all.Element (0).all);
	 Skill_Deceleration := Skill_Deceleration_T'Value (Pilot_Configuration_Ref.all.Element (3).all.Element (0).all);
	 -- configuro la vettura
	 Build_Car (Car_Configuration_Ref.all, Car);
	 -- configuro i ritardi di accelerazione e gli anticipi di frenata
	 -- numero di pit stop totali e numero di quelli fatti
	 Num_Tot_Pit_Stop := Strategy_Ref.Last_Index;
         -- calcolo la stringa che rappresenta la strategia
	 for k in 1 .. Strategy_Ref.Last_Index loop
	    Strategy_Str_Ref := new String '(Strategy_Str_Ref.all & Integer'Image(Strategy_Ref.all.Element (k)) & ", ");
	 end loop;
         Strategy_Str_Ref := new String'(Strategy_Str_Ref.all & "]");
	 -- carico la benzina iniziale
	 Car.Fuel_Level := Float(Strategy_Ref.all.Element (0));
         -- imposto le soglie degli pneumatici
         Poor_Tire_Threshold := Car.Coeff_Tire_Wear;
         Worn_Tire_Threshold := Car.Coeff_Tire_Wear / 2;
         -- imposto le condizioni degli pneumatici
         Car.Tires_Condition := 0;
      end Configure_Pilot_And_Car;
      --+--------

      function Get_Speed_From_Distance (Distance : Real_T) return Real_T is
      begin
	 return Real_T (Alpha * Real_T (Ada.Numerics.Elementary_Functions.Log (Base => 10.0, X => Float (Distance / Beta)+1.0)));
      end Get_Speed_From_Distance;
      --+--------

      function Get_Distance_From_Speed (Speed : Real_T) return Real_T is
      begin
	 return Real_T (Float (Beta) * (Ada.Numerics.Elementary_Functions.Exp (Float (Speed / Alpha)) - 1.0));
      end Get_Distance_From_Speed;
      --+--------

      function Get_Final_Speed (Initial_Speed : Real_T; Distance : Real_T) return Real_T is
	 Shift : Real_T;
      begin
	 Shift := Real_T (Get_Distance_From_Speed (Initial_Speed));
	 return Get_Speed_From_Distance (Distance + Shift);
      end Get_Final_Speed;
      --+--------

      procedure Do_Acceleration (Segment_Length : in Real_T; Acceleration_Time : out Duration) is
      -- spazio che simula l'accelerazione ritardata, faccio un tratto a velocità ridotta a causa dei riflessi del pilota che non acelera subito
	 Before_Acceleration_Space  : Real_T := Real_T ((Segment_Length / 100.0) * (Real_T (Skill_Acceleration_T'Last - Skill_Acceleration)));
	 Acceleation_Space          : Real_T := Segment_Length - Before_Acceleration_Space;
	 -- spazio prima della staccata
      begin
	 -- calcolo la velocità finale in base senza considerare le caratteristiche dell'auto
	 Segment_Exit_Speed := Get_Final_Speed (Segment_Enter_Speed, Segment_Length);
	 -- modifico la velocità in base alla vettura
	 Segment_Exit_Speed := Segment_Exit_Speed - ((Segment_Exit_Speed / 100.0) * Real_T (Coeff_Acceleration_T'Last - Car.Coeff_Acceleration));
	 -- controllo che la velocità massima sia minore di quella massima raggiungibile dall'auto
	 if (Segment_Exit_Speed > Car.Max_Speed) then
	    Segment_Exit_Speed := Car.Max_Speed;
	 end if;
	 Acceleration_Time := Duration (Segment_Length / (((Segment_Enter_Speed + Segment_Exit_Speed) / 2.0) * 1.0));
	 -- aggiungo la penalità del meteo
	 Acceleration_Time := Acceleration_Time + ((Acceleration_Time / 100) * Duration (Meteo_Penality));
      end Do_Acceleration;
      --+--------

      function Get_Braking_Space (Initial_Speed : Real_T; Final_Speed : Real_T) return Real_T is
      -- variazione della velocità Dv
	 Delta_V   : Real_T := Final_Speed - Initial_Speed;
	 -- varioazione dello spazio Dt
	 Dec_Space : Real_T := 0.0;
      begin
	 -- D = Delta
	 -- applico Ds = 1/2*acc*((Dv*Dv)/(acc)*(acc))+(Dv/acc)
	 Dec_Space := 0.5 * Effective_Deceleration * ((Delta_V * Delta_V) / (Effective_Deceleration * Effective_Deceleration))+Initial_Speed * (Delta_V / Effective_Deceleration);
	 return Real_T (Dec_Space);
      end Get_Braking_Space;
      --+--------

      function Get_Braking_Time (Initial_Speed : Real_T; Final_Speed : Real_T) return Duration is
      begin
	 return Duration ((Initial_Speed - Final_Speed) / Effective_Deceleration);
      end Get_Braking_Time;
      --+--------

      procedure  Do_Deceleration (Segment_Length : in Real_T; Deceleration_Time : out Duration) is
      -- calcolo lo spazio di frenata ideale
	 Braking_Space       : Real_T := Real_T (Get_Braking_Space (Segment_Enter_Speed, Segment_Exit_Speed));
	 -- spazio che simula la frenata anticipata, soppungo che frenando troppo
	 -- presto si faccia un pezzo di
	 -- staccata finale a velocità ridotta invece che in frenata
	 Before_Brake_Space  : Real_T :=  ((Segment_Length / 100.0) * Real_T (Skill_Deceleration_T'Last - Skill_Deceleration));
	 -- spazio prima della staccata
	 After_Brake_Space   : Real_T := Segment_Length - (Braking_Space + Before_Brake_Space);
      begin
	 -- tempo per percorrere il ratto prima dell'inizio della staccata
	 Deceleration_Time := Duration (Before_Brake_Space / Segment_Enter_Speed);
	 -- aggiungo il tempo per la frenata
	 Deceleration_Time := Deceleration_Time + Get_Braking_Time (Segment_Enter_Speed, Segment_Exit_Speed);
	 -- aggiungo il tempo per percorrere il tratto del segmento dopo la frenata anticipata
	 Deceleration_Time := Deceleration_Time + Duration (Before_Brake_Space / Segment_Exit_Speed);
	 -- aggiungo la penalità per il meteo
	 Deceleration_Time := Deceleration_Time + ((Deceleration_Time / 100) * Duration (Meteo_Penality)) + ((Deceleration_Time / 100) * Duration (Car.Tires_Condition * 2));
      end Do_Deceleration;
      --+--------

      function Do_Box (Segment_Length : Real_T) return Duration is
      begin
	 return Duration (Segment_Length / Segment_Enter_Speed);
      end Do_Box;
      --+--------

      function Do_Constant (Segment_Length : Real_T) return Duration is

	 Travel_Time : Duration := Duration (Segment_Length / Segment_Enter_Speed);
      begin
	 return Travel_Time + Duration (Travel_Time / 100.0) * Duration (Coeff_Roadholding_T'Last - Car.Coeff_Roadholding);
      end Do_Constant;
      --+--------

   ---------------------------------------------------
   -- TASK PILOTA
   ---------------------------------------------------

   begin

      ---------------------------------------------------
      -- INIZIALIZZAZIONE DEI PARAMETRI
      ---------------------------------------------------

      -- configuro pilota e vettura
      Configure_Pilot_And_Car;
      -- imposto il numero di giri
      Num_Laps := The_Race.Num_Laps;
      -- imposto il numero totale di segmenti
      Num_Tot_Seg := The_Race.Track.Tot_Segments;
      -- imposto la variabile per i pit stop
      Pit_Stop := false;
      -- imposto la velocità di entrata e uscita nel segmento
      Segment_Enter_Speed := 0.0;
      Segment_Exit_Speed := 0.0;
      -- calcolo il valore effettivo di decelerazione
      Effective_Deceleration := Standard_Deceleration - ((Standard_Deceleration / 100.0) * (Real_T (Car.Coeff_Deceleration) / 2.0));
      -- calcolo la penalità per il meteo
      if (The_Race.Meteo = dry) then
	 Meteo_Penality := (Real_T (Coeff_Roadholding_T'Last - Car.Coeff_Roadholding) / 2.0) + 10.0;
      else
	 Meteo_Penality := 0.0;
      end if;

      -- calcolo il carburante necessario per un giro di pista
      Fuel_For_Lap := Car.Consumption * Float (The_Race.Track.Lap_Length) / 1000.0;

      ---------------------------------------------------
      -- REGISTRO IL PILOTA NEL MONITOR
      ---------------------------------------------------

      Controller_Ref.all.Add_Pilot(Number, Name, Surname, Car.Manufacturer_Ref, Strategy_Str_Ref, new String'(Float'Image(Car.Fuel_Level)));

      ---------------------------------------------------
      -- SCHIERO NELLA GRIGLIA
      ---------------------------------------------------

      Put_Line("@@@ " & Surname.all & " (" & Car.Manufacturer_Ref.all & " " & Strategy_Str_Ref.all & ") schierato in griglia, consumo per giro: " & Float'Image(Fuel_For_Lap));
      The_Race.Track.Grid_Ref.all.Place_On_Grid;
      -- arrivo qua quando la gara parte
      -- Race_Start_Time := Clock;

      for Lap_Number in Integer range 1 .. Num_Laps loop
	 declare
	    -- segmento da cui partire nel giro (cambia se nel giro entro ai box o se continuo normalmente)
	    Start_Segment : Natural := 0;
	 begin
            Lap_Start_Time := Clock;

            ------------------------------------------------
            -- INIZIO A PERCORRERE IL GIRO
            ------------------------------------------------
            -- se non ho carburante e se ho programmato soste entro ai box
	    if (Pit_Stop = True) then
	       Put_Line ("+++ " & Surname.all & " entra dai box");
               -- notifico entrata ai box
               Controller_Ref.all.Enter_Box(Number);
               -- percorro i 3 segmenti del box
	       for Segment_Index in 0 .. 2 loop
		  declare
		     Actual_Segment : Segment_T := The_Race.Track.Segment_List.Element (Segment_Index);
		     Actual_Length  : Real_T := Actual_Segment.Length;
		  begin
		     Put_Line ("--> " & Surname.all & " entrato nel segmento numero: " & Integer'Image (Segment_Index));
		     -- aggiorno le velocità
		     Segment_Enter_Speed := Segment_Exit_Speed;
		     Segment_Exit_Speed := The_Race.Track.Segment_List.Element ((Segment_Index + 1) mod Num_Tot_Seg).Speed;
                     -- calcolo il tempo di percorrenza ideale in base al tipo di segmento
		     if Actual_Segment.Tipology = dec then
			-- corsia decelerazione box
			Do_Deceleration (Actual_Length, Expected_Segment_Driving_Duration);
                     elsif Actual_Segment.Tipology = box then
                        -- cambio gli pneumatici
                        Car.Tires_Condition := 0;
                        -- aggiorno i dati sulle soste
                        Num_Pit_Stop := Num_Pit_Stop + 1;
                        Last_Pit_Lap_Number := Lap_Number;
                        -- corsia box
                        Expected_Segment_Driving_Duration := Do_Box (Actual_Length);
                        -- faccio il rifornimento
                        -- Car.Fuel_Level := Strategy_Ref.all.Element (Num_Pit_Stop);
		     else
			-- corsia di accelerazione, entro nel terzo segmento
			Do_Acceleration (Actual_Length, Expected_Segment_Driving_Duration);
		     end if;
                     -- ottengo la durata reale della percorrenza del sottosegmento
                     Actual_Segment.Segment_RP_Ref.all.Get_Driving_Time (Expected_Segment_Driving_Duration + Clock, Real_Segment_Exit_Time, Ticket);
                     -- sospendo per la durata dell'atraversamento
		     delay until (Real_Segment_Exit_Time);
		     Put_Line ("<-- " & Surname.all & " uscito dal segmento numero: " & Integer'Image (Segment_Index));
		  end;
	       end loop;
               -- notifico uscita dai box
	       Put_Line ("--- " & Name.all & " esce dai box");
               Controller_Ref.all.Exit_Box(Number, new String '(Float'Image(Car.Fuel_Level)));
	       -- metto il pit stop a false
	       Pit_Stop := false;
	       -- sono uscito dai box e riprendo dal segmento 4
	       Start_Segment := 4;
	    else
	       -- non sono passato per i box e continuo per il rettilineo
	       Start_Segment := 3;
	    end if;
	    -- faccio il giro, se sono uscito dai box cambio segmento di partenza
	    for Segment_Index in Start_Segment .. The_Race.Track.Segment_List.Last_Index loop
	       declare
		  Actual_Segment : Segment_T := The_Race.Track.Segment_List.Element (Segment_Index);
		  Actual_Length  : Real_T := Actual_Segment.Length;
                  -- Time_To_Wake : Duration;
	       begin
		  Put_Line ("--> " & Surname.all & " entrato nel segmento numero: " & Integer'Image (Segment_Index));
		  -- aggiorno le velocità
		  Segment_Enter_Speed := Segment_Exit_Speed;
		  Segment_Exit_Speed := The_Race.Track.Segment_List.Element ((Segment_Index + 1) mod Num_Tot_Seg).Speed;
                  -- calcolo il tempo di percorrenza ideale in base al tipo di segmento
		  if Actual_Segment.Tipology = dec then
		     -- frenata
		     Do_Deceleration (Actual_Length, Expected_Segment_Driving_Duration);
		  elsif Actual_Segment.Tipology = const then
		     -- curva o tratto a velocità costante
		     Expected_Segment_Driving_Duration := Do_Constant (Actual_Length);
		  elsif Actual_Segment.Tipology = acc then
		     -- accelerazione
		     Do_Acceleration (Actual_Length, Expected_Segment_Driving_Duration);
		  end if;
		  -- ottengo la durata reale dell'atraversamento del sottosegmento
		  Actual_Segment.Segment_RP_Ref.all.Get_Driving_Time (Expected_Segment_Driving_Duration + Clock, Real_Segment_Exit_Time, Ticket);
		  -- sospendo per la durata dell'attraversamento
		  delay until (Real_Segment_Exit_Time);
		  -- verifico se devo notificare l'uscita dal segmento
		  if (Actual_Segment.Has_Time_Check /= 0) then
		     Controller_Ref.all.Send_Time (Number, (new String'(Duration'Image (Clock - Lap_Start_Time))), CORBA.Long'Value (Integer'Image (Lap_Number)), Actual_Segment.Has_Time_Check, Ticket, new String'(Duration'Image(Real_Segment_Exit_Time - Race_Start_Time)));
		     -- Controller_Ref.all.Send_Time (Number, (new String'(Duration'Image (Clock - Lap_Start_Time))), CORBA.Long'Value (Integer'Image (Lap_Number)), Actual_Segment.Has_Time_Check, Ticket, new String'(Duration'Image(Real_Segment_Exit_Time - Race_Start_Time)));
		  end if;
		  Put_Line ("<-- " & Surname.all & " uscito dal segmento numero: " & Integer'Image (Segment_Index));
	       end;
            end loop;
            -- aggiorno i dati sulla benzina
            Car.Fuel_Level := Car.Fuel_Level - Fuel_For_Lap;
            -- aggioro i dati sulle gomme
            if ((Lap_Number - Last_Pit_Lap_Number) > Worn_Tire_Threshold) then
               Car.Tires_Condition := 1;
            elsif ((Lap_Number - Last_Pit_Lap_Number) > Poor_Tire_Threshold) then
               Car.Tires_Condition := 2;
            end if;
            -- notifico i dati sulla benzina e gomme
            Controller_Ref.all.Send_Fuel_And_Tires (Number, new String'(Float'Image (Car.Fuel_Level)), Car.Tires_Condition);

            ------------------------------------------------
            -- INIZIO VERIFICA PIT STOP, CARBURANTE E GUASTI
            ------------------------------------------------
            -- vedo se devo cambiare le gomme
            if (Num_Pit_Stop < Num_Tot_Pit_Stop) then
               if (Lap_Number = Strategy_Ref.all.Element(Num_Pit_Stop + 1)) then
                  -- mi devo fermare
                  Pit_Stop := true;
               end if;
            end if;
            -- se non ho carburante a sufficenza abbandono la gara
            if (Car.Fuel_Level < Fuel_For_Lap) then
               -- il carburante non basta e ho finito i pit stop
               On_Race := false;
               Finish_Reason := 1;
            end if;
            -- TODO controllo guasti
            ------------------------------------------------
            -- FINE VERIFICA PIT STOP, CARBURANTE E GUASTI
            ------------------------------------------------
	    -- codice che modifica il valore di OnRace e FinishReason
            exit when On_Race = false;
	 end;
      end loop;
      Put_Line (Name.all & " termina");
      -- notifico la fine della gara
      Controller_Ref.all.Send_Finish_Race (Number, (new String'(Duration'Image (Clock - Race_Start_Time))), Finish_Reason);
   exception
      when Error : others =>
	 Put_Line ("You have a problem!!");
	 Put_Line (Exception_Name (Error));
	 Put (Exception_Message (Error));
   end Pilot_T;
   --+--------

end Formula1.Pilot;
