with Formula1;
with Ada.Text_IO;

procedure Main is

   Int : Integer := 8;
   Flo : Float := Float (Int);
begin
-- Race_Startup;
   Flo := Flo + Float(Int) + 0.4;
   Int := Integer(Flo);
   Flo := Flo + 0.3;
   Int := Integer(Flo);
   Ada.Text_IO.Put_Line ("Fatto!");
   null;
end Main;




