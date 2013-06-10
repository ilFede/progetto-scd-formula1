package Formula1.Grid is

   -- risorsa protetta griglia di partenza
   protected type Grid_T is
      entry Place_On_Grid;
      entry Wait_To_Start;
      entry Wait_To_Pilots;
      procedure Start_Race;
      procedure Set_Num_Pilots (Num : in  Integer);

   private

      On_Race                     : Boolean := false;
      Expected_Num_Pilots_On_Grid : Integer := 0;
      Actual_Num_Pilots_On_Grid   : Integer := 0;

   end Grid_T;

   type Grid_Ref_T is access Grid_T;

end Formula1.Grid;
