package body Formula1.Subsegment is

   protected body Subsegment_T is

      procedure Get_Driving_Time (Exit_Duration : in out Duration) is
         -- corsia che si libera prima
	 Num_Lane : Positive := 1;
         -- istante in cui si libera la corsia che si libera prima
	 Min_Time : Time := Time_Array(1);
         -- tempo di uscita del chiamante rispetto al clock della risorsa
         Exit_Time : Time;
      begin
         -- trova la corsia che si libera prima
	 for i in 2 .. Tot_Lanes loop
	    if (Time_Array(i) < Min_Time) then
	       Min_Time := Time_Array(i);
	       Num_Lane := i;
	    end if;
	 end loop;

                  Exit_Time := Exit_Duration + Clock;

	 if (Exit_Time) <= Min_Time then
	    Exit_Time := Min_Time + Min_Gap;
            Time_Array(Num_Lane) := Clock + Exit_Duration;
         end if;
         -- aggirno la durata dell'attraversamento del segmento
         Exit_Duration := Clock - Exit_Time;
      end Get_Driving_Time;
      --+--------

   end Subsegment_T;

end Formula1.Subsegment;
