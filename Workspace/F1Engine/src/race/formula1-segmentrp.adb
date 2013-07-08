package body Formula1.SegmentRP is

   protected body Segment_RP_T is

      -- procedura che mi restituisce il tempo di percoerrenza del segmento
      procedure Get_Driving_Time (Expected_Exit_Time : in Time; Real_Exit_Time : out Time) is
      -- corsia che si libera prima
	 Num_Lane  : Positive := 1;
	 -- istante in cui si libera la corsia che si libera prima
	 Min_Time  : Time := Time_Array (1);
	 -- tempo di uscita del chiamante rispetto al clock della risorsa
	 -- Exit_Time : Time;
      begin
	 -- trova la corsia che si libera prima
	 for i in 2 .. Tot_Lanes loop
	    if (Time_Array (i) < Min_Time) then
	       Min_Time := Time_Array (i);
	       Num_Lane := i;
	    end if;
	 end loop;
         -- calcolo il tempo di uscita previsto con il clock del segmento come riferimento
	 Real_Exit_Time := Expected_Exit_Time;
         -- controllo se è possibile uscire a quell'istante o se mi devo accodare
	 if (Real_Exit_Time) <= Min_Time + Min_Gap then
	    Real_Exit_Time := Min_Time + Min_Gap;
	 end if;
	 -- aggiorno l'istante minimo di uscita dalla corsia
	 Time_Array (Num_Lane) := Real_Exit_Time;
	 -- aggiorno la durata dell'attraversamento del segmento
	 -- Real_Exit_Duration := Exit_Time - Clock;
	 -- Real_Exit_Duration := Exit_Time;
      end Get_Driving_Time;
      --+--------

      -- procedura per ottenere il ticket del segmento
      procedure Get_Ticket (My_Ticket : out Corba.Long) is
      begin
         -- decremento il ticket
         Ticket := Ticket - 1;
         My_Ticket := Ticket;
      end Get_Ticket;
      --+--------
   end Segment_RP_T;

end Formula1.SegmentRP;
