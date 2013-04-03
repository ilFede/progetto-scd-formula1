with Ada.Containers.Vectors;
with Ada.Calendar; use Ada.Calendar;

package Formula1.Subsegment is

   -- array di tempi
   type Time_Array_T is array(Positive range <>) of Time;

   -- risorsa protetta sottosegmento
   protected type Subsegment_T (Tot_Lanes : Num_Lanes_Seg_T) is

      -- procedura che mi restituisce il tempo di percoerrenza del segmento
      procedure Get_Driving_Time (Expected_Exit_Duration : in Duration; Real_Exit_Duration : out Duration);

   private

      -- Numero di corsie presenti nel sottosegmento
      Num_Lane_Subseg : Num_Lanes_Seg_T := Tot_Lanes;

      -- array per tenere gli istanti minimi di uscita dalle varie corsie
      Time_Array : Time_Array_T (1..Tot_Lanes) := (others => Clock);

   end Subsegment_T;

   -- accesso al segmento
   type Subsegment_Ref_T is access Subsegment_T;

   -- array che contiene i vari segmenti
   package Subsegment_Vector_T is new Ada.Containers.Vectors
     (Element_Type => Subsegment_Ref_T,
      Index_Type => Natural);

   -- riferimento per accedere all'array dei segmenti
   -- type Subsegment_Vector_Ref_T is access Subsegment_Vector_T.Vector;


end Formula1.Subsegment;
