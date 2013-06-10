import java.awt.BorderLayout;
import java.awt.Container;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.RowSorter;
import javax.swing.SortOrder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

import org.omg.CORBA.ORB;
//import org.omg.CosNaming.NameComponent;
import org.omg.PortableServer.POA;
import org.omg.PortableServer.POAHelper;

import MDLControlPanel.TimePanelInterface;
import MDLControlPanel.TimePanelInterfaceHelper;
import MDLControlPanel.TimePanelInterfacePOA;
import javax.swing.JLabel;
import javax.swing.JTextField;
import java.awt.GridLayout;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.SwingConstants;
import java.awt.GridBagLayout;
import java.awt.GridBagConstraints;
import java.awt.Insets;

public class TimePanelImpl extends TimePanelInterfacePOA {

	private ORB orb;

	private String[] mainColumnNames = { "Nome Pilota", "Numero",
			"Costruttore", "1° Intermedio", "2° Intermedio", "3° Intermedio",
			"Tempo ultimo giro", "Dist. dal primo", "#Giri",
			"Stato del pilota", "#Soste", "Carburante", "Strategia",
			"Tempo gara", "#Int", "#Ticket", "#Sort" };
	private String[] posColumnNames = { "Pos" };
	private long[][] intermediateMatrix;

	private JFrame frmMain;
	private JScrollPane scrPnlTimes;
	private JScrollPane scrPnlPos;
	private JTable tblTimes;
	private JTable tblPos;
	private JPanel pnlCenter;
	private JPanel pnlNorth;
	private JPanel pnlSouth;
	private JPanel pnlWest;
	private JPanel pnlEast;
	private DefaultTableModel timesDataModel;
	private DefaultTableModel posDataModel;

	private Date clock;
	private JLabel lblNewLabel;
	private JLabel lblNewLabel_1;
	private JTextField txtBestPilot;
	private JTextField txtRaceState;
	private JTextField txtBestTime;
	private JButton btnNewButton;
	private JTextField txtRaceDescription;
	private JLabel lblNewLabel_2;
	private JLabel lblNewLabel_3;
	private JLabel lblNewLabel_4;
	private JLabel lblNewLabel_5;

	private int totPilotNumber = 0;
	private int totPilotFinish = 0;
	private int totNumLap;

	/**
	 * Create the application.
	 */
	public TimePanelImpl() {
		initialize();
	}

	public void setORB(ORB orb_val) {
		orb = orb_val;
	}

	public void shutdown() {
		orb.shutdown(false);
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {

		clock = new Date();

		frmMain = new JFrame();
		frmMain.setBounds(100, 100, 450, 300);
		frmMain.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmMain.getContentPane().setLayout(new BorderLayout(0, 0));

		pnlCenter = new JPanel();
		frmMain.getContentPane().add(pnlCenter, BorderLayout.CENTER);

		pnlNorth = new JPanel();
		frmMain.getContentPane().add(pnlNorth, BorderLayout.NORTH);
		pnlNorth.setLayout(new GridLayout(0, 1, 0, 0));

		pnlWest = new JPanel();
		frmMain.getContentPane().add(pnlWest, BorderLayout.WEST);
		pnlNorth.setLayout(new BorderLayout(0, 0));

		txtRaceDescription = new JTextField();
		txtRaceDescription.setHorizontalAlignment(SwingConstants.CENTER);
		txtRaceDescription.setEditable(false);
		pnlNorth.add(txtRaceDescription);
		txtRaceDescription.setColumns(10);

		pnlSouth = new JPanel();
		frmMain.getContentPane().add(pnlSouth, BorderLayout.SOUTH);
		pnlSouth.setLayout(new GridLayout(2, 3, 0, 0));

		lblNewLabel_2 = new JLabel("");
		pnlSouth.add(lblNewLabel_2);

		lblNewLabel = new JLabel("Miglior tempo su giro");
		pnlSouth.add(lblNewLabel);

		txtBestPilot = new JTextField();
		txtBestPilot.setEditable(false);
		pnlSouth.add(txtBestPilot);
		txtBestPilot.setColumns(10);

		txtBestTime = new JTextField();
		txtBestTime.setText("");
		txtBestTime.setEditable(false);
		pnlSouth.add(txtBestTime);
		txtBestTime.setColumns(10);

		lblNewLabel_4 = new JLabel("");
		pnlSouth.add(lblNewLabel_4);

		lblNewLabel_3 = new JLabel("");
		pnlSouth.add(lblNewLabel_3);

		lblNewLabel_1 = new JLabel("Stato gara");
		pnlSouth.add(lblNewLabel_1);

		txtRaceState = new JTextField();
		txtRaceState.setEditable(false);
		pnlSouth.add(txtRaceState);
		txtRaceState.setColumns(10);

		btnNewButton = new JButton("Ripristina");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				resetTable();
			}
		});
		pnlSouth.add(btnNewButton);

		lblNewLabel_5 = new JLabel("");
		pnlSouth.add(lblNewLabel_5);

		pnlEast = new JPanel();
		frmMain.getContentPane().add(pnlEast, BorderLayout.EAST);

		posDataModel = new DefaultTableModel();
		for (int col = 0; col < posColumnNames.length; col++) {
			posDataModel.addColumn(posColumnNames[col]);
		}
		pnlCenter.setLayout(null);

		scrPnlPos = new JScrollPane();
		scrPnlPos.setBounds(0, 0, 37, 499);
		pnlCenter.add(scrPnlPos);

		tblPos = new JTable(posDataModel);
		scrPnlPos.setViewportView(tblPos);

		timesDataModel = new DefaultTableModel();
		for (int col = 0; col < mainColumnNames.length; col++) {
			timesDataModel.addColumn(mainColumnNames[col]);
		}

		scrPnlTimes = new JScrollPane();
		scrPnlTimes.setBounds(36, 0, 1303, 499);
		pnlCenter.add(scrPnlTimes);

		tblTimes = new JTable(timesDataModel);
		scrPnlTimes.setViewportView(tblTimes);

		// for (int k = 1; k <= 22; k ++){
		// java.lang.Object[] row = {k};
		// posDataModel.addRow(row);
		// }
		// tblTimes.getComponent(0).setVisible(false);
		frmMain.setSize(1400, 600);
		frmMain.setVisible(true);
		resizeTable();
	}

	// resetta la tabella
	private void resetTable() {
		// Salvo il numero delle righe perchè cambia ad ogni ciclo del for
		int nRow = timesDataModel.getRowCount();
		for (int i = 0; i < nRow; i++) {
			// Le righe cambiano numero durante l'eliminazione
			// quindi elimino sempre quella in testa
			timesDataModel.removeRow(0);
		}
		int nRow2 = posDataModel.getRowCount();
		for (int i = 0; i < nRow2; i++) {
			// Le righe cambiano numero durante l'eliminazione
			// quindi elimino sempre quella in testa
			posDataModel.removeRow(0);
		}
		ColumnsAutoSizer.sizeColumnsToFit(tblTimes);
		txtRaceState.setText("");
		txtBestPilot.setText("");
		txtBestTime.setText("");
		txtRaceDescription.setText("");
		sortTable();
		resizeTable();
	}

	// metodo di test
	public String echoString(String Mesg) {
		System.out.println("Ho ricevuto da client " + Mesg);
		return Mesg;
	}

	// aggiunge un nuovo pilota a monitor
	public void sendPilot(int num, String name, String car, String strategy,
			String fuelLevel) {
		String[] temp = strategy.split(",");
		String strategyStr = "";
		for (int i = 0; i < temp.length - 1; i++) {
			Float fObj = new Float(temp[i]);
			strategyStr = strategyStr + fObj.toString() + ", ";
			// use toString method of Float class to convert Float into String.
			String str = fObj.toString();
		}
		Float flTemp = new Float(fuelLevel);
		strategyStr = strategyStr.substring(0, strategyStr.length() - 2);
		java.lang.Object[] row = { name, num, car, "", "", "", "", "--:--:--",
				1, "in pista", 0, flTemp.toString(), strategyStr, "", 0, 0, 0 };
		timesDataModel.addRow(row);
		totPilotNumber = totPilotNumber + 1;
		java.lang.Object[] row2 = { totPilotNumber };
		posDataModel.addRow(row2);
		System.out.println("pilota aggiunto!!");
		resizeTable();
	}

	// aggiorna l'intermedio di un pilota
	public void sendPilotIntermediate(int pilotNum, String time, int lapNum,
			int intermediateNum, int ticket, String totTime) {
		// long timeNow = System.currentTimeMillis();
		boolean isPresent = false;
		int rowNumber = 0;
		int setRowNumber = 0;
		while ((isPresent == false)
				&& (rowNumber < timesDataModel.getRowCount())) {
			if (((Integer) timesDataModel.getValueAt(rowNumber, 1))
					.equals(new Integer(pilotNum))) {
				isPresent = true;
				setRowNumber = rowNumber;
			} else {
				rowNumber += 1;
			}
		}
		// converto il formato del tempo dell'intermedio
		float fltTime = Float.parseFloat(time);
		// esprimo il tempo in millisecondi
		fltTime = fltTime * 1000;
		// arrotondo ai millisecondo
		long lngTime = Math.round(fltTime);
		// calcolo il tempo da inizio gara

		float fltTotTime = Float.parseFloat(totTime);
		// esprimo il tempo in millisecondi
		fltTotTime = fltTotTime * 1000;
		// arrotondo ai millisecondo
		long lngTotTime = Math.round(fltTotTime);

		// stringa del distacco
		String distanceStr = "--:--:--";
		if (intermediateMatrix[lapNum - 1][intermediateNum - 1] == 0) {
			intermediateMatrix[lapNum - 1][intermediateNum - 1] = lngTotTime;
		} else {
			long distac = lngTotTime
					- intermediateMatrix[lapNum - 1][intermediateNum - 1];
			distanceStr = String.format("%02d:%02d:%03d",
					(distac % 3600000) / 60000, (distac % 60000) / 1000,
					(distac % 1000));
		}
		// sovrascrivo la stringa col tempo
		time = String.format("%02d:%02d:%03d", (lngTime % 3600000) / 60000,
				(lngTime % 60000) / 1000, (lngTime % 1000));
		if (isPresent == true) {
			String lapNumStr = lapNum + "";
			String intermediateNumStr = intermediateNum + "";
			String ticketStr = ticket + "";
			String sorter = String.format("%03d", lapNum)
					+ String.format("%03d", intermediateNum)
					+ String.format("%08d", ticket);
			timesDataModel.setValueAt(time, setRowNumber, intermediateNum + 2);
			timesDataModel.setValueAt(intermediateNum, setRowNumber,
					getColumIndex("#Int"));
			timesDataModel.setValueAt(ticket, setRowNumber,
					getColumIndex("#Ticket"));
			timesDataModel.setValueAt(sorter, setRowNumber,
					getColumIndex("#Sort"));
			// timesDataModel.setValueAt(totTime, setRowNumber,
			// getColumIndex("Dist. dal primo"));
			timesDataModel.setValueAt(distanceStr, setRowNumber,
					getColumIndex("Dist. dal primo"));
			// Se non lo faccio il numero di giri viene incrementato con un
			// intermedio di ritardo
			if (intermediateNum == 4) {
				if (lapNum < totNumLap) {
					lapNum = lapNum + 1;
				}
				timesDataModel.setValueAt("", setRowNumber, 3);
				timesDataModel.setValueAt("", setRowNumber, 4);
				timesDataModel.setValueAt("", setRowNumber, 5);
				if ((txtBestTime.getText().equals(""))
						|| (time.compareTo(txtBestTime.getText()) <= -1)) {
					txtBestTime.setText(time);
					txtBestPilot.setText((String) timesDataModel.getValueAt(
							setRowNumber, getColumIndex("Nome Pilota")));
				}
			}
			timesDataModel.setValueAt(lapNum, setRowNumber,
					getColumIndex("#Giri"));
		}
		sortTable();
	}

	// notifica l'entrata ai box di un pilota
	public void enterBox(int pilotNum) {
		boolean isPresent = false;
		int rowNumber = 0;
		int setRowNumber = 0;
		while ((isPresent == false)
				&& (rowNumber < timesDataModel.getRowCount())) {
			if (((Integer) timesDataModel.getValueAt(rowNumber, 1))
					.equals(new Integer(pilotNum))) {
				isPresent = true;
				setRowNumber = rowNumber;
			} else {
				rowNumber += 1;
			}
		}
		Integer numPitStop = (Integer) timesDataModel.getValueAt(rowNumber, 8);
		numPitStop = numPitStop + 1;
		timesDataModel.setValueAt(numPitStop, rowNumber,
				getColumIndex("#Soste"));
		timesDataModel.setValueAt("Ai box", rowNumber,
				getColumIndex("Stato del pilota"));
		sortTable();
	}

	// notifica l'uscita dai box di un pilota
	public void exitBox(int pilotNum, String fuelLevel) {
		boolean isPresent = false;
		int rowNumber = 0;
		int setRowNumber = 0;
		while ((isPresent == false)
				&& (rowNumber < timesDataModel.getRowCount())) {
			if (((Integer) timesDataModel.getValueAt(rowNumber, 1))
					.equals(new Integer(pilotNum))) {
				isPresent = true;
				setRowNumber = rowNumber;
			} else {
				rowNumber += 1;
			}
		}
		float tmp = Float.valueOf(fuelLevel);
		timesDataModel.setValueAt("In pista", rowNumber,
				getColumIndex("Stato del pilota"));
		timesDataModel.setValueAt(tmp, rowNumber, getColumIndex("Carburante"));
		sortTable();
	}

	// riceve la descrizione della gara
	public void sendRaceDescription(String name, String lenght, String numLap,
			String meteo) {
		if (meteo.equals("DRY")) {
			meteo = "Asciutto";
		} else {
			meteo = "Bagnato";
		}
		txtRaceDescription.setText("Circuito: " + name + "        Lunghezza: "
				+ Float.parseFloat(lenght) + "m        Numero di giri: "
				+ numLap + "        Meteo: " + meteo);
		txtRaceState.setText("Schieramento in griglia...");
		sortTable();
		numLap = numLap.replace(" ", "");
		intermediateMatrix = new long[Integer.parseInt(numLap)][4];
		totNumLap = Integer.parseInt(numLap);
		for (int k = 0; k < totNumLap; k++) {
			for (int i = 0; i < 4; i++)
				intermediateMatrix[k][i] = 0;
		}
	}

	// notifica la partenza della gara
	public void sendStartRace() {
		txtRaceState.setText("Gara in corso!");
		sortTable();
	}

	// notifica il livello di carburant di un pilota
	public void sendFuelLevel(int pilotNum, String fuelLevel) {
		boolean isPresent = false;
		int rowNumber = 0;
		int setRowNumber = 0;
		while ((isPresent == false)
				&& (rowNumber < timesDataModel.getRowCount())) {
			if (((Integer) timesDataModel.getValueAt(rowNumber, 1))
					.equals(new Integer(pilotNum))) {
				isPresent = true;
				setRowNumber = rowNumber;
			} else {
				rowNumber += 1;
			}
		}
		float tmp = Float.valueOf(fuelLevel);
		timesDataModel.setValueAt(tmp, rowNumber, getColumIndex("Carburante"));
		sortTable();
	}

	// notifica la fine della gara di parte di un pilota
	public void sendFinishRace(int pilotNum, String time, int reason) {
		boolean isPresent = false;
		int rowNumber = 0;
		int setRowNumber = 0;
		while ((isPresent == false)
				&& (rowNumber < timesDataModel.getRowCount())) {
			if (((Integer) timesDataModel.getValueAt(rowNumber, 1))
					.equals(new Integer(pilotNum))) {
				isPresent = true;
				setRowNumber = rowNumber;
			} else {
				rowNumber += 1;
			}
		}
		// converto il formato del tempo dell'intermedio
		float fltTime = Float.parseFloat(time);
		// esprimo il tempo in millisecondi
		fltTime = fltTime * 1000;
		// arrotondo ai millisecondo
		long lngTime = Math.round(fltTime);
		// sovrascrivo la stringa col tempo
		time = String.format("%02d:%02d:%02d", (lngTime % 3600000) / 60000,
				(lngTime % 60000) / 1000, (lngTime % 1000));
		String txt = "";
		if (reason == 0) {
			txt = "gara finita";
		} else if (reason == 1) {
			txt = "benzina finita";
		} else {
			txt = "gusto";
		}
		timesDataModel.setValueAt(txt, rowNumber,
				getColumIndex("Stato del pilota"));
		timesDataModel.setValueAt(time, rowNumber, getColumIndex("Tempo Gara"));
		totPilotFinish = totPilotFinish + 1;
		if (totPilotFinish == totPilotNumber) {
			txtRaceState.setText("Gara finita!!");
		}else{
			txtRaceState.setText("Gara in corso" + totPilotFinish + "/" + totPilotNumber);
		}
		resizeTable();
		sortTable();
	}

	// aggiorna la larghezza della tabella
	public void sortTable() {
		try {
			TableRowSorter<TableModel> sorter = new TableRowSorter<TableModel>(
					tblTimes.getModel());
			for (int i = 0; i < tblTimes.getColumnCount() - 1; i++) {
				sorter.setSortable(i, false);
			}
			List<RowSorter.SortKey> sortKeys = new ArrayList<RowSorter.SortKey>();
			sortKeys.add(new RowSorter.SortKey(16, SortOrder.DESCENDING));
			sorter.setSortKeys(sortKeys);
			tblTimes.setRowSorter(sorter);
			tblTimes.setAutoCreateRowSorter(false);
		} catch (Exception e) {
			System.out.println(e.getMessage());

		}
	}

	// riordina la tabella
	public void resizeTable() {
		ColumnsAutoSizer.sizeColumnsToFit(tblTimes);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Int"))
				.setMinWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Int"))
				.setMaxWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Int")).setWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Ticket"))
				.setMinWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Ticket"))
				.setMaxWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Ticket"))
				.setWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Sort"))
				.setMinWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Sort"))
				.setMaxWidth(0);
		tblTimes.getColumnModel().getColumn(getColumIndex("#Sort")).setWidth(0);
	}

	// resitituisce l'indice di una colonna dato il nome
	private int getColumIndex(String name) {
		int index = -1;
		for (int i = 0; (i < timesDataModel.getColumnCount()); i++) {
			if (name.equalsIgnoreCase(timesDataModel.getColumnName(i))) {
				index = i;
			}
		}
		return index;
	}

	// metodo di test
	public int test(int num) {
		System.out.println("Ho ricevuto da client " + num);
		Random generator = new Random();
		int num2 = generator.nextInt(100);
		System.out.println("Generato il numero " + num2);
		return num2;
	}

}
