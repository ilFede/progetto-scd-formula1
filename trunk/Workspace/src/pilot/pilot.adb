package body Pilot is

   -- procedura per la creazione di una automobile
   procedure Build_Pilot (Pilot_Filename : in String; Race_Pilot : in out Pilot_T) is
      -- puntatore alla configurazione letta da file
      Configuration_Ref        : Configuration_Ref_T;
      -- numero del pilota
      Pilot_Number             : Positive;
      -- nome del pilota
      Pilot_Name               : String_Ref_T;
      -- parametro per la skill dell'accelerazione
      Pilot_Skill_Acceleration : Skill_Acceleration_T;
      -- parametro per la skill della decellerazione
      Pilot_Skill_Deceleration : Skill_Deceleration_T;

   begin
      Configuration_Ref := Read_Config_File (Pilots_Set_Path & Pilot_Filename);
      Pilot_Number := Positive'Value (Configuration_Ref.all.Element (0).all.Element (0).all);
      Pilot_Name := Configuration_Ref.all.Element (0).all.Element (0);
      Pilot_Skill_Acceleration := Skill_Acceleration_T'Value (Configuration_Ref.all.Element (0).all.Element (0).all);
      Pilot_Skill_Deceleration := Skill_Deceleration_T'Value (Configuration_Ref.all.Element (0).all.Element (0).all);
      Race_Pilot.Number := Pilot_Number;
      Race_Pilot.Name := Pilot_Name;
      Race_Pilot.Skill_Acceleration := Pilot_Skill_Acceleration;
      Race_Pilot.Skill_Deceleration := Pilot_Skill_Deceleration;

   end Build_Pilot;
   --+--------

end Pilot;
