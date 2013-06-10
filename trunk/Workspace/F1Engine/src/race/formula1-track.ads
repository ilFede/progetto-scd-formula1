with Ada.Containers.Vectors;
with Formula1;
with Formula1.Segment; use Formula1.Segment;
-- with Formula1.Subsegment;
with Formula1.Grid; use Formula1.Grid;
package Formula1.Track is

   -- definizione del tipo di record che rappresenta un circuito
   type Track_T is
   -- parametri che caratterizzano un circuito
   record
      -- nome del circuito
      Name : String_Ref_T;
      -- numero dei segmenti
      Tot_Segments : Natural;
      -- array dei segmenti
      Segment_List : Segment_Vector_T.Vector;
      -- griglia di partenza
      Grid_Ref : Grid_Ref_T;
      -- lunghezza del circuito
      Lap_Length : Real_T;
   end record;

   -- procedura per configurare il circuito partendo da una configurazione
   procedure Build_Track (Track_Filename : in String);

   -- entità che rappresenta il circuito
   Track_Race : Track_T;

end Formula1.Track;
