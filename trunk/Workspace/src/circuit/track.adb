package body Track is

   -- procedura per settare il circuito data una configurazione
   function Build_Track (Track_Filename : String) return Track_Ref_T is
      Start_Index : Integer := 0;
      Stop_Index : Integer := 0;
      N_Seg                 : Natural := 0;
      Segment_Vector_Ref    : Segment_Vector_Ref_T;
      Configuration_Ref     : Configuration_Ref_T;
   begin
      -- ottengo la configurazione
      Configuration_Ref := Read_Config_File (Circuits_Set_Path & Track_Filename);
      -- calcolo gli esremi per il ciclo
      Start_Index := Configuration_Ref.all.First_Index;
      Stop_Index := Configuration_Ref.all.Last_Index;
      -- creo l'array dei segmenti
      Segment_Vector_Ref := new Segment_Vector_T.Vector;
      -- inserisco i segmenti nell'array dei segmenti prendendoli dalla configurazione ricevuta in ingresso
      for I in Start_Index .. Stop_Index loop
	 declare
	    -- parametri per descricere un segmento
	    Segment_Type                      : Segment_Type_T;
	    Segment_Code                      : Natural;
	    Segment_Speed                     : Speed_T;
	    Segment_Leght                     : Positive;
	    Segment_Has_Time_Check         : Has_Time_Check_T;
	    Segment_Tot_Lanes                 : Num_Lanes_Seg_T;
	    Segment_Tot_Subsegment            : Natural;
	    Segment_Subseg_Vect_Ref           : Subsegment_Vector_Ref_T;
	    String_Vector_Ref                 : String_Vector_Ref_T;
	    Segment_Ref                       : Segment_Ref_T;
	 begin
	    -- ottengo il vettore coi parametri del segmento
	    String_Vector_Ref := Configuration_Ref.all.Element (I);
            -- creo il codice del segmento, è un numero progressivo che parte da 0
	    Segment_Code := N_Seg;
	    -- estraggo i parametri del segmento dal Configuration_Ref
	    Segment_Type := Segment_Type_T'Value (String_Vector_Ref.all.Element (0).all);
	    Segment_Leght := Integer'Value (String_Vector_Ref.all.Element (1).all);
	    Segment_Speed := Float'Value (String_Vector_Ref.all.Element (2).all);
	    Segment_Tot_Lanes := Integer'Value (String_Vector_Ref.all.Element (3).all);
	    Segment_Has_Time_Check := Has_Time_Check_T'Value (String_Vector_Ref.all.Element (4).all);
            -- fine estrazione parametri del segmento
            -- calcolo il numero di sottosegmenti
	    Segment_Tot_Subsegment := Segment_Leght / Subsegment_Lengh;
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
				   Code              => Segment_Code,
				   Tipology          => Segment_Type,
				   Lenght            => Segment_Leght,
				   Speed             => Segment_Speed,
				   Tot_Lanes         => Segment_Tot_Lanes,
				   Has_Time_Check => Segment_Has_Time_Check,
				   Tot_Subsegments   => Segment_Tot_Subsegment,
				   Subsegment_List   => Segment_Subseg_Vect_Ref);
	    Segment_Vector_Ref.all.Append (Segment_Ref);
	    -- aggiorno il numero di segmenti del circuito
	    N_Seg := N_Seg + 1;
	 end;
      end loop;
      -- configuro il circuito
      -- salvo il numero di segmenti
      return new Track_T'(Tot_Segments => N_Seg, Segment_List_Ref => Segment_Vector_Ref);
   end Build_Track;
   --+------------

end Track;
