with Railroad;
with Railroad.Station;
with Railroad.Reporter;

package body Pilot is

   task body Pilot_T is
      -- numero del pilota
      Number             : Positive;
      -- nome del pilota
      Name               : String_Ref_T;
      -- parametro per la skill dell'accelerazione
      Skill_Acceleration : Skill_Acceleration_T;
      -- parametro per la skill della decellerazione
      Skill_Deceleration : Skill_Deceleration_T;
      -- auto del pilota
      Car                : Car_T;

      procedure Configure_Pilot;

      --+------------------
      procedure Configure_Pilot is
      begin
         Trip := To;
         Current_Home := Home;
         Current_Away := Away;
      end To_Work;
      --+------------------
      procedure Back_Home is
      begin
         Trip := Back;
         Current_Home := Away;
         Current_Away := Home;
      end Back_Home;
      --+------------------

      use Railroad.Station,
          Railroad.Reporter,
          Ada.Real_Time;
   begin --  TRAVELER_T
      Current_Home := Home;
      Current_Away := Away;
      loop
         case Trip is
            when To =>
               --+-----------------------------
               --  the away leg
               --+-----------------------------
               Report (Id, Current_Home, Current_Away);
               --  notify the departure station that the traveler
               --  wants to go to a specific destination
               Railway_Line (Current_Home).Transfer (Current_Away, Id);
               --  at this point the traveler has arrived at destination
               --  and prepares for return
               Back_Home;
            when Back =>
               --+------------------------
               --  the return leg
               --+------------------------
               Report (Id, Current_Home, Current_Away);
               --  notify the departure station that the traveler
               --  wants to go to a specific destination
               Railway_Line (Current_Home).Transfer (Current_Away, Id);
               --  at this point the traveler has arrived at destination
               --  and prepares for the next journey
               To_Work;
         end case;
         --  the traveler stays some time at the current destination
         Wake_Up := Wake_Up + Milliseconds (Interval);
         delay until Wake_Up;
      end loop;
   end Traveler_T;

end Railroad.Traveler;










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
