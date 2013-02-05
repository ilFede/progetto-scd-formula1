package body Subsegment is

   protected body Subsegment_T is

      -- il pilota tenta di entrare nel segmento
      entry Enter_Subsegment (Num_Subsegment_Lane : in out Num_Lanes_Seg_T) when true is
      begin
         -- se il pilota entra nel segmento incremento il numero di piloti nel segmento
         if (Enter_Subsegment_Lane1'count < Enter_Subsegment_Lane2'count) then
           -- riaccodo nella corsia 1
           requeue Enter_Subsegment_Lane1;
         else
           requeue Enter_Subsegment_Lane1;
         end if;
      end Enter_Subsegment;
      --+--------

      --  il pilota esce dal segmento
      entry Leave_Subsegment (Num_Subsegment_Lane : in out Num_Lanes_Seg_T) when true is
      begin
         -- controllo in che corsia sono
         if (Num_Subsegment_Lane = 1) then
            -- libero la corsia 1
            Pilot_In_Subsegment_Lane1 := Pilot_In_Subsegment_Lane1 - 1;
     	 else
            -- libero la corsia 2
            Pilot_In_Subsegment_Lane2 := Pilot_In_Subsegment_Lane2 - 1;
         end if;
      end Leave_Subsegment;
      --+------------

      -- entry per entrare nel corsia 1 del sottosegmento
      entry Enter_Subsegment_Lane1 when Pilot_In_Subsegment_Lane1 < 1 is
      begin
         Pilot_In_Subsegment_Lane1 := Pilot_In_Subsegment_Lane1 + 1;
      end Enter_Subsegment_Lane1 ;
      --+------------

      -- entry per entrare nel corsia 2 del sottosegmento
      entry Enter_Subsegment_Lane2 when Pilot_In_Subsegment_Lane2 < 1 is
      begin
         Pilot_In_Subsegment_Lane2 := Pilot_In_Subsegment_Lane2 + 1;
      end Enter_Subsegment_Lane2 ;
      --+------------

   end Subsegment_T;

end Subsegment;
