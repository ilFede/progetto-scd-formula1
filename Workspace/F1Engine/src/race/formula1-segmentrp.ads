with Corba;
with Ada.Containers.Vectors;
with Ada.Calendar; use Ada.Calendar;

package Formula1.SegmentRP is

   -- array di tempi
   type Time_Array_T is array(Positive range <>) of Time;

   -- risorsa protetta sottosegmento
   protected type Segment_RP_T (Tot_Lanes : Num_Lanes_Seg_T) is

      -- procedura che mi restituisce il tempo di percoerrenza del segmento
      procedure Get_Driving_Time (Expected_Exit_Time : in Time; Real_Exit_Time : out Time);
      -- procedura per ottenere il ticket del segmento
      procedure Get_Ticket (My_Ticket : out Corba.Long);

   private

      -- Numero di corsie presenti nel sottosegmento
      Num_Lane_Subseg : Num_Lanes_Seg_T := Tot_Lanes;

      -- array per tenere gli istanti minimi di uscita dalle varie corsie
      Time_Array : Time_Array_T (1..Tot_Lanes) := (others => Clock);

      -- ticket assegnato al pilota
      Ticket : Corba.Long := 100000;

   end Segment_RP_T;

   -- accesso al segmento
   type Segment_RP_Ref_T is access Segment_RP_T;

end Formula1.SegmentRP;
