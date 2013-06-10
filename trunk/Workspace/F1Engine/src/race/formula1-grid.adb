package body Formula1.Grid is
-- risorsa protetta griglia di partenza
   protected body Grid_T is
   -- accodamento sul rettilineo
      entry Place_On_Grid when true is
      begin
	 Actual_Num_Pilots_On_Grid := Actual_Num_Pilots_On_Grid + 1;
	 requeue Wait_To_Start;
      end Place_On_Grid;

      entry Wait_To_Start when On_Race is
      begin
	 null;
      end Wait_To_Start;

      entry Wait_To_Pilots when Actual_Num_Pilots_On_Grid = Expected_Num_Pilots_On_Grid is
      begin
	 null;
      end Wait_To_Pilots;

      procedure Start_Race is
      begin
	 On_Race := true;
      end Start_Race;

      procedure Set_Num_Pilots (Num : in  Integer) is
      begin
	 Expected_Num_Pilots_On_Grid := Num;
      end Set_Num_Pilots;

   end Grid_T;

end Formula1.Grid;

