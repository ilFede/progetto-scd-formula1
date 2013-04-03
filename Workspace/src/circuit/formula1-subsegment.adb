package body Formula1.Subsegment is

   protected body Subsegment_T is

      procedure Get_Driving_Time (Expected_Exit_Duration : in Duration; Real_Exit_Duration : out Duration) is
      -- corsia che si libera prima
	 Num_Lane  : Positive := 1;
	 -- istante in cui si libera la corsia che si libera prima
	 Min_Time  : Time := Time_Array (1);
	 -- tempo di uscita del chiamante rispetto al clock della risorsa
	 Exit_Time : Time;
      begin
	 -- trova la corsia che si libera prima
	 for i in 2 .. Tot_Lanes loop
	    if (Time_Array (i) < Min_Time) then
	       Min_Time := Time_Array (i);
	       Num_Lane := i;
	    end if;
	 end loop;
         -- calcolo il tempo di uscita previsto con il clock del segmento come riferimento
	 Exit_Time := Expected_Exit_Duration + Clock;
         -- controllo se è possibile uscire a quell'istante o se mi devo accodare
	 if (Exit_Time) <= Min_Time then
	    Exit_Time := Min_Time + Min_Gap;
	 end if;
	 -- aggiorno l'istante minimo di uscita dalla corsia
	 Time_Array (Num_Lane) := Exit_Time;
	 -- aggiorno la durata dell'attraversamento del segmento
	 Real_Exit_Duration := Exit_Time - Clock;
      end Get_Driving_Time;
      --+--------

   end Subsegment_T;

end Formula1.Subsegment;
