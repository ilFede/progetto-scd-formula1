with Formula1.Startup;

with Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Formula1; use Formula1;
--with Formula1; use Formula1;

procedure Main is

   Int : Integer := 8;
   Flo : Float := Float (Int);
   Timee : Time := Clock;
   Speed : Real_T;
   Distance : Real_T;
begin
-- Race_Startup;
   Speed := Real_T(345.546456);
   Distance := Real_T(34324.24324324);
   Flo := Flo + Float(Int) + 0.4;
   Int := Integer(Flo);
   Flo := Flo + 0.3;
   Int := Integer(Flo);
   Ada.Text_IO.Put_Line ("Fatto!");
   null;
end Main;




