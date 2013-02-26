with Common;
with Race;
with Ada.Text_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Pilot;
with Car;

procedure Main is
   use Ada.Text_IO;
   use Race;
   use Common;
use Pilot;
use Car;

   --Easy : Race_Pilot (1);
   Test    : String_Vector_Ref_T;
   Str1    : String := "    sdfsfdfd sdfgds   ";
   Str2    : String := "    ";
   Str3    : String := "";
   StrTr1  : String := Trim (Str1, Both);
   StrTr2  : String := Trim (Str2, Both);
   StrTr3  : String := Trim (Str3, Both);
   LenStr2 : Integer := StrTr2'Length;
   LenStr3 : Integer := StrTr3'Length;
   --Plt_Ref : Pilot_Ref_T;
   Car_Ref : Car_Ref_T;

begin
   Test := String_Tokenizer ("100 200 300 # 3443 - 342");
   null;
   --Build_Race (Race_Config_Path & "race.conf");
   -- Plt_Ref := Build_Pilot("Vettel.plt");
   Car_Ref := Build_Car("Redbull.car");
   null;
   -- configuro il circuito
   -- Build_Track("");
   -- CircuitTrack.CircuitConfig;
   -- Put_Line("dadsdsad");
   -- Circuit_Config;
   -- Put_Line("dadsdsad");
   --test := new Race_Pilot (8);

end Main;
