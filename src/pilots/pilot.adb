with Ada.Text_IO;
package body Pilot is

   task body Race_Pilot is

   procedure Pilot_On_grid is
      use Circuit.Track;
   begin
      On_Grid;
   end Pilot_On_Grid;

   use Ada.Text_IO;
   begin
      Put_Line("Mi schiero nella griglia");
      Pilot_On_grid;
      Put_Line("Sono partito!!!!!");
   end Race_Pilot;

end Pilot;

