import java.io.BufferedWriter;
import java.io.FileWriter;

import org.omg.CORBA.ORB;
import org.omg.PortableServer.*;

public class TimePanel {

	private ORB orb;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		// TimePanel window = new TimePanel();
		// window.frmMain.setVisible(true);

		// window.addPilot("Vettel", 2);
		// window.addPilot("Vettel", 1);
		// window.addPilot("Maldorado", 2);
		// window.addPilot("Vettel", 4);
		// window.addPilot("Vettel", 3);
		// window.addPilot("Maldorado", 1);
		// window.setPilotIntermediate("1", 1, "ciao");

		try {
			org.omg.CORBA.ORB orb = org.omg.CORBA.ORB.init(args, null);
			POA rootPOA = POAHelper.narrow(orb
					.resolve_initial_references("RootPOA"));
			TimePanelImpl myPanel = new TimePanelImpl();
			org.omg.CORBA.Object obj = rootPOA.servant_to_reference(myPanel);
			rootPOA.the_POAManager().activate();
			String iorStr = orb.object_to_string(obj);
			System.out.println(iorStr); // da IOR a stringa su stdout
			try {
				// Create file
				FileWriter fstream = new FileWriter("../ior.txt");
				BufferedWriter out = new BufferedWriter(fstream);
				out.write(iorStr);
				// Close the output stream
				out.close();

			} catch (Exception e) {// Catch exception if any
				System.err.println("Error: " + e.getMessage());
			}
			orb.run();
		}catch (Exception e) {
			System.err.println("ERROR: " + e);
			e.printStackTrace(System.out);
		}

		System.out.println("Pannello gara chiuso!");

	}

}