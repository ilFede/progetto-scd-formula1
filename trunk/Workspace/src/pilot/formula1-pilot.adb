with Formula1.Car; use Formula1.Car;
with Ada.Numerics.Elementary_Functions;
with Formula1.Race; use Formula1.Race;
with Formula1.Segment; use Formula1.Segment;

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
      Effective_Deceleration : Float := 0.0;
      -- numero totale di giri
      Num_Laps : Positive;
      -- numero totale di segmenti
      Num_Tot_Seg : Positive;
      -- velocità di entrata nel segmento
      Segment_Enter_Speed : Speed_T;
      -- velocità di uscita dal segmento
      Segment_Exit_Speed : Speed_T;
      -- flag che indica se sono passato per i box
      Pit_Stop : Boolean := false;
      -- numero totale pit stop
      Num_Tot_Pit_Stop : Natural;
      -- numero di pit stop fatti
      Num_Pit_Stop : Natural := 0;
      -- carburante necessario per fare un giro di pista
      Fuel_For_Lap : Float;
      -- corsia attuale occupata
      Actual_Lane : Num_Lanes_Seg_T;

      ---------------------------------------------------
      -- DEFINIZIONE DELLE PROCEDURE E FUNZIONI DI APPOGGIO
      ---------------------------------------------------

      -- configura il pilota e la vettura
      procedure Configure_Pilot_And_Car;
      -- function Get_Tot_Penality return Percent_T;
      -- funzione che mappa la distanza nella velocità
      function Get_Speed_From_Distance (Distance : Positive) return Speed_T;
      -- funzione che mappa la velocità nella distanza
      function Get_Distance_From_Speed (Speed : Speed_T) return Float;
      -- funzione che restiutisce la velocità finale in base a quella iniziale e alla distanza persorsa, tiene conto delle skill delle auto
      function Get_Final_Speed (Initial_Speed : Speed_T; Distance : Positive) return Speed_T;
      -- procedura che mi calcola il tempo necessario a compiere una distanza in accelerazione
      --  e la velocità finale raggiunta in base anche alle caratteristiche dell'auto e del pilota
      procedure Do_Acceleration (Initial_Speed : in Speed_T; Final_Speed : out Speed_T; Segment_Length : in Positive; Time : out Float);
      -- funzione calcola il tempo per effettuare la frenata (calcola solo il tempo di staccata, tiene conto delle skill dell'auto)
      function Get_Braking_Space (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Positive;
      -- funzione calcola il tempo per effettuare la frenata (calcola solo il tempo di staccata, tiene conto delle skill dell'auto)
      function Get_Braking_Time (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Float;
      -- procedura che mi calcola il tempo necessario a rallentare ad un certa velocità e la velocità di entrata in curva.
      -- la velocità d'entrata in curva è quella desctitta nel circuito, la procedura
      -- tiene conto delle ceratteristiche della vettura e del pilota e ricalcola tale velocità
      procedure Do_Deceleration (Initial_Speed : in Speed_T; Final_Speed : in out Speed_T; Segment_Length : in Positive; Time : out Float);


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

      function Get_Speed_From_Distance (Distance : Positive) return Speed_T is
      begin
	 return Alpha * (Ada.Numerics.Elementary_Functions.Log (Base => 10.0, X => ((Float(Distance) / Beta)+1.0)));
      end Get_Speed_From_Distance;
      --+--------

      function Get_Distance_From_Speed (Speed : Speed_T) return Float is
      begin
	 return Beta * (Ada.Numerics.Elementary_Functions.Exp (Speed / Alpha) - 1.0);
      end Get_Distance_From_Speed;
      --+--------

      function Get_Final_Speed (Initial_Speed : Speed_T; Distance : Positive) return Speed_T is
	 Shift : Positive := 1;
      begin
	 Shift := Positive(Get_Distance_From_Speed (Initial_Speed));
	 return Get_Speed_From_Distance (Distance + Shift);
      end Get_Final_Speed;
      --+--------

      procedure Do_Acceleration (Initial_Speed : in Speed_T; Final_Speed : out Speed_T; Segment_Length : in Positive; Time : out Float) is
	 -- spazio che simula l'accelerazione ritardata, faccio un tratto a velocità ridotta a causa dei riflessi del pilota che non acelera subito
	 Before_Acceleration_Space  : Natural := Natural ((Segment_Length / 100) * (Skill_Acceleration_T'Last - Skill_Acceleration));
	 Acceleation_Space : Natural := Segment_Length - Before_Acceleration_Space;
	 -- spazio prima della staccata
         Acceleration_Time : Float := 0.0;
      begin
         -- calcolo la velocità finale in base senza considerare le caratteristiche dell'auto
         Final_Speed := Get_Final_Speed(Initial_Speed, Segment_Length);
         -- modifico la velocità in base alla vettura
         Final_Speed := Final_Speed - ((Final_Speed / 100.0) * Float(Coeff_Acceleration_T'Last - Car.Coeff_Acceleration));
         -- controllo che la velocità massima sia monore di quella massima raggiungibile dall'auto
	 if (Final_Speed > Car.Max_Speed) then
	    Final_Speed := Car.Max_Speed;
	 end if;
         Time := Float(Segment_Length) / (((Initial_Speed + Final_Speed)/3.0)*2.0);
      end Do_Acceleration;
      --+--------

      function Get_Braking_Space (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Positive is
	 Delta_V   : Speed_T := Final_Speed - Initial_Speed;
	 Dec_Space : Float := 0.0;
      begin
	 Dec_Space := 0.5 * Effective_Deceleration * ((Delta_V * Delta_V) / (Effective_Deceleration * Effective_Deceleration))+Initial_Speed * (Delta_V / Effective_Deceleration);
	 return Positive (Dec_Space);
      end Get_Braking_Space;
      --+--------

      function Get_Braking_Time (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Float is
      begin
	 return (Initial_Speed - Final_Speed) / Effective_Deceleration;
      end Get_Braking_Time;
      --+--------

      procedure  Do_Deceleration (Initial_Speed : in Speed_T; Final_Speed : in out Speed_T; Segment_Length : in Positive; Time : out Float) is
         -- calcolo lo spazio di frenata ideale
	 Braking_Space     : Natural := Natural (Get_Braking_Space (Initial_Speed, Final_Speed));
	 -- spazio che simula la frenata anticipata, soppungo che frenando troppo presto si faccia un pezzo di
	 -- staccata finale a velocità ridotta invece che in frenata
	 Before_Brake_Space  : Natural := Natural ((Segment_Length / 100) * (Skill_Deceleration_T'Last - Skill_Deceleration));
	 -- spazio prima della staccata
	 After_Brake_Space : Natural := Segment_Length - (Braking_Space + Before_Brake_Space);
	 begin
            -- tempo prima della staccata vatta a velocità iniziale
            Time := 0.0;
            Time := Time + (Float(Before_Brake_Space)/Initial_Speed);
            -- aggiungo il tempo per la frenata
            Time := Time + Get_Braking_Time(Initial_Speed, Final_Speed);
            -- aggiungo il tempo per percorrere il tratto del segmento dopo la frenata anticipata
            Time := Time + (Final_Speed / Float(Before_Brake_Space));
            -- tempo di decelerazione
	 end Do_Deceleration;
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
      Segment_Enter_Speed := 1.0;
      Segment_Exit_Speed := 1.0;
      -- imposto la corsia attuale
      Actual_Lane := 1;
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
	    if Pit_Stop = True then
	       for Segment_Index in 0 .. 2 loop
		  declare
		     Actual_Segment : Segment_T := The_Race.Track.Segment_List.Element (Segment_Index);
		  begin

		     Segment_Enter_Speed := Segment_Exit_Speed;
		     Segment_Exit_Speed := Actual_Segment.Speed;

		     if Actual_Segment.Tipology = dec then
			-- corsia decelerazione box
			null;
		     elsif Actual_Segment.Tipology = box then
			-- corsia box
			null;
		     elsif Actual_Segment.Tipology = acc then
			-- corsia di acelereziopne, entro nel terrzo segmento
			null;
		     end if;
		  end;
	       end loop;
               -- sono uscito dai box e riprendo dalla prima frenata
               Start_Segment := 4;
	    else
               -- non sono passato per i box e continuo per il rettilineo
               Start_Segment := 3;
            end if;
            -- continuo il giro
	    for Segment_Index in 3 .. Num_Tot_Seg loop
	       declare
		  Actual_Segment : Segment_T := The_Race.Track.Segment_List.Element (Segment_Index);
	       begin

		  Segment_Enter_Speed := Segment_Exit_Speed;
		  Segment_Exit_Speed := Actual_Segment.Speed;

		  if Actual_Segment.Tipology = dec then
		     -- frenata
		     null;
		  elsif Actual_Segment.Tipology = const then
		     -- tratto a velocità costante
		     null;
		  elsif Actual_Segment.Tipology = acc then
		     -- accelerazione
		     null;
		  end if;
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
