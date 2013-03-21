with Ada.Containers.Vectors;
with Common;

package Formula1.Subsegment is
   use Common;

   -- risorsa protetta sottosegmento
   protected type Subsegment_T (Tot_Lanes : Num_Lanes_Seg_T) is

      -- entry per entrare nel sottosegmento
      entry Enter_Subsegment (Num_Subsegment_Lane : in out Num_Lanes_Seg_T);

      -- entry per uscire dal sottosegmento
      entry Leave_Subsegment (Num_Subsegment_Lane : in out Num_Lanes_Seg_T);

   private
      -- entry per entrare nel corsia 1 del sottosegmento
      entry Enter_Subsegment_Lane1;

      -- entry per entrare nel corsia 2 del sottosegmento
      entry Enter_Subsegment_Lane2;

      -- Numero di corsie presenti nel sottosegmento
      Num_Lane_Subseg : Num_Lanes_Seg_T := Tot_Lanes;

      -- numero di piloti presenti nella corsia 1 del sottosegmento
      Pilot_In_Subsegment_Lane1 : Integer := 0;

      -- numero di piloti presenti nella corsia 2 del sottosegmento
      Pilot_In_Subsegment_Lane2 : Integer := 0;
   end Subsegment_T;

   -- accesso al segmento
   type Subsegment_Ref_T is access Subsegment_T;

   -- array che contiene i vari segmenti
   package Subsegment_Vector_T is new Ada.Containers.Vectors
     (Element_Type => Subsegment_Ref_T,
      Index_Type => Natural);

   -- riferimento per accedere all'array dei segmenti
   -- type Subsegment_Vector_Ref_T is access Subsegment_Vector_T.Vector;


end Subsegment;
