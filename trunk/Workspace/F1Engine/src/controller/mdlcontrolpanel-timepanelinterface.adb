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

   test_Arg_Name_num_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("num");

   test_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -------------------
   -- test_Result_Ü --
   -------------------

   function test_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (test_Result_Ü);
   begin
      return (Name => test_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Long),
      Arg_Modes => 0);
   end test_Result_Ü;

   ----------
   -- test --
   ----------

   function test
     (Self : Ref;
      num : CORBA.Long)
     return CORBA.Long
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Result_Ü : CORBA.Long;
      pragma Warnings (Off, Result_Ü);
      Arg_CC_Result_Ü_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Result_Ü'Unrestricted_Access);
      Arg_CC_num_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (num'Unrestricted_Access);
      Arg_Any_num_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_num_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        test_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         test_Arg_Name_num_Ü,
         PolyORB.Any.Any
           (Arg_Any_num_Ü),
         PolyORB.Any.ARG_IN);
      --  Setting the result value
      PolyORB.Any.Set_Value
        (PolyORB.Any.Get_Container
           (Result_Nv_Ü.Argument).all,
         Arg_CC_Result_Ü_Ü'Unrestricted_Access);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "test",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
      --  Return value
      return Result_Ü;
   end test;

   sendPilot_Arg_Name_num_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("num");

   sendPilot_Arg_Name_name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("name");

   sendPilot_Arg_Name_car_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("car");

   sendPilot_Arg_Name_strategyStr_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("strategyStr");

   sendPilot_Arg_Name_fuel_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("fuel");

   sendPilot_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------
   -- sendPilot_Result_Ü --
   ------------------------

   function sendPilot_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (sendPilot_Result_Ü);
   begin
      return (Name => sendPilot_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendPilot_Result_Ü;

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
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_num_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (num'Unrestricted_Access);
      Arg_Any_num_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_num_Ü'Unchecked_Access);
      Arg_CC_name_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (name'Unrestricted_Access);
      Arg_Any_name_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_name_Ü'Unchecked_Access);
      Arg_CC_car_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (car'Unrestricted_Access);
      Arg_Any_car_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_car_Ü'Unchecked_Access);
      Arg_CC_strategyStr_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (strategyStr'Unrestricted_Access);
      Arg_Any_strategyStr_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_strategyStr_Ü'Unchecked_Access);
      Arg_CC_fuel_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (fuel'Unrestricted_Access);
      Arg_Any_fuel_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_fuel_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        sendPilot_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilot_Arg_Name_num_Ü,
         PolyORB.Any.Any
           (Arg_Any_num_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilot_Arg_Name_name_Ü,
         PolyORB.Any.Any
           (Arg_Any_name_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilot_Arg_Name_car_Ü,
         PolyORB.Any.Any
           (Arg_Any_car_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilot_Arg_Name_strategyStr_Ü,
         PolyORB.Any.Any
           (Arg_Any_strategyStr_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilot_Arg_Name_fuel_Ü,
         PolyORB.Any.Any
           (Arg_Any_fuel_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendPilot",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end sendPilot;

   sendPilotIntermediate_Arg_Name_Number_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Number");

   sendPilotIntermediate_Arg_Name_time_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("time");

   sendPilotIntermediate_Arg_Name_numLap_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("numLap");

   sendPilotIntermediate_Arg_Name_numIntermediate_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("numIntermediate");

   sendPilotIntermediate_Arg_Name_ticket_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("ticket");

   sendPilotIntermediate_Arg_Name_totTime_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("totTime");

   sendPilotIntermediate_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ------------------------------------
   -- sendPilotIntermediate_Result_Ü --
   ------------------------------------

   function sendPilotIntermediate_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (sendPilotIntermediate_Result_Ü);
   begin
      return (Name => sendPilotIntermediate_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendPilotIntermediate_Result_Ü;

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
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_Number_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Number'Unrestricted_Access);
      Arg_Any_Number_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Number_Ü'Unchecked_Access);
      Arg_CC_time_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (time'Unrestricted_Access);
      Arg_Any_time_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_time_Ü'Unchecked_Access);
      Arg_CC_numLap_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (numLap'Unrestricted_Access);
      Arg_Any_numLap_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_numLap_Ü'Unchecked_Access);
      Arg_CC_numIntermediate_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (numIntermediate'Unrestricted_Access);
      Arg_Any_numIntermediate_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_numIntermediate_Ü'Unchecked_Access);
      Arg_CC_ticket_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (ticket'Unrestricted_Access);
      Arg_Any_ticket_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_ticket_Ü'Unchecked_Access);
      Arg_CC_totTime_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (totTime'Unrestricted_Access);
      Arg_Any_totTime_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_totTime_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        sendPilotIntermediate_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilotIntermediate_Arg_Name_Number_Ü,
         PolyORB.Any.Any
           (Arg_Any_Number_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilotIntermediate_Arg_Name_time_Ü,
         PolyORB.Any.Any
           (Arg_Any_time_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilotIntermediate_Arg_Name_numLap_Ü,
         PolyORB.Any.Any
           (Arg_Any_numLap_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilotIntermediate_Arg_Name_numIntermediate_Ü,
         PolyORB.Any.Any
           (Arg_Any_numIntermediate_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilotIntermediate_Arg_Name_ticket_Ü,
         PolyORB.Any.Any
           (Arg_Any_ticket_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendPilotIntermediate_Arg_Name_totTime_Ü,
         PolyORB.Any.Any
           (Arg_Any_totTime_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendPilotIntermediate",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end sendPilotIntermediate;

   enterBox_Arg_Name_Number_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Number");

   enterBox_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -----------------------
   -- enterBox_Result_Ü --
   -----------------------

   function enterBox_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (enterBox_Result_Ü);
   begin
      return (Name => enterBox_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end enterBox_Result_Ü;

   --------------
   -- enterBox --
   --------------

   procedure enterBox
     (Self : Ref;
      Number : CORBA.Long)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_Number_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Number'Unrestricted_Access);
      Arg_Any_Number_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Number_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        enterBox_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         enterBox_Arg_Name_Number_Ü,
         PolyORB.Any.Any
           (Arg_Any_Number_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "enterBox",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end enterBox;

   exitBox_Arg_Name_Number_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Number");

   exitBox_Arg_Name_fuel_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("fuel");

   exitBox_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------
   -- exitBox_Result_Ü --
   ----------------------

   function exitBox_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (exitBox_Result_Ü);
   begin
      return (Name => exitBox_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end exitBox_Result_Ü;

   -------------
   -- exitBox --
   -------------

   procedure exitBox
     (Self : Ref;
      Number : CORBA.Long;
      fuel : CORBA.String)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_Number_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (Number'Unrestricted_Access);
      Arg_Any_Number_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_Number_Ü'Unchecked_Access);
      Arg_CC_fuel_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (fuel'Unrestricted_Access);
      Arg_Any_fuel_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_fuel_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        exitBox_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         exitBox_Arg_Name_Number_Ü,
         PolyORB.Any.Any
           (Arg_Any_Number_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         exitBox_Arg_Name_fuel_Ü,
         PolyORB.Any.Any
           (Arg_Any_fuel_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "exitBox",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end exitBox;

   sendRaceDescription_Arg_Name_name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("name");

   sendRaceDescription_Arg_Name_lenght_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("lenght");

   sendRaceDescription_Arg_Name_numLap_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("numLap");

   sendRaceDescription_Arg_Name_meteo_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("meteo");

   sendRaceDescription_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------------------
   -- sendRaceDescription_Result_Ü --
   ----------------------------------

   function sendRaceDescription_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (sendRaceDescription_Result_Ü);
   begin
      return (Name => sendRaceDescription_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendRaceDescription_Result_Ü;

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
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_name_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (name'Unrestricted_Access);
      Arg_Any_name_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_name_Ü'Unchecked_Access);
      Arg_CC_lenght_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (lenght'Unrestricted_Access);
      Arg_Any_lenght_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_lenght_Ü'Unchecked_Access);
      Arg_CC_numLap_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (numLap'Unrestricted_Access);
      Arg_Any_numLap_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_numLap_Ü'Unchecked_Access);
      Arg_CC_meteo_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (meteo'Unrestricted_Access);
      Arg_Any_meteo_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_meteo_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        sendRaceDescription_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendRaceDescription_Arg_Name_name_Ü,
         PolyORB.Any.Any
           (Arg_Any_name_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendRaceDescription_Arg_Name_lenght_Ü,
         PolyORB.Any.Any
           (Arg_Any_lenght_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendRaceDescription_Arg_Name_numLap_Ü,
         PolyORB.Any.Any
           (Arg_Any_numLap_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendRaceDescription_Arg_Name_meteo_Ü,
         PolyORB.Any.Any
           (Arg_Any_meteo_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendRaceDescription",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end sendRaceDescription;

   sendStartRace_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------------
   -- sendStartRace_Result_Ü --
   ----------------------------

   function sendStartRace_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (sendStartRace_Result_Ü);
   begin
      return (Name => sendStartRace_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendStartRace_Result_Ü;

   -------------------
   -- sendStartRace --
   -------------------

   procedure sendStartRace
     (Self : Ref)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        sendStartRace_Result_Ü;
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
        (Argument_List_Ü);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendStartRace",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end sendStartRace;

   sendFuelLevel_Arg_Name_number_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("number");

   sendFuelLevel_Arg_Name_fuel_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("fuel");

   sendFuelLevel_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   ----------------------------
   -- sendFuelLevel_Result_Ü --
   ----------------------------

   function sendFuelLevel_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (sendFuelLevel_Result_Ü);
   begin
      return (Name => sendFuelLevel_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendFuelLevel_Result_Ü;

   -------------------
   -- sendFuelLevel --
   -------------------

   procedure sendFuelLevel
     (Self : Ref;
      number : CORBA.Long;
      fuel : CORBA.String)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_number_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (number'Unrestricted_Access);
      Arg_Any_number_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_number_Ü'Unchecked_Access);
      Arg_CC_fuel_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (fuel'Unrestricted_Access);
      Arg_Any_fuel_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_fuel_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        sendFuelLevel_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendFuelLevel_Arg_Name_number_Ü,
         PolyORB.Any.Any
           (Arg_Any_number_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendFuelLevel_Arg_Name_fuel_Ü,
         PolyORB.Any.Any
           (Arg_Any_fuel_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendFuelLevel",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
   end sendFuelLevel;

   sendFinishRace_Arg_Name_number_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("number");

   sendFinishRace_Arg_Name_time_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("time");

   sendFinishRace_Arg_Name_reason_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("reason");

   sendFinishRace_Result_Name_Ü : constant PolyORB.Types.Identifier :=
     PolyORB.Types.To_PolyORB_String
        ("Result");

   -----------------------------
   -- sendFinishRace_Result_Ü --
   -----------------------------

   function sendFinishRace_Result_Ü return PolyORB.Any.NamedValue is
      pragma Inline (sendFinishRace_Result_Ü);
   begin
      return (Name => sendFinishRace_Result_Name_Ü,
      Argument => CORBA.Internals.Get_Empty_Any
        (CORBA.TC_Void),
      Arg_Modes => 0);
   end sendFinishRace_Result_Ü;

   --------------------
   -- sendFinishRace --
   --------------------

   procedure sendFinishRace
     (Self : Ref;
      number : CORBA.Long;
      time : CORBA.String;
      reason : CORBA.Long)
   is
      Argument_List_Ü : PolyORB.Any.NVList.Ref;
      Arg_CC_number_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (number'Unrestricted_Access);
      Arg_Any_number_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_number_Ü'Unchecked_Access);
      Arg_CC_time_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (time'Unrestricted_Access);
      Arg_Any_time_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_String,
            Arg_CC_time_Ü'Unchecked_Access);
      Arg_CC_reason_Ü : aliased PolyORB.Any.Content'Class :=
        CORBA.Wrap
           (reason'Unrestricted_Access);
      Arg_Any_reason_Ü : constant CORBA.Any :=
        CORBA.Internals.Get_Wrapper_Any
           (CORBA.TC_Long,
            Arg_CC_reason_Ü'Unchecked_Access);
      Request_Ü : aliased PolyORB.Requests.Request;
      Result_Nv_Ü : PolyORB.Any.NamedValue :=
        sendFinishRace_Result_Ü;
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
        (Argument_List_Ü);
      --  Fill the Argument list
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendFinishRace_Arg_Name_number_Ü,
         PolyORB.Any.Any
           (Arg_Any_number_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendFinishRace_Arg_Name_time_Ü,
         PolyORB.Any.Any
           (Arg_Any_time_Ü),
         PolyORB.Any.ARG_IN);
      PolyORB.Any.NVList.Add_Item
        (Argument_List_Ü,
         sendFinishRace_Arg_Name_reason_Ü,
         PolyORB.Any.Any
           (Arg_Any_reason_Ü),
         PolyORB.Any.ARG_IN);
      --  Creating the request
      PolyORB.Requests.Setup_Request
        (Req => Request_Ü,
         Target => CORBA.Object.Internals.To_PolyORB_Ref
           (CORBA.Object.Ref
              (Self)),
         Operation => "sendFinishRace",
         Arg_List => Argument_List_Ü,
         Result => Result_Nv_Ü);
      --  Invoking the request (synchronously or asynchronously)
      PolyORB.CORBA_P.Interceptors_Hooks.Client_Invoke
        (Request_Ü'Access,
         PolyORB.Requests.Flags
           (0));
      --  Raise exception, if needed
      PolyORB.CORBA_P.Exceptions.Request_Raise_Occurrence
        (Request_Ü);
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
