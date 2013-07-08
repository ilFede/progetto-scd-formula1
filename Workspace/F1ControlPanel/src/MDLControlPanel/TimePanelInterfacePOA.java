package MDLControlPanel;


/**
* MDLControlPanel/TimePanelInterfacePOA.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from ./src/MDLControlPanel.idl
* lunedì 8 luglio 2013 15.21.10 CEST
*/

public abstract class TimePanelInterfacePOA extends org.omg.PortableServer.Servant
 implements MDLControlPanel.TimePanelInterfaceOperations, org.omg.CORBA.portable.InvokeHandler
{

  // Constructors

  private static java.util.Hashtable _methods = new java.util.Hashtable ();
  static
  {
    _methods.put ("test", new java.lang.Integer (0));
    _methods.put ("sendPilot", new java.lang.Integer (1));
    _methods.put ("sendPilotIntermediate", new java.lang.Integer (2));
    _methods.put ("enterBox", new java.lang.Integer (3));
    _methods.put ("exitBox", new java.lang.Integer (4));
    _methods.put ("sendRaceDescription", new java.lang.Integer (5));
    _methods.put ("sendStartRace", new java.lang.Integer (6));
    _methods.put ("sendFuelAndTires", new java.lang.Integer (7));
    _methods.put ("sendFinishRace", new java.lang.Integer (8));
  }

  public org.omg.CORBA.portable.OutputStream _invoke (String $method,
                                org.omg.CORBA.portable.InputStream in,
                                org.omg.CORBA.portable.ResponseHandler $rh)
  {
    org.omg.CORBA.portable.OutputStream out = null;
    java.lang.Integer __method = (java.lang.Integer)_methods.get ($method);
    if (__method == null)
      throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);

    switch (__method.intValue ())
    {
       case 0:  // MDLControlPanel/TimePanelInterface/test
       {
         int num = in.read_long ();
         int $result = (int)0;
         $result = this.test (num);
         out = $rh.createReply();
         out.write_long ($result);
         break;
       }

       case 1:  // MDLControlPanel/TimePanelInterface/sendPilot
       {
         int num = in.read_long ();
         String name = in.read_string ();
         String car = in.read_string ();
         String strategyStr = in.read_string ();
         String fuel = in.read_string ();
         this.sendPilot (num, name, car, strategyStr, fuel);
         out = $rh.createReply();
         break;
       }

       case 2:  // MDLControlPanel/TimePanelInterface/sendPilotIntermediate
       {
         int Number = in.read_long ();
         String time = in.read_string ();
         int numLap = in.read_long ();
         int numIntermediate = in.read_long ();
         int ticket = in.read_long ();
         String totTime = in.read_string ();
         this.sendPilotIntermediate (Number, time, numLap, numIntermediate, ticket, totTime);
         out = $rh.createReply();
         break;
       }

       case 3:  // MDLControlPanel/TimePanelInterface/enterBox
       {
         int Number = in.read_long ();
         this.enterBox (Number);
         out = $rh.createReply();
         break;
       }

       case 4:  // MDLControlPanel/TimePanelInterface/exitBox
       {
         int Number = in.read_long ();
         String fuel = in.read_string ();
         this.exitBox (Number, fuel);
         out = $rh.createReply();
         break;
       }

       case 5:  // MDLControlPanel/TimePanelInterface/sendRaceDescription
       {
         String name = in.read_string ();
         String lenght = in.read_string ();
         String numLap = in.read_string ();
         String meteo = in.read_string ();
         this.sendRaceDescription (name, lenght, numLap, meteo);
         out = $rh.createReply();
         break;
       }

       case 6:  // MDLControlPanel/TimePanelInterface/sendStartRace
       {
         this.sendStartRace ();
         out = $rh.createReply();
         break;
       }

       case 7:  // MDLControlPanel/TimePanelInterface/sendFuelAndTires
       {
         int number = in.read_long ();
         String fuel = in.read_string ();
         int tires = in.read_long ();
         this.sendFuelAndTires (number, fuel, tires);
         out = $rh.createReply();
         break;
       }

       case 8:  // MDLControlPanel/TimePanelInterface/sendFinishRace
       {
         int number = in.read_long ();
         String time = in.read_string ();
         int reason = in.read_long ();
         this.sendFinishRace (number, time, reason);
         out = $rh.createReply();
         break;
       }

       default:
         throw new org.omg.CORBA.BAD_OPERATION (0, org.omg.CORBA.CompletionStatus.COMPLETED_MAYBE);
    }

    return out;
  } // _invoke

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:MDLControlPanel/TimePanelInterface:1.0"};

  public String[] _all_interfaces (org.omg.PortableServer.POA poa, byte[] objectId)
  {
    return (String[])__ids.clone ();
  }

  public TimePanelInterface _this() 
  {
    return TimePanelInterfaceHelper.narrow(
    super._this_object());
  }

  public TimePanelInterface _this(org.omg.CORBA.ORB orb) 
  {
    return TimePanelInterfaceHelper.narrow(
    super._this_object(orb));
  }


} // class TimePanelInterfacePOA
