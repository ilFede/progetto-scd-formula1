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

   -- tipo per l'accesso al circuito
   type Track_Ref_T is access Track_T;

   -- funzione per ottenere una configurazione leggendola da file
   function Get_Config (Filename : String) return Configuration_Ref_T;

   -- procedura per configurare il circuito partendo da una configurazione
   procedure Build_Track (Track : in out Track_T; Configuration_Ref : in Configuration_Ref_T);

   -- entità che rappresenta il circuito
   Race_Track : Track_T;
end Track;
