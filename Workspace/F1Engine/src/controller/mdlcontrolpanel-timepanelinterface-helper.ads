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
with CORBA;
pragma Elaborate_All (CORBA);
with CORBA.Object;

package MDLControlPanel.TimePanelInterface.Helper is

   TC_TimePanelInterface : CORBA.TypeCode.Object;

   function From_Any
     (Item : CORBA.Any)
     return MDLControlPanel.TimePanelInterface.Ref;

   function To_Any
     (Item : MDLControlPanel.TimePanelInterface.Ref)
     return CORBA.Any;

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return MDLControlPanel.TimePanelInterface.Ref;

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return MDLControlPanel.TimePanelInterface.Ref;

   
   package Internals is

      procedure Initialize_TimePanelInterface;

   end Internals;

end MDLControlPanel.TimePanelInterface.Helper;
