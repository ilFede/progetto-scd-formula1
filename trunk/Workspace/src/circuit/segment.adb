package body Segment is

   --  procedure per accedere ad un sottosegmento
   procedure Enter_Subsegment (Segment : in out Segment_T; Num_Subsegment_Lane : in out positive; Subsegment_Index : in positive) is
   begin
      Segment.Subsegment_List.Element(Subsegment_Index).all.Enter_Subsegment(Num_Subsegment_Lane);
   end Enter_Subsegment;
   --+------------

   -- entry per lasciare un sottosegmento
   procedure Leave_Subsegment (Segment : in Segment_T; Num_Subsegment_Lane : in out positive; Subsegment_Index : in positive) is
   begin
      Segment.Subsegment_List.Element(Subsegment_Index).all.Leave_Subsegment(Num_Subsegment_Lane);
   end Leave_Subsegment;
   --+------------

   -- restituisce il numero di sottosegmenti
   function Get_Subsegment_Numb (Segment : Segment_T) return positive is
   begin
      return Segment.Tot_Subsegments;
   end Get_Subsegment_Numb;
   --+------------

   -- procedure per la configurazione del circuito
   procedure Create_Track is
   begin
      null;
   end Create_Track;
   --+------------

   -- procedure per la configurazione del segmento
   procedure Configure_Segment (Segment : in out Segment_T; N_Subseg : in Positive; N_Lanes : Num_Lanes_Seg_T) is
   begin
      -- configuro i parametri che caratterizzano i segmento
      Segment.Tot_Lanes := N_Lanes;
      Segment.Tot_Subsegments := N_Subseg;
      -- creo i sottosegmenti
      for I in Integer range 1 .. N_Subseg loop
	 Segment.Subsegment_List.Append(new Subsegment_T(N_Lanes));
      end loop;
   end Configure_Segment;
   --+------------

end Segment;
