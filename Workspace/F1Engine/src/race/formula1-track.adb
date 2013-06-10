with Formula1.SegmentRP; use Formula1.SegmentRP;

package body Formula1.Track is

   -- procedura per settare il circuito data una configurazione
   procedure Build_Track (Track_Filename : in String) is
      Start_Index           : Integer := 0;
      Stop_Index            : Integer := 0;
      N_Seg                 : Natural := 0;
      -- Segment_Vector_Ref    : Segment_Vector_Ref_T;
      Configuration         : Configuration_T.Vector;
   begin
      -- ottengo la configurazione
      Read_Config_File (Circuits_Set_Path & Track_Filename, Configuration);
      -- calcolo gli esremi per il ciclo
      Start_Index := Configuration.First_Index;
      Stop_Index := Configuration.Last_Index;
      -- Prendo il nome del circuito
      -- inserisco il nome del circuito che può essere formato da più parole
      declare
	 Circuit_Name_Ref        : String_Ref_T := new String'("");
	 String_Vector_Ref_01    : String_Vector_Ref_T := Configuration.Element (0);
      begin
	 for J in String_Vector_Ref_01.all.First_Index .. String_Vector_Ref_01.all.Last_Index loop
	    declare
	       Tmp              : String := String_Vector_Ref_01.all.Element (J).all;
	    begin
	       Circuit_Name_Ref := new String '(Circuit_Name_Ref.all & Tmp & " ");
	    end;
	 end loop;
	 Track_Race.Name := Circuit_Name_Ref;
      end;
      -- inserisco i segmenti nell'array dei segmenti prendendoli dalla configurazione ricevuta in ingresso
      for I in Start_Index + 1 .. Stop_Index loop
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
	    -- Segment_RP_Ref               : Segment_RP_T_Ref;
	    String_Vector_Ref                 : String_Vector_Ref_T;
	    -- Segment_Test                      : Subsegment_Vector_T.Vector;
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
	    -- configuro il segmento
	    Segment.Code := Segment_Code;
	    Segment.Tipology := Segment_Type;
	    Segment.Length := Segment_Leght;
	    Segment.Speed := Segment_Speed;
	    Segment.Tot_Lanes := Segment_Tot_Lanes;
	    Segment.Has_Time_Check := Segment_Has_Time_Check;
            Segment.Segment_RP_Ref := new Segment_RP_T (Segment_Tot_Lanes);
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
      -- aggiungo la griglia di partenza
      Track_Race.Grid_Ref := new Grid_T;
   end Build_Track;
   --+------------

end Formula1.Track;
