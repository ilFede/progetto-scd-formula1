with Race;
with Ada.Text_IO;
with Common;
procedure Main is
   --use Pilot;
   use Ada.Text_IO;
   use Race;
   use Common;

   --Easy : Race_Pilot (1);
   Test : String_Vector_Ref_T;
   ciao : Natural;

   begin
      Test := String_Tokenizer("100 200 300 # 3443 - 342");
      ciao :=9 ;
      null;
      -- configuro il circuito
      -- Build_Track("");
      -- CircuitTrack.CircuitConfig;
      -- Put_Line("dadsdsad");
      -- Circuit_Config;
      -- Put_Line("dadsdsad");
      --test := new Race_Pilot (8);

end Main;
