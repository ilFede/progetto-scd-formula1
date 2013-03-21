with Ada.Containers.Vectors;
with Common;
with Segment;
with Subsegment;

package Formula1.Track is
   use Common;
   use Segment;
   use Subsegment;

   -- definizione del tipo di record che rappresenta un circuito
   type Track_T is
   -- parametri che caratterizzano un circuito
   record
      -- numero dei segmenti
      Tot_Segments : Natural;
      -- array dei segmenti
      Segment_List : Segment_Vector_T.Vector;
      -- lunghezza del circuito
      Lap_Length : Positive;
   end record;

   -- tipo per l'accesso ad un circuito
   type Track_Ref_T is access Track_T;

   -- procedura per configurare il circuito partendo da una configurazione
   procedure Build_Track (Track_Filename : in String);

   -- entità che rappresenta il circuito
   Track_Race : Track_T;

end Formula1.Track;
