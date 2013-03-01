with Car;
--with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Elementary_Functions;

package body Pilot is
   use Car;

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

      ---------------------------------------------------
      -- DEFINIZIONE DELLE PROCEDURE E FUNZIONI DI APPOGGIO
      ---------------------------------------------------

      -- configura il pilota e la vettura
      procedure Configure_Pilot_And_Car;
      -- function Get_Tot_Penality return Percent_T;
      -- funzione che mappa la distanza nella velocità
      function Get_Speed_From_Distance (Distance : Float) return Speed_T;
      -- funzione che mappa la velocità nella distanza
      function Get_Distance_From_Speed (Speed : Speed_T) return Float;
      -- funzione che restiutisce la velocità finale in base a quella iniziale e alla distanza persorsa
      function Get_Final_Speed (Initial_Speed : Speed_T; Distance : Float) return Speed_T;
      -- funzione che calcola il tempo di percorrenza in base a distanza iniziale, distanza finale e distanza
      function Get_Acc_Travel_Time (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Float;
      -- funzione dhe mi calcola lo spazio necessario a rallentare ad un certa velocità
      function Get_Dec_Space (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Positive;
      -- funzione che in base alle skill del pilota mi dice il punto effettivo di staccata (numero di sottosegmento)
      function Get_Breaking_Point (Initial_Speed : Speed_T; Final_Speed : Speed_T; Segment_Length : Positive) return Integer;

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
	 Name := Configuration.Element (0).all.Element (0);
	 Skill_Acceleration := Skill_Acceleration_T'Value (Configuration.Element (0).all.Element (0).all);
	 Skill_Deceleration := Skill_Deceleration_T'Value (Configuration.Element (0).all.Element (0).all);
	 -- configuro la vettura
	 Build_Car (Car_Config_File_Ref.all, Car);

      end Configure_Pilot_And_Car;
      --+--------

      procedure Configure_Car is
      begin
	 Build_Car (Car_Config_File_Ref.all, Car);
      end Configure_Car;
      --+--------

      function Get_Tot_Penality return Percent_T is
      begin
	 return 0.0;
      end Get_Tot_Penality;
      --+--------

      function Get_Speed_From_Distance (Distance : Float) return Speed_T is
      begin
	 return Alpha * (Ada.Numerics.Elementary_Functions.Log (Base => 10.0, X => ((Distance / Beta)+1.0)));
      end Get_Speed_From_Distance;
      --+--------

      function Get_Distance_From_Speed (Speed : Speed_T) return Float is
      begin
	 return Beta * (Ada.Numerics.Elementary_Functions.Exp (Speed / Alpha) - 1.0);
      end Get_Distance_From_Speed;
      --+--------

      function Get_Final_Speed (Initial_Speed : Speed_T; Distance : Float) return Speed_T is
	 Shift : Float := 0.0;
      begin
	 Shift := Get_Distance_From_Speed (Initial_Speed);
	 return Get_Distance_From_Speed (Distance + Shift);
      end Get_Final_Speed;
      --+--------

      function Get_Acc_Travel_Time (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Float is
      begin
	 return ((Initial_Speed + Final_Speed) / 3.0) * 2.0;
      end Get_Acc_Travel_Time;
      --+--------

      function Get_Dec_Space (Initial_Speed : Speed_T; Final_Speed : Speed_T) return Positive is
	 Delta_V   : Speed_T := Final_Speed - Initial_Speed;
	 Dec_Space : Float := 0.0;
      begin
	 Dec_Space := 0.5 * Effective_Deceleration * ((Delta_V * Delta_V) / (Effective_Deceleration * Effective_Deceleration))+Initial_Speed * (Delta_V / Effective_Deceleration);
	 return Positive (Dec_Space);
      end Get_Dec_Space;
      --+--------

      function Get_Breaking_Point (Initial_Speed : Speed_T; Final_Speed : Speed_T; Segment_Length : Positive) return Integer is
	 Breaking_Space     : Integer := Get_Dec_Space (Initial_Speed, Final_Speed);
	 Pen_Breaking_Space : Float := 0.0;
      begin
	 Pen_Breaking_Space := Float (Breaking_Space) + Float (((Breaking_Space / 100)) * Car.Coeff_Deceleration);
	 return Integer (Pen_Breaking_Space);
      end Get_Breaking_Point;
      --+--------

      ---------------------------------------------------
      -- TASK PILOTA
      ---------------------------------------------------

   begin
      -- inizializzare i parametri
      Configure_Pilot_And_Car;
      null;
   end Pilot_T;

end Pilot;





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
