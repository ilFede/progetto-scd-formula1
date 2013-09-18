with Formula1.Startup;

with Ada.Command_Line;
use Ada.Command_Line;


with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;
with Formula1.Startup; use Formula1.Startup;
with Formula1; use Formula1;
with Corba; Use Corba;
with ada.numerics.discrete_random;


procedure Main is
   Filename   : String := "ior.txt";
   File       : Ada.Text_IO.File_Type;
   Line_Count : Natural := 0;
   IOR_Str_Ref : String_Ref_T := new String'("");
   Race_Config_Filename_Ref : String_Ref_T;
   NowTime : Time := Clock;
   type Rand_Draw is range 1..99;
   package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Draw);

begin
   Ada.Text_IO.Open (File => File,
                     Mode => Ada.Text_IO.In_File,
                     Name => IOR_Set_Path & Filename);

   while not Ada.Text_IO.End_Of_File (File) loop
      declare
         Line : String := Ada.Text_IO.Get_Line (File);
      begin
         IOR_Str_Ref := new String'(IOR_Str_Ref.all & Line);
      end;
   end loop;
   Ada.Text_IO.Close (File);
   Race_Config_Filename_Ref := new String'(Ada.Command_Line.Argument (1));
   Race_Startup (Race_Config_Filename_Ref, IOR_Str_Ref);

end Main;




