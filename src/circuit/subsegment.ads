with Ada.Containers.Vectors;

package Subsegment is

   -- tipo del segmento
   type Subsegment_Type_T is (First, Last, Central);

   -- sottotipo per il numero di corsie del segmento e sottosegmento
   subtype Num_Lane_Seg_T is Positive range 1..2;

   -- tipo per la lunghezza del sottosegmento
   subtype Subsegment_Length_T is Positive range 1..Positive'Last;

   -- tipo per indicizzae i sottosegmenti
   subtype Subsegment_Index_T is Positive range 1..Positive'Last;

   -- tipo per la velocità
   subtype Speed_T is Positive range 1..Positive'Last;

   -- risorsa protetta sottosegmento
   protected type Subsegment_T (num_lane_subseg_p : Num_Lane_Seg_T) is

      -- entry per entrare nel sottosegmento
      entry Enter_Subsegment;
      --  entry per uscire dal sottosegmento
      entry Leave_Subsegment;

   private
      Num_Lane_Subseg : Num_Lane_Seg_T := num_lane_subseg_p;
      Pilot_In_Subsegment : Integer := 0;
      Subsegment_Molt : Num_Lane_Seg_T := num_lane_subseg_p;
   end Subsegment_T;

   -- accesso al segmento
   type Subsegment_Ref_T is access Subsegment_T;

   -- array che contiene i vari segmenti
   package Subsegment_Vector is new Ada.Containers.Vectors
     (Element_Type => Subsegment_Ref_T,
      Index_Type => Subsegment_Index_T);

end Subsegment;
