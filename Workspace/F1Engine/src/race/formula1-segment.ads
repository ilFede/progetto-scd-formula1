with Formula1.SegmentRP; use Formula1.SegmentRP;
with Formula1; use Formula1;
with Ada.Containers.Vectors;


package Formula1.Segment is

   type Segment_T is
   -- parametri che caratterizzano un segmento
      record
         -- numero di segmento
	 Code              : Natural;
	 -- tipo di segmento
	 Tipology          : Segment_Type_T;
	 -- lunghezza del segmento
	 Length            : Real_T;
	 -- velocità del segmento
	 Speed             : Real_T;
	 -- numero di corsie
	 Tot_Lanes         : Num_Lanes_Seg_T;
	 -- flag per segmento con rilevamento tempi
	 Has_Time_Check : Has_Time_Check_T;
	 -- array che contiene i sottosegmenti del segmento
	 Segment_RP_Ref   : Segment_RP_Ref_T;
      end record;

   -- definizione del tipo array che contiene i vari segmenti
   package Segment_Vector_T is new Ada.Containers.Vectors
     (Element_Type => Segment_T,
      Index_Type   => Natural);

   -- riferimento per accedere all'array dei segmenti
   type Segment_Vector_Ref_T is access Segment_Vector_T.Vector;

end Formula1.Segment;
