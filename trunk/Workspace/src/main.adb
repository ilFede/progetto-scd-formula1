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
   -- configurazione di un pilota
   Pilot_Configuration : Configuration_T.Vector;
   -- vettore di piloti
   Pilot_Vett : Pilot_Vector_T.Vector;
begin
   null;
   -- costrisco il circuito
   Build_Race (Race_Config_Path & Race_Config_Filename);
   -- istanzio e configuro i piloti
   Read_Config_File(Race_Config_Path & Competitors_Config_Filename, Pilot_Configuration);
   -- per ogni pilota creo il task e carico la strategia

   for I in Pilot_Configuration.First_Index .. Pilot_Configuration.Last_Index loop
      declare
	 Configuration       : String_Vector_Ref_T := Pilot_Configuration.Element (I);
	 Strategy            : Float_Vector_Ref_T := new Float_Vector_T.Vector;
         Pilot_Ref : Pilot_Ref_T;
	 Pilot_Name_Filename : String_Ref_T := Configuration.Element (0);
	 Pilot_Car_Filename  : String_Ref_T := Configuration.Element (1);
      begin
	 -- leggo la stetegia
	 for J in 2 .. Configuration.Last_Index loop
	    Strategy.Append (Float'Value (Configuration.Element (J).all));
	 end loop;
	 -- creo il pilota e lo appendo al vettore di piloti
         Pilot_Ref := new Pilot_T (Pilot_Name_Filename, Pilot_Car_Filename, Strategy);
	 Pilot_Vett.Append (Pilot_Ref);
	 null;
      end;
   end loop;


   null;


   -- Plt_Ref := Build_Pilot("Vettel.plt");
   -- Car_Ref := Build_Car("Redbull.car");
   null;
   -- configuro il circuito
   -- Build_Track("");
   -- CircuitTrack.CircuitConfig;
   -- Put_Line("dadsdsad");
   -- Circuit_Config;
   -- Put_Line("dadsdsad");
   --test := new Race_Pilot (8);

end Main;
