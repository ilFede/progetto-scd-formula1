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

      Number             : Positive;
      -- nome del pilota
      Name               : String_Ref_T;
      -- parametro per la skill dell'accelerazione
      Skill_Acceleration : Skill_Acceleration_T;
      -- parametro per la skill della decellerazione
      Skill_Deceleration : Skill_Deceleration_T;
      -- auto del pilota
      Car                : Car_T;
      -- decelazione effettiva dell'auto
      Effective_Deceleration : Real_T;

      -- numero totale di giri
      Num_Laps    : Positive;
      -- numero totale di segmenti
      Num_Tot_Seg : Positive;

      -- velocità di entrata nel segmento
      Segment_Enter_Speed     : Real_T;
      -- velocità di uscita dal segmento
      Segment_Exit_Speed      : Real_T;
      -- tempo di percorrenza del segmento
      Segment_Driving_Time    : Duration;
      -- tempo di percorrenza del sottosegmento
      Subsegment_Driving_Time : Duration;

      -- flag che indica se sono passato per i box
      Pit_Stop         : Boolean := false;
      -- numero totale pit stop
      Num_Tot_Pit_Stop : Natural;
      -- numero di pit stop fatti
      Num_Pit_Stop     : Natural := 0;
      -- carburante necessario per fare un giro di pista
      Fuel_For_Lap     : Float;
      -- corsia attuale occupata
      --Actual_Lane : Num_Lanes_Seg_T;

      -- variabile che indica se il pilota è in gara
      On_Race : Boolean := true;

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
	 Read_Config_File (Pilots_Set_Path & Pilot_Config_File_Ref.all, Configuration);
	 Number := Positive'Value (Configuration.Element (0).all.Element (0).all);
	 Name := Configuration.Element (1).all.Element (0);
	 Skill_Acceleration := Skill_Acceleration_T'Value (Configuration.Element (2).all.Element (0).all);
	 Skill_Deceleration := Skill_Deceleration_T'Value (Configuration.Element (3).all.Element (0).all);
	 -- configuro la vettura
	 Build_Car (Car_Config_File_Ref.all, Car);
	 -- configuro i ritardi di accelerazione e gli anticipi di frenata
	 -- numero di pit stop totali e numero di quelli fatti
	 Num_Tot_Pit_Stop := Strategy.Last_Index;
      end Configure_Pilot_And_Car;
      --+--------

      procedure Configure_Car is
      begin
	 Build_Car (Car_Config_File_Ref.all, Car);
      end Configure_Car;
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
	 Acceleration_Time := Duration (Segment_Length) / Duration (((Segment_Enter_Speed + Segment_Exit_Speed) / 3.0) * 2.0);
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
	 -- tempo di decelerazione
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
      -- inizializzare i parametri
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

      --
      -- imposto la corsia attuale
      -- Actual_Lane := 1;
      -- calcolo il carburante necessario per un giro di pista
      Fuel_For_Lap := Car.Consumption * Float (The_Race.Track.Lap_Length);
      for Lap in 1 .. Num_Laps loop
	 declare
	    -- segmento da cui partire (indica se nel giro entro ai box o se continuo normalmente)
	    Start_Segment : Natural := 0;
	 begin
	    -- controllo se ho carburante sufficente per fare un giro di pista
	    -- se non ho carburante a sufficenza e non ho previsto soste abbandono la gara
	    -- controllo se devo attraversare il box o il rettilineo
	    if (Car.Fuel_Level < Fuel_For_Lap) and (Num_Pit_Stop < Num_Tot_Pit_Stop) then
	       -- incremento il numero dei pit stop fatti
	       Num_Pit_Stop := Num_Pit_Stop + 1;
	       Pit_Stop := true;
	    elsif (Car.Fuel_Level < Fuel_For_Lap) and (Num_Pit_Stop = Num_Tot_Pit_Stop) then
	       -- il carburante non basta e ho finito i pit stop
	       On_Race := false;
	    else
	       Pit_Stop := false;
	    end if;
	    if (Pit_Stop = True) and (On_Race = true) then
	       Put_Line ("Pilota " & Name.all & " entra dai box");

	       for Segment_Index in 0 .. 2 loop
		  declare
		     Actual_Segment : Segment_T := The_Race.Track.Segment_List.Element (Segment_Index);
		     Actual_Length  : Real_T := Actual_Segment.Length;
		  begin
		     Put_Line (Name.all & " entrato nel segmento numero: " & Integer'Image (Segment_Index));
		     -- aggiorno le velocità
		     Segment_Enter_Speed := Segment_Exit_Speed;
		     Segment_Exit_Speed := The_Race.Track.Segment_List.Element ((Segment_Index + 1) mod Num_Tot_Seg).Speed;

		     if Actual_Segment.Tipology = dec then
			-- corsia decelerazione box
			Do_Deceleration (Actual_Length, Segment_Driving_Time);
			-- faccio il firnimento
			Car.Fuel_Level := Strategy (Num_Pit_Stop);
			null;
		     elsif Actual_Segment.Tipology = box then
			-- corsia box
			Segment_Driving_Time := Do_Box (Actual_Length);
			null;
		     else
			-- corsia di accelerazione, entro nel terzo segmento
			Do_Acceleration (Actual_Length, Segment_Driving_Time);
		     end if;
		     -- devo attraversare tutti i sottosegmenti
		     Subsegment_Driving_Time := Segment_Driving_Time / Duration (Actual_Segment.Tot_Subsegments);
		     for Subsegment_Index in 0 .. Actual_Segment.Tot_Subsegments loop
			Actual_Segment.Subsegment_List.Element (Subsegment_Index).all.Get_Driving_Time (Subsegment_Driving_Time);
			-- sospendo per la durata dell'atraversamento
			delay until (Clock + Segment_Driving_Time);
		     end loop;
		     Put_Line ("Pilota " & Name.all & " uscito dal segmento numero: " & Integer'Image (Segment_Index));

		  end;
	       end loop;
	       Put_Line ("Pilota " & Name.all & " esce dai box");
	       -- metto il pito stop a false
	       Pit_Stop := false;
	       -- sono uscito dai box e riprendo dal segmento 4
	       Start_Segment := 4;
	    elsif (Pit_Stop = True) and (On_Race = true) then
	       -- non sono passato per i box e continuo per il rettilineo
	       Start_Segment := 3;
	    end if;
	    -- continuo il giro
	    for Segment_Index in 3 .. The_Race.Track.Segment_List.Last_Index loop
	       declare
		  Actual_Segment : Segment_T := The_Race.Track.Segment_List.Element (Segment_Index);
		  Actual_Length  : Real_T := Actual_Segment.Length;
	       begin
		  Put_Line (Name.all & " entrato nel segmento numero: " & Integer'Image (Segment_Index));
		  -- aggiorno le velocità
		  Segment_Enter_Speed := Segment_Exit_Speed;
		  Segment_Exit_Speed := The_Race.Track.Segment_List.Element ((Segment_Index + 1) mod Num_Tot_Seg).Speed;
		  if Actual_Segment.Tipology = dec then
		     -- frenata
		     Do_Deceleration (Actual_Length, Segment_Driving_Time);
		  elsif Actual_Segment.Tipology = const then
		     -- curva o tratto a velocità costante
		     Segment_Driving_Time := Do_Constant (Actual_Length);
		  elsif Actual_Segment.Tipology = acc then
		     -- accelerazione
		     Do_Acceleration (Actual_Length, Segment_Driving_Time);
		  end if;
		  -- devo attraversare tutti i sottosegmenti
		  Subsegment_Driving_Time := Segment_Driving_Time / Duration (Actual_Segment.Tot_Subsegments);
		  for Subsegment_Index in 0 .. Actual_Segment.Tot_Subsegments loop
		     Actual_Segment.Subsegment_List.Element (Subsegment_Index).all.Get_Driving_Time (Subsegment_Driving_Time);
		     -- sospendo per la durata dell'attraversamento
		     delay until (Clock + Segment_Driving_Time);
		  end loop;
		  Put_Line (Name.all & " uscito dal segmento numero: " & Integer'Image (Segment_Index));
		  -- aggiorno i dati sulla benzina
                  Car.Fuel_Level := Car.Fuel_Level - Fuel_For_Lap;
	       end;
	    end loop;
	 end;
      end loop;
      null;
   end Pilot_T;
   --+--------

end Formula1.Pilot;





-- procedura per la creazione di una automobile
--   procedure Build_Pilot (Pilot_Filename : in String; Race_Pilot : in out Pilot_T) is
-- puntatore alla configurazione letta da file
--    Configuration_Ref        : Configuration_Ref_T;
--  -- numero del pilota
--Pilot_Number             : Positive;
-- nome del pilota
--      Pilot_Name               : String_Ref_T;
-- parametro per la skill dell'accelerazione
--      Pilot_Skill_Acceleration : Skill_Acceleration_T;
-- parametro per la skill della decellerazione
--      Pilot_Skill_Deceleration : Skill_Deceleration_T;

--   begin
--      Configuration_Ref := Read_Config_File (Pilots_Set_Path & Pilot_Filename);
--      Pilot_Number := Positive'Value (Configuration_Ref.all.Element (0).all.Element (0).all);
--      Pilot_Name := Configuration_Ref.all.Element (0).all.Element (0);
--      Pilot_Skill_Acceleration := Skill_Acceleration_T'Value (Configuration_Ref.all.Element (0).all.Element (0).all);
--      Pilot_Skill_Deceleration := Skill_Deceleration_T'Value (Configuration_Ref.all.Element (0).all.Element (0).all);
--      Race_Pilot.Number := Pilot_Number;
--      Race_Pilot.Name := Pilot_Name;
--      Race_Pilot.Skill_Acceleration := Pilot_Skill_Acceleration;
--      Race_Pilot.Skill_Deceleration := Pilot_Skill_Deceleration;

--   end Build_Pilot;
--+--------

--end Pilot;
