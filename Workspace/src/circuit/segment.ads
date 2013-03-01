with Subsegment;
use Subsegment;
with Common;
with Ada.Containers.Vectors;


package Segment is
   use Subsegment;
   use Common;

   type Segment_T is
   -- parametri che caratterizzano un segmento
      record
         -- numero di segmento
	 Code              : Natural;
	 -- tipo di segmento
	 Tipology          : Segment_Type_T;
	 -- lunghezza del segmento
	 Lenght            : Positive;
	 -- velocità del segmento
	 Speed             : Speed_T;
	 -- numero di corsie
	 Tot_Lanes         : Num_Lanes_Seg_T;
	 -- flag per segmento con rilevamento tempi
	 Has_Time_Check : Has_Time_Check_T;
	 -- numero di sottosegmenti del segmento
	 Tot_Subsegments   : Positive;
	 -- array che contiene i sottosegmenti del segmento
	 Subsegment_List   : Subsegment_Vector_T.Vector;
      end record;

   -- tipo puntatore a Segment_T
   -- type Segment_Ref_T is access Segment_T;

   -- definizione del tipo array che contiene i vari segmenti
   package Segment_Vector_T is new Ada.Containers.Vectors
     (Element_Type => Segment_T,
      Index_Type   => Natural);

   -- riferimento per accedere all'array dei segmenti
   type Segment_Vector_Ref_T is access Segment_Vector_T.Vector;

   --  procedure per accedere ad un sottosegmento
   procedure Enter_Subsegment (Segment : in out Segment_T; Num_Subsegment_Lane : in out positive; Subsegment_Index : in positive);

   -- procedure per lasciare un sottosegmento
   procedure Leave_Subsegment (Segment : in Segment_T; Num_Subsegment_Lane : in out positive; Subsegment_Index : in positive);

   -- restituisce il numero di sottosegmenti
   -- function Get_Subsegment_Numb (Segment : Segment_T) return Positive;

   -- procedura per la creazione del tracciato
   -- procedure Create_Track;

private
   -- procedura per la creazione dei sottosegmenti
   -- procedure Configure_Segment (Segment : in out Segment_T; N_Subseg : in Positive; N_Lanes : Num_Lanes_Seg_T);



end Segment;
