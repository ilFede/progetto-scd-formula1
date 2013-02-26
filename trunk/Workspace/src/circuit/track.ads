with Ada.Containers.Vectors;
with Segment;
with Subsegment;
with Common;

package Track is
   use Segment;
   use Subsegment;
   use Common;

   -- definizione del tipo di record che rappresenta un circuito
   type Track_T is
   -- parametri che caratterizzano un circuito
   record
      -- numero dei segmenti
      Tot_Segments : Natural;
      -- array dei segmenti
      Segment_List_Ref : Segment_Vector_Ref_T;
   end record;

   -- tipo per l'accesso ad un circuito
   type Track_Ref_T is access Track_T;

   -- procedura per configurare il circuito partendo da una configurazione
   function Build_Track (Track_Filename : String) return Track_Ref_T;

   -- entità che rappresenta il circuito
   Track : Track_T;

end Track;
