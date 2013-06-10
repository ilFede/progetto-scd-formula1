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
with PolyORB.Std;
with PolyORB.Any;
with CORBA.Object.Helper;
with PolyORB.Utils.Strings;
with PolyORB.Utils.Strings.Lists;
with PolyORB.Initialization;

package body MDLControlPanel.TimePanelInterface.Helper is

   
   package body Internals is

      TimePanelInterface_Initialized : PolyORB.Std.Boolean :=
        False;

      -----------------------------------
      -- Initialize_TimePanelInterface --
      -----------------------------------

      procedure Initialize_TimePanelInterface is
         Name_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("TimePanelInterface");
         Id_Ü : constant CORBA.String :=
           CORBA.To_CORBA_String
              ("IDL:MDLControlPanel/TimePanelInterface:1.0");
      begin
         if not TimePanelInterface_Initialized
         then
            TimePanelInterface_Initialized :=
              True;
            MDLControlPanel.TimePanelInterface.Helper.TC_TimePanelInterface :=
              CORBA.TypeCode.Internals.To_CORBA_Object
                 (PolyORB.Any.TypeCode.TC_Object);
            CORBA.Internals.Add_Parameter
              (TC_TimePanelInterface,
               CORBA.To_Any
                 (Name_Ü));
            CORBA.Internals.Add_Parameter
              (TC_TimePanelInterface,
               CORBA.To_Any
                 (Id_Ü));
            CORBA.TypeCode.Internals.Disable_Reference_Counting
              (MDLControlPanel.TimePanelInterface.Helper.TC_TimePanelInterface);
         end if;
      end Initialize_TimePanelInterface;

   end Internals;

   --------------
   -- From_Any --
   --------------

   function From_Any
     (Item : CORBA.Any)
     return MDLControlPanel.TimePanelInterface.Ref
   is
   begin
      return To_Ref
        (CORBA.Object.Helper.From_Any
           (Item));
   end From_Any;

   ------------
   -- To_Any --
   ------------

   function To_Any
     (Item : MDLControlPanel.TimePanelInterface.Ref)
     return CORBA.Any
   is
      A : CORBA.Any :=
        CORBA.Object.Helper.To_Any
           (CORBA.Object.Ref
              (Item));
   begin
      CORBA.Internals.Set_Type
        (A,
         TC_TimePanelInterface);
      return A;
   end To_Any;

   ----------------------
   -- Unchecked_To_Ref --
   ----------------------

   function Unchecked_To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return MDLControlPanel.TimePanelInterface.Ref
   is
      Result : MDLControlPanel.TimePanelInterface.Ref;
   begin
      Set
        (Result,
         CORBA.Object.Object_Of
           (The_Ref));
      return Result;
   end Unchecked_To_Ref;

   ------------
   -- To_Ref --
   ------------

   function To_Ref
     (The_Ref : CORBA.Object.Ref'Class)
     return MDLControlPanel.TimePanelInterface.Ref
   is
   begin
      if (CORBA.Object.Is_Nil
        (The_Ref)
         or else CORBA.Object.Is_A
           (The_Ref,
            Repository_Id))
      then
         return Unchecked_To_Ref
           (The_Ref);
      end if;
      CORBA.Raise_Bad_Param
        (CORBA.Default_Sys_Member);
   end To_Ref;

   -----------------------------
   -- Deferred_Initialization --
   -----------------------------

   procedure Deferred_Initialization is
   begin
      MDLControlPanel.TimePanelInterface.Helper.Internals.Initialize_TimePanelInterface;
   end Deferred_Initialization;

begin
   declare
      use PolyORB.Utils.Strings;
      use PolyORB.Utils.Strings.Lists;
   begin
      PolyORB.Initialization.Register_Module
        (PolyORB.Initialization.Module_Info'
           (Name => +"MDLControlPanel.TimePanelInterface.Helper",
            Conflicts => PolyORB.Utils.Strings.Lists.Empty,
            Depends => +"any",
            Provides => PolyORB.Utils.Strings.Lists.Empty,
            Implicit => False,
            Init => Deferred_Initialization'Access,
            Shutdown => null));
   end;
end MDLControlPanel.TimePanelInterface.Helper;
