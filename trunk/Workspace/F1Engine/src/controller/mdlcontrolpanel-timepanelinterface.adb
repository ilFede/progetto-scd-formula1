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
with PolyORB.Any.NVList;
with PolyORB.Any;
with PolyORB.Types;
with PolyORB.Requests;
with PolyORB.CORBA_P.Interceptors_Hooks;
with PolyORB.CORBA_P.Exceptions;

package body MDLControlPanel.TimePanelInterface is

   test_Arg_Name_num_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("num");

   test_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -------------------
   -- test_Result_� --
   -------------------

   function test_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (test_Result_�);
   begin
      return (Name => test_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Long),
      Arg_Modes => 0);
   end test_Result_�;

   ----------
   -- test --
   ----------

   function test
     (Self : Ref;
      num : CORBA.Long)
     return CORBA.Long
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Result_� : CORBA.Long;
      pragma Warnings (Off, Result_�);
      Arg_CC_Result_�_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Result_�'Unrestricted_Access);
      Arg_CC_num_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (num'Unrestricted_Access);
      Arg_Any_num_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_num_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        test_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         test_Arg_Name_num_�,
         PolyORB.Any.Any
           (Arg_Any_num_�),
         PolyORB.Any.ARG_IN);
      --  Setting the result value
      PolyORB.Any.Set_Value
        (PolyORB.Any.Get_Container
           (Result_Nv_�.Argument).all,
         Arg_CC_Result_�_�'Unrestricted_Access);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "test",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
      --  Return value
      return Result_�;
   end test;

   sendPilot_Arg_Name_num_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("num");

   sendPilot_Arg_Name_name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("name");

   sendPilot_Arg_Name_car_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("car");

   sendPilot_Arg_Name_strategyStr_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("strategyStr");

   sendPilot_Arg_Name_fuel_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("fuel");

   sendPilot_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- sendPilot_Result_� --
   ------------------------

   function sendPilot_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (sendPilot_Result_�);
   begin
      return (Name => sendPilot_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendPilot_Result_�;

   ---------------
   -- sendPilot --
   ---------------

   procedure sendPilot
     (Self : Ref;
      num : CORBA.Long;
      name : CORBA.String;
      car : CORBA.String;
      strategyStr : CORBA.String;
      fuel : CORBA.String)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_num_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (num'Unrestricted_Access);
      Arg_Any_num_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_num_�'Unchecked_Access);
      Arg_CC_name_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (name'Unrestricted_Access);
      Arg_Any_name_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_name_�'Unchecked_Access);
      Arg_CC_car_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (car'Unrestricted_Access);
      Arg_Any_car_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_car_�'Unchecked_Access);
      Arg_CC_strategyStr_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (strategyStr'Unrestricted_Access);
      Arg_Any_strategyStr_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_strategyStr_�'Unchecked_Access);
      Arg_CC_fuel_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (fuel'Unrestricted_Access);
      Arg_Any_fuel_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_fuel_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        sendPilot_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilot_Arg_Name_num_�,
         PolyORB.Any.Any
           (Arg_Any_num_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilot_Arg_Name_name_�,
         PolyORB.Any.Any
           (Arg_Any_name_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilot_Arg_Name_car_�,
         PolyORB.Any.Any
           (Arg_Any_car_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilot_Arg_Name_strategyStr_�,
         PolyORB.Any.Any
           (Arg_Any_strategyStr_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilot_Arg_Name_fuel_�,
         PolyORB.Any.Any
           (Arg_Any_fuel_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendPilot",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end sendPilot;

   sendPilotIntermediate_Arg_Name_Number_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Number");

   sendPilotIntermediate_Arg_Name_time_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("time");

   sendPilotIntermediate_Arg_Name_numLap_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("numLap");

   sendPilotIntermediate_Arg_Name_numIntermediate_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("numIntermediate");

   sendPilotIntermediate_Arg_Name_ticket_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("ticket");

   sendPilotIntermediate_Arg_Name_totTime_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("totTime");

   sendPilotIntermediate_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------------------
   -- sendPilotIntermediate_Result_� --
   ------------------------------------

   function sendPilotIntermediate_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (sendPilotIntermediate_Result_�);
   begin
      return (Name => sendPilotIntermediate_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendPilotIntermediate_Result_�;

   ---------------------------
   -- sendPilotIntermediate --
   ---------------------------

   procedure sendPilotIntermediate
     (Self : Ref;
      Number : CORBA.Long;
      time : CORBA.String;
      numLap : CORBA.Long;
      numIntermediate : CORBA.Long;
      ticket : CORBA.Long;
      totTime : CORBA.String)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_Number_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Number'Unrestricted_Access);
      Arg_Any_Number_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Number_�'Unchecked_Access);
      Arg_CC_time_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (time'Unrestricted_Access);
      Arg_Any_time_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_time_�'Unchecked_Access);
      Arg_CC_numLap_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (numLap'Unrestricted_Access);
      Arg_Any_numLap_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_numLap_�'Unchecked_Access);
      Arg_CC_numIntermediate_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (numIntermediate'Unrestricted_Access);
      Arg_Any_numIntermediate_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_numIntermediate_�'Unchecked_Access);
      Arg_CC_ticket_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (ticket'Unrestricted_Access);
      Arg_Any_ticket_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_ticket_�'Unchecked_Access);
      Arg_CC_totTime_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (totTime'Unrestricted_Access);
      Arg_Any_totTime_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_totTime_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        sendPilotIntermediate_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilotIntermediate_Arg_Name_Number_�,
         PolyORB.Any.Any
           (Arg_Any_Number_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilotIntermediate_Arg_Name_time_�,
         PolyORB.Any.Any
           (Arg_Any_time_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilotIntermediate_Arg_Name_numLap_�,
         PolyORB.Any.Any
           (Arg_Any_numLap_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilotIntermediate_Arg_Name_numIntermediate_�,
         PolyORB.Any.Any
           (Arg_Any_numIntermediate_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilotIntermediate_Arg_Name_ticket_�,
         PolyORB.Any.Any
           (Arg_Any_ticket_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendPilotIntermediate_Arg_Name_totTime_�,
         PolyORB.Any.Any
           (Arg_Any_totTime_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendPilotIntermediate",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end sendPilotIntermediate;

   enterBox_Arg_Name_Number_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Number");

   enterBox_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -----------------------
   -- enterBox_Result_� --
   -----------------------

   function enterBox_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (enterBox_Result_�);
   begin
      return (Name => enterBox_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end enterBox_Result_�;

   --------------
   -- enterBox --
   --------------

   procedure enterBox
     (Self : Ref;
      Number : CORBA.Long)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_Number_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Number'Unrestricted_Access);
      Arg_Any_Number_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Number_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        enterBox_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         enterBox_Arg_Name_Number_�,
         PolyORB.Any.Any
           (Arg_Any_Number_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "enterBox",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end enterBox;

   exitBox_Arg_Name_Number_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Number");

   exitBox_Arg_Name_fuel_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("fuel");

   exitBox_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------
   -- exitBox_Result_� --
   ----------------------

   function exitBox_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (exitBox_Result_�);
   begin
      return (Name => exitBox_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end exitBox_Result_�;

   -------------
   -- exitBox --
   -------------

   procedure exitBox
     (Self : Ref;
      Number : CORBA.Long;
      fuel : CORBA.String)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_Number_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Number'Unrestricted_Access);
      Arg_Any_Number_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Number_�'Unchecked_Access);
      Arg_CC_fuel_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (fuel'Unrestricted_Access);
      Arg_Any_fuel_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_fuel_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        exitBox_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         exitBox_Arg_Name_Number_�,
         PolyORB.Any.Any
           (Arg_Any_Number_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         exitBox_Arg_Name_fuel_�,
         PolyORB.Any.Any
           (Arg_Any_fuel_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "exitBox",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end exitBox;

   sendRaceDescription_Arg_Name_name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("name");

   sendRaceDescription_Arg_Name_lenght_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lenght");

   sendRaceDescription_Arg_Name_numLap_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("numLap");

   sendRaceDescription_Arg_Name_meteo_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("meteo");

   sendRaceDescription_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------------------
   -- sendRaceDescription_Result_� --
   ----------------------------------

   function sendRaceDescription_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (sendRaceDescription_Result_�);
   begin
      return (Name => sendRaceDescription_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendRaceDescription_Result_�;

   -------------------------
   -- sendRaceDescription --
   -------------------------

   procedure sendRaceDescription
     (Self : Ref;
      name : CORBA.String;
      lenght : CORBA.String;
      numLap : CORBA.String;
      meteo : CORBA.String)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_name_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (name'Unrestricted_Access);
      Arg_Any_name_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_name_�'Unchecked_Access);
      Arg_CC_lenght_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lenght'Unrestricted_Access);
      Arg_Any_lenght_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_lenght_�'Unchecked_Access);
      Arg_CC_numLap_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (numLap'Unrestricted_Access);
      Arg_Any_numLap_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_numLap_�'Unchecked_Access);
      Arg_CC_meteo_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (meteo'Unrestricted_Access);
      Arg_Any_meteo_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_meteo_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        sendRaceDescription_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendRaceDescription_Arg_Name_name_�,
         PolyORB.Any.Any
           (Arg_Any_name_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendRaceDescription_Arg_Name_lenght_�,
         PolyORB.Any.Any
           (Arg_Any_lenght_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendRaceDescription_Arg_Name_numLap_�,
         PolyORB.Any.Any
           (Arg_Any_numLap_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendRaceDescription_Arg_Name_meteo_�,
         PolyORB.Any.Any
           (Arg_Any_meteo_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendRaceDescription",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end sendRaceDescription;

   sendStartRace_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------------
   -- sendStartRace_Result_� --
   ----------------------------

   function sendStartRace_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (sendStartRace_Result_�);
   begin
      return (Name => sendStartRace_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendStartRace_Result_�;

   -------------------
   -- sendStartRace --
   -------------------

   procedure sendStartRace
     (Self : Ref)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        sendStartRace_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendStartRace",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end sendStartRace;

   sendFuelLevel_Arg_Name_number_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("number");

   sendFuelLevel_Arg_Name_fuel_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("fuel");

   sendFuelLevel_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------------
   -- sendFuelLevel_Result_� --
   ----------------------------

   function sendFuelLevel_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (sendFuelLevel_Result_�);
   begin
      return (Name => sendFuelLevel_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendFuelLevel_Result_�;

   -------------------
   -- sendFuelLevel --
   -------------------

   procedure sendFuelLevel
     (Self : Ref;
      number : CORBA.Long;
      fuel : CORBA.String)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_number_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (number'Unrestricted_Access);
      Arg_Any_number_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_number_�'Unchecked_Access);
      Arg_CC_fuel_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (fuel'Unrestricted_Access);
      Arg_Any_fuel_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_fuel_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        sendFuelLevel_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendFuelLevel_Arg_Name_number_�,
         PolyORB.Any.Any
           (Arg_Any_number_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendFuelLevel_Arg_Name_fuel_�,
         PolyORB.Any.Any
           (Arg_Any_fuel_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendFuelLevel",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end sendFuelLevel;

   sendFinishRace_Arg_Name_number_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("number");

   sendFinishRace_Arg_Name_time_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("time");

   sendFinishRace_Arg_Name_reason_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("reason");

   sendFinishRace_Result_Name_� : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -----------------------------
   -- sendFinishRace_Result_� --
   -----------------------------

   function sendFinishRace_Result_� return PolyORB.Any.NamedValue is
      pragma Inline (sendFinishRace_Result_�);
   begin
      return (Name => sendFinishRace_Result_Name_�,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendFinishRace_Result_�;

   --------------------
   -- sendFinishRace --
   --------------------

   procedure sendFinishRace
     (Self : Ref;
      number : CORBA.Long;
      time : CORBA.String;
      reason : CORBA.Long)
   is
      Argument_List_� : PolyORB.Any.NVList.Ref;
      Arg_CC_number_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (number'Unrestricted_Access);
      Arg_Any_number_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_number_�'Unchecked_Access);
      Arg_CC_time_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (time'Unrestricted_Access);
      Arg_Any_time_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_time_�'Unchecked_Access);
      Arg_CC_reason_� : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (reason'Unrestricted_Access);
      Arg_Any_reason_� : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_reason_�'Unchecked_Access);
      Request_� : aliased PolyORB.Requests.Request;
      Result_Nv_� : PolyORB.Any.NamedValue :=
        sendFinishRace_Result_�;
   begin
      if CORBA.Object.Is_Nil
        (CORBA.Object.Ref
           (Self))
      then
         CORBA.Raise_Inv_Objref
           (CORBA.Default_Sys_Member);
      end if;
      --  Create the Argument list
      PolyORB.Any.NVList.Create
        (Argument_List_�);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendFinishRace_Arg_Name_number_�,
         PolyORB.Any.Any
           (Arg_Any_number_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendFinishRace_Arg_Name_time_�,
         PolyORB.Any.Any
           (Arg_Any_time_�),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_�,
         sendFinishRace_Arg_Name_reason_�,
         PolyORB.Any.Any
           (Arg_Any_reason_�),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_�,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendFinishRace",
         Arg_List => Argument_List_�,
         Result => Result_Nv_�);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_�'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_�);
   end sendFinishRace;

   ----------
   -- Is_A --
   ----------

   function Is_A
     (Self : Ref;
      Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean
   is
   begin
      return (False
         or else (Is_A
           (Logical_Type_Id)
            or else CORBA.Object.Is_A
              (CORBA.Object.Ref
                 (Self),
               Logical_Type_Id)));
   end Is_A;

   ----------
   -- Is_A --
   ----------

   function Is_A
     (Logical_Type_Id : PolyORB.Std.String)
     return CORBA.Boolean
   is
   begin
      return ((CORBA.Is_Equivalent
        (Logical_Type_Id,
         MDLControlPanel.TimePanelInterface.Repository_Id)
         or else CORBA.Is_Equivalent
           (Logical_Type_Id,
            "IDL:omg.org/CORBA/Object:1.0"))
         or else False);
   end Is_A;

end MDLControlPanel.TimePanelInterface;
