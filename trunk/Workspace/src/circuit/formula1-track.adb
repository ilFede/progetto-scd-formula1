with Formula1.Subsegment; use Formula1.Subsegment;

package body Formula1.Track is

   -- procedura per settare il circuito data una configurazione
   procedure Build_Track (Track_Filename : in String) is
      Start_Index           : Integer := 0;
      Stop_Index            : Integer := 0;
      N_Seg                 : Natural := 0;
      Segment_Vector_Ref    : Segment_Vector_Ref_T;
      Configuration     : Configuration_T.Vector;
   begin
      -- ottengo la configurazione
      Read_Config_File (Circuits_Set_Path & Track_Filename, Configuration);
      -- calcolo gli esremi per il ciclo
      Start_Index := Configuration.First_Index;
      Stop_Index := Configuration.Last_Index;
      -- creo l'array dei segmenti
      Segment_Vector_Ref := new Segment_Vector_T.Vector;
      -- inserisco i segmenti nell'array dei segmenti prendendoli dalla configurazione ricevuta in ingresso
      for I in Start_Index .. Stop_Index loop
	 declare
	    -- segmento da aggiungere
	    Segment                           : Segment_T;
	    -- parametri per descricere un segmento
	    Segment_Type                      : Segment_Type_T;
	    Segment_Code                      : Natural;
	    Segment_Speed                     : Real_T;
	    Segment_Leght                     : Real_T;
	    Segment_Has_Time_Check            : Has_Time_Check_T;
	    Segment_Tot_Lanes                 : Num_Lanes_Seg_T;
	    Segment_Tot_Subsegment            : Natural;
	    Segment_Subseg_Vect               : Subsegment_Vector_T.Vector;
	    String_Vector_Ref                 : String_Vector_Ref_T;
	    Segment_Test                      : Subsegment_Vector_T.Vector;
	 begin
	    -- ottengo il vettore coi parametri del segmento
	    String_Vector_Ref := Configuration.Element (I);
	    -- creo il codice del segmento, è un numero progressivo che parte da 0
	    Segment_Code := N_Seg;
	    -- estraggo i parametri del segmento dal Configuration_Ref
	    Segment_Type := Segment_Type_T'Value (String_Vector_Ref.all.Element (0).all);
	    Segment_Leght := Real_T'Value (String_Vector_Ref.all.Element (1).all);
	    Segment_Speed := Real_T'Value (String_Vector_Ref.all.Element (2).all);
	    Segment_Tot_Lanes := Integer'Value (String_Vector_Ref.all.Element (3).all);
	    Segment_Has_Time_Check := Has_Time_Check_T'Value (String_Vector_Ref.all.Element (4).all);
	    -- fine estrazione parametri del segmento
	    -- calcolo il numero di sottosegmenti
	    Segment_Tot_Subsegment := Natural(Segment_Leght / Subsegment_Lenght);
            -- controllo che ci sia almeno un sottosegmento
	    if Segment_Tot_Subsegment < 1 then
	       Segment_Tot_Subsegment := 1;
	    end if;
	    -- creo i sottosegmenti e li appendo al vettore Segment_Subseg_Vect
	    for J in Integer range 1 .. Segment_Tot_Subsegment loop
	       declare
		  -- sottosegmento da aggiungere
		  -- Subsegment_Ref : Subsegment_Ref_T := new Subsegment_T (Segment_Tot_Lanes);
		  Subsegment_Ref : Subsegment_Ref_T;
	       begin

		  -- Subsegment_Ref : Subsegment_Ref_T;
                  -- Subsegment.Tot_Lanes := Segment_Tot_Lanes;
		  Subsegment_Ref := new Subsegment_T (Segment_Tot_Lanes);
		  Segment_Subseg_Vect.Append (Subsegment_Ref);
	       end;
	    end loop;
	    -- configuro il segmento
	    Segment.Code := Segment_Code;
	    Segment.Tipology := Segment_Type;
	    Segment.Length := Segment_Leght;
	    Segment.Speed := Segment_Speed;
	    Segment.Tot_Lanes := Segment_Tot_Lanes;
	    Segment.Has_Time_Check := Segment_Has_Time_Check;
	    Segment.Tot_Subsegments := Segment_Tot_Subsegment;
	    Segment.Subsegment_List := Segment_Subseg_Vect;
	    -- creo il segmento e lo inserisco nell'array dei segmenti
	    -- Segment_Ref := new Segment_T'(
	    -- Code              => Segment_Code,
	    -- Tipology          => Segment_Type,
	    -- Lenght            => Segment_Leght,
	    -- Speed             => Segment_Speed,
	    -- Tot_Lanes         => Segment_Tot_Lanes,
	    -- Has_Time_Check    => Segment_Has_Time_Check,
	    -- Tot_Subsegments   => Segment_Tot_Subsegment,
	    -- Subsegment_List   => Segment_Subseg_Vect);
	    Track_Race.Segment_List.Append (Segment);
	    -- aggiorno il numero di segmenti del circuito
	    N_Seg := N_Seg + 1;
	    -- aggiorno la lunghezza del circuito
            Track_Race.Lap_Length := Track_Race.Lap_Length + Segment.Length;
	 end;
      end loop;
      -- sottraggo la corsia dei box (che è lunga come il rettilineo) dalla lunghezza del circuito
      Track_Race.Lap_Length := Track_Race.Lap_Length - (Track_Race.Segment_List.Element (0).Length + Track_Race.Segment_List.Element (1).Length + Track_Race.Segment_List.Element (2).Length);
      -- configuro il circuito
      Track_Race.Tot_Segments := N_Seg;
      -- Track_Race.Segment_List_Ref := Segment_Vector_Ref;
   end Build_Track;
   --+------------

end Formula1.Track;
