package Subsegment.Segment is

   type Subsegment_T (num_lane_subseg_p : Num_Lane_Seg_T) is
      -- array che contiene i sottosegmenti del segmento
      Subsegment_Vectors : Subsegment_Vector.Vector;

      -- numero di corsie
      Num_Lane : Num_Lane_Seg_T;

      -- procedura per la creazione dei sottosegmenti
      procedure Create_Subsegments (N_Subseg : Positive);


end Subsegment.Segment;
