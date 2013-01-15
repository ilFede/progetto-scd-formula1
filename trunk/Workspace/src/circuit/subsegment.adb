package body Subsegment is

   protected body Subsegment_T is

      -- il pilota tenta di entrare nel segmento
      entry Enter_Subsegment
         when Pilot_In_Subsegment <= Subsegment_Molt is
      begin
         -- se il pilota entra nel segmento incremento il numero di piloti nel segmento
         Pilot_In_Subsegment := Pilot_In_Subsegment + 1;
         -- riaccodo nella coda di uscita
         requeue Leave_Subsegment;
      end Enter_Subsegment;
      --+--------

      --  il pilota esce dal segmento
      entry Leave_Subsegment when true is
      begin
         -- viene diminuito il numero di piloti nel segmento
         Pilot_In_Subsegment := Pilot_In_Subsegment - 1;
      end Leave_Subsegment;
      --+------------

   end Subsegment_T;

end Subsegment;
