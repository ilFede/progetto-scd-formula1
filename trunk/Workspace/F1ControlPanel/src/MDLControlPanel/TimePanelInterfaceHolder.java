package MDLControlPanel;

/**
* MDLControlPanel/TimePanelInterfaceHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from ./src/MDLControlPanel.idl
* giovedì 19 settembre 2013 1.31.57 CEST
*/

public final class TimePanelInterfaceHolder implements org.omg.CORBA.portable.Streamable
{
  public MDLControlPanel.TimePanelInterface value = null;

  public TimePanelInterfaceHolder ()
  {
  }

  public TimePanelInterfaceHolder (MDLControlPanel.TimePanelInterface initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = MDLControlPanel.TimePanelInterfaceHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    MDLControlPanel.TimePanelInterfaceHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return MDLControlPanel.TimePanelInterfaceHelper.type ();
  }

}
