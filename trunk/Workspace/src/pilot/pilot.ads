package Pilot is

   --+---------------------------
   --  THE TRAVELER PROCESS CLASS
   --+---------------------------
   task type Pilot_T (         : Positive;
      Home, Away : Address_T;
      Interval   : Positive);

end Pilot;


with Common;

package Pilot is
   use Common;

   -- definizione del tipo pilot
   type Pilot_T is
   -- parametri che caratterizzano una vettura
      record
         -- numero del pilota
         Number : Positive;
         -- nome del pilota
	 Name       : String_Ref_T;
	 -- parametro per la skill dell'accelerazione
	 Skill_Acceleration : Skill_Acceleration_T;
	 -- parametro per la skill della decellerazione
	 Skill_Deceleration : Skill_Deceleration_T;
   end record;

   -- tipo per l'accesso a una variabile di tipo Car_T
   type Pilot_Ref_T is access Pilot_T;

   -- funzione per la creazione di una automobile
   procedure Build_Pilot (Pilot_Filename : in String; Race_Pilot : in out Pilot_T);

end Pilot;
