package MDLControlPanel;


/**
* MDLControlPanel/_TimePanelInterfaceStub.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from ./src/MDLControlPanel.idl
* lunedì 24 giugno 2013 11.42.42 CEST
*/

public class _TimePanelInterfaceStub extends org.omg.CORBA.portable.ObjectImpl implements MDLControlPanel.TimePanelInterface
{

  public int test (int num)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("test", true);
                $out.write_long (num);
                $in = _invoke ($out);
                int $result = $in.read_long ();
                return $result;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                return test (num        );
            } finally {
                _releaseReply ($in);
            }
  } // test

  public void sendPilot (int num, String name, String car, String strategyStr, String fuel)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("sendPilot", true);
                $out.write_long (num);
                $out.write_string (name);
                $out.write_string (car);
                $out.write_string (strategyStr);
                $out.write_string (fuel);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                sendPilot (num, name, car, strategyStr, fuel        );
            } finally {
                _releaseReply ($in);
            }
  } // sendPilot

  public void sendPilotIntermediate (int Number, String time, int numLap, int numIntermediate, int ticket, String totTime)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("sendPilotIntermediate", true);
                $out.write_long (Number);
                $out.write_string (time);
                $out.write_long (numLap);
                $out.write_long (numIntermediate);
                $out.write_long (ticket);
                $out.write_string (totTime);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                sendPilotIntermediate (Number, time, numLap, numIntermediate, ticket, totTime        );
            } finally {
                _releaseReply ($in);
            }
  } // sendPilotIntermediate

  public void enterBox (int Number)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("enterBox", true);
                $out.write_long (Number);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                enterBox (Number        );
            } finally {
                _releaseReply ($in);
            }
  } // enterBox

  public void exitBox (int Number, String fuel)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("exitBox", true);
                $out.write_long (Number);
                $out.write_string (fuel);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                exitBox (Number, fuel        );
            } finally {
                _releaseReply ($in);
            }
  } // exitBox

  public void sendRaceDescription (String name, String lenght, String numLap, String meteo)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("sendRaceDescription", true);
                $out.write_string (name);
                $out.write_string (lenght);
                $out.write_string (numLap);
                $out.write_string (meteo);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                sendRaceDescription (name, lenght, numLap, meteo        );
            } finally {
                _releaseReply ($in);
            }
  } // sendRaceDescription

  public void sendStartRace ()
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("sendStartRace", true);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                sendStartRace (        );
            } finally {
                _releaseReply ($in);
            }
  } // sendStartRace

  public void sendFuelAndTires (int number, String fuel, int tires)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("sendFuelAndTires", true);
                $out.write_long (number);
                $out.write_string (fuel);
                $out.write_long (tires);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                sendFuelAndTires (number, fuel, tires        );
            } finally {
                _releaseReply ($in);
            }
  } // sendFuelAndTires

  public void sendFinishRace (int number, String time, int reason)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("sendFinishRace", true);
                $out.write_long (number);
                $out.write_string (time);
                $out.write_long (reason);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                sendFinishRace (number, time, reason        );
            } finally {
                _releaseReply ($in);
            }
  } // sendFinishRace

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:MDLControlPanel/TimePanelInterface:1.0"};

  public String[] _ids ()
  {
    return (String[])__ids.clone ();
  }

  private void readObject (java.io.ObjectInputStream s) throws java.io.IOException
  {
     String str = s.readUTF ();
     String[] args = null;
     java.util.Properties props = null;
     org.omg.CORBA.ORB orb = org.omg.CORBA.ORB.init (args, props);
   try {
     org.omg.CORBA.Object obj = orb.string_to_object (str);
     org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl) obj)._get_delegate ();
     _set_delegate (delegate);
   } finally {
     orb.destroy() ;
   }
  }

  private void writeObject (java.io.ObjectOutputStream s) throws java.io.IOException
  {
     String[] args = null;
     java.util.Properties props = null;
     org.omg.CORBA.ORB orb = org.omg.CORBA.ORB.init (args, props);
   try {
     String str = orb.object_to_string (this);
     s.writeUTF (str);
   } finally {
     orb.destroy() ;
   }
  }
} // class _TimePanelInterfaceStub
