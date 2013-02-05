package body Track is

   -- procedura per otttenere una configurazione da un file di testo
   function Get_Config (Filename : in String) return Configuration_Ref_T is
   begin
      return Read_Config_File (Filename);
   end Get_Config;
   --+------------

   -- procedura per settare il circuito data una configurazione
   procedure Build_Track (Track : in out Track_T; Configuration_Ref : in Configuration_Ref_T) is
      N_Seg                 : Natural := 0;
      Segment_Vector_Ref    : Segment_Vector_Ref_T;
   begin
      -- creo l'array dei segmenti
      Segment_Vector_Ref := new Segment_Vector_T.Vector;
      -- inserisco i segmenti nell'array dei segmenti prendendoli dalla configurazione ricevuta in ingresso
      for I in  Integer range Configuration_Ref.all.First_Index  .. Configuration_Ref.all.Last_Index loop
	 declare
	    -- parametri per descricere un segmento
	    Segment_Type                      : Segment_Type_T;
	    Segment_Code                      : Natural;
	    Segment_Speed                     : Speed_T;
	    Segment_Leght                     : Positive;
	    Segment_Performance_Coeff         : Performance_Coeff_T;
	    Segment_Tot_Lanes                 : Num_Lanes_Seg_T;
	    Segment_Tot_Subsegment            : Natural;
	    Segment_Subseg_Vect_Ref           : Subsegment_Vector_Ref_T;
	    String_Vector_Ref                 : String_Vector_Ref_T;
	    Segment_Ref                       : Segment_Ref_T;
	 begin
	    -- ottengo il vettore coi parametri del segmento
	    String_Vector_Ref := Configuration_Ref.all.Element (I);
	    -- aggiorno il numero di segmenti del circuito
	    N_Seg := N_Seg + 1;
	    -- estraggo i parametri del segmento
	    Segment_Type := Integer'Value (String_Vector_Ref.all.Element (1).all);
	    Segment_Code := Positive'Value (String_Vector_Ref.all.Element (2).all);
	    Segment_Speed := Float'Value (String_Vector_Ref.all.Element (3).all);
	    Segment_Performance_Coeff := Integer'Value (String_Vector_Ref.all.Element (4).all);
	    Segment_Leght := Integer'Value (String_Vector_Ref.all.Element (5).all);
	    Segment_Tot_Lanes := Integer'Value (String_Vector_Ref.all.Element (6).all);
	    Segment_Tot_Subsegment := Segment_Leght;
	    Segment_Subseg_Vect_Ref := new Subsegment_Vector_T.Vector;
	    -- creo i sottosegmenti
	    for J in Integer range 1 .. Segment_Tot_Subsegment loop
	       declare
		  Subsegment_Ref : Subsegment_Ref_T;
	       begin
		  Subsegment_Ref := new Subsegment_T (Segment_Tot_Lanes);
		  Segment_Subseg_Vect_Ref.all.Append (Subsegment_Ref);
	       end;
	    end loop;
	    -- creo il segmento e lo inserisco nell'array dei segmenti
	    Segment_Ref := new Segment_T'(
				   Tipology          => Segment_Type,
				   Code              => Segment_Code,
				   Speed             => Segment_Speed,
				   Lenght            => Segment_Leght,
				   Performance_Coeff => Segment_Performance_Coeff,
				   Tot_Lanes         => Segment_Tot_Lanes,
				   Tot_Subsegments   => Segment_Tot_Subsegment,
				   Subsegment_List   => Segment_Subseg_Vect_Ref);

	    Segment_Vector_Ref.all.Append (Segment_Ref);
	 end;
      end loop;
      -- configuro il circuito
      -- leggo
      Track.Tot_Segments := N_Seg;
      Track.Segment_List_Ref := new Segment_Vector_T.Vector;
   end Build_Track;
   --+------------

end Track;
