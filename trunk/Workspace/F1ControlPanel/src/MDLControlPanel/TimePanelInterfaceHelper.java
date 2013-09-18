package MDLControlPanel;


/**
* MDLControlPanel/TimePanelInterfaceHelper.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from ./src/MDLControlPanel.idl
* domenica 15 settembre 2013 16.59.01 CEST
*/

abstract public class TimePanelInterfaceHelper
{
  private static String  _id = "IDL:MDLControlPanel/TimePanelInterface:1.0";

  public static void insert (org.omg.CORBA.Any a, MDLControlPanel.TimePanelInterface that)
  {
    org.omg.CORBA.portable.OutputStream out = a.create_output_stream ();
    a.type (type ());
    write (out, that);
    a.read_value (out.create_input_stream (), type ());
  }

  public static MDLControlPanel.TimePanelInterface extract (org.omg.CORBA.Any a)
  {
    return read (a.create_input_stream ());
  }

  private static org.omg.CORBA.TypeCode __typeCode = null;
  synchronized public static org.omg.CORBA.TypeCode type ()
  {
    if (__typeCode == null)
    {
      __typeCode = org.omg.CORBA.ORB.init ().create_interface_tc (MDLControlPanel.TimePanelInterfaceHelper.id (), "TimePanelInterface");
    }
    return __typeCode;
  }

  public static String id ()
  {
    return _id;
  }

  public static MDLControlPanel.TimePanelInterface read (org.omg.CORBA.portable.InputStream istream)
  {
    return narrow (istream.read_Object (_TimePanelInterfaceStub.class));
  }

  public static void write (org.omg.CORBA.portable.OutputStream ostream, MDLControlPanel.TimePanelInterface value)
  {
    ostream.write_Object ((org.omg.CORBA.Object) value);
  }

  public static MDLControlPanel.TimePanelInterface narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof MDLControlPanel.TimePanelInterface)
      return (MDLControlPanel.TimePanelInterface)obj;
    else if (!obj._is_a (id ()))
      throw new org.omg.CORBA.BAD_PARAM ();
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      MDLControlPanel._TimePanelInterfaceStub stub = new MDLControlPanel._TimePanelInterfaceStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

  public static MDLControlPanel.TimePanelInterface unchecked_narrow (org.omg.CORBA.Object obj)
  {
    if (obj == null)
      return null;
    else if (obj instanceof MDLControlPanel.TimePanelInterface)
      return (MDLControlPanel.TimePanelInterface)obj;
    else
    {
      org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl)obj)._get_delegate ();
      MDLControlPanel._TimePanelInterfaceStub stub = new MDLControlPanel._TimePanelInterfaceStub ();
      stub._set_delegate(delegate);
      return stub;
    }
  }

}
