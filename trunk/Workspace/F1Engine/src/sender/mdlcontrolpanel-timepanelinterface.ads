pragma Style_Checks ("NM32766");
---------------------------------------------------
--  This file has been generated automatically from
--  MDLControlPanel.idl
--  by IAC (IDL to Ada Compiler) 2.8.0w (Debian release 20110207-5.1).
---------------------------------------------------
--  Do NOT hand-modify this file, as your
--  changes will be lost when you re-run the
--  IDL to Ada compiler.
---------------------------------------------------
with CORBA.Object;
with PolyORB.Std;
with CORBA;
pragma Elaborate_All (CORBA);

package MDLControlPanel.TimePanelInterface is

   type Ref is
     new CORBA.Object.Ref with null record;

   Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface:1.0";

   function test
     (Self : Ref;
      num : CORBA.Long)
     return CORBA.Long;

   test_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/test:1.0";

   procedure sendPilot
     (Self : Ref;
      num : CORBA.Long;
      name : CORBA.String;
      car : CORBA.String;
      strategyStr : CORBA.String;
      fuel : CORBA.String);

   sendPilot_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/sendPilot:1.0";

   procedure sendPilotIntermediate
     (Self : Ref;
      Number : CORBA.Long;
      time : CORBA.String;
      numLap : CORBA.Long;
      numIntermediate : CORBA.Long;
      ticket : CORBA.Long;
      totTime : CORBA.String);

   sendPilotIntermediate_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/sendPilotIntermediate:1.0";

   procedure enterBox
     (Self : Ref;
      Number : CORBA.Long);

   enterBox_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/enterBox:1.0";

   procedure exitBox
     (Self : Ref;
      Number : CORBA.Long;
      fuel : CORBA.String);

   exitBox_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/exitBox:1.0";

   procedure sendRaceDescription
     (Self : Ref;
      name : CORBA.String;
      lenght : CORBA.String;
      numLap : CORBA.String;
      meteo : CORBA.String);

   sendRaceDescription_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/sendRaceDescription:1.0";

   procedure sendStartRace
     (Self : Ref);

   sendStartRace_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/sendStartRace:1.0";

   procedure sendFuelAndTires
     (Self : Ref;
      number : CORBA.Long;
      fuel : CORBA.String;
      tires : CORBA.Long);

   sendFuelAndTires_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/sendFuelAndTires:1.0";

   procedure sendFinishRace
     (Self : Ref;
      number : CORBA.Long;
      time : CORBA.String;
      reason : CORBA.Long);

   sendFinishRace_Repository_Id : constant PolyORB.Std.String :=
     "IDL:MDLControlPanel/TimePanelInterface/sendFinishRace:1.0";

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

private
   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean;

end MDLControlPanel.TimePanelInterface;
