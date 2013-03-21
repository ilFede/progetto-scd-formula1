with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Containers;
with Ada.Containers.Vectors;

package Formula1.Pilot is

   -- task per descrivere il pilota
   task type Pilot_T (Pilot_Config_File_Ref : String_Ref_T;
		      Car_Config_File_Ref : String_Ref_T;
		      Strategy          : Float_Vector_Ref_T);

   -- tipo per l'accesso a una variabile di tipo Pilot_T
   type Pilot_Ref_T is access Pilot_T;

   -- vettore per i piloti
   package Pilot_Vector_T is new Ada.Containers.Vectors
     (Element_Type => Pilot_Ref_T,
      Index_Type   => Natural);

end Formula1.Pilot;
