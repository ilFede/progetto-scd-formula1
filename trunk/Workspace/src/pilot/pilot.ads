with Common;
with Race;
with Car;
with Ada.Numerics.Generic_Elementary_Functions;

package Pilot is
   use Common;
   use Car;
   use Race;

   -- task per descrivere il pilota
   task type Pilot_T (Pilot_Config_File_Ref : String_Ref_T;
		      Car_Config_File_Ref : String_Ref_T;
		      Stategy          : Integer);

   -- tipo per l'accesso a una variabile di tipo Car_T
   type Pilot_Ref_T is access Pilot_T;

end Pilot;
