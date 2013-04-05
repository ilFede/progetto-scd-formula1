package scd.formula1;

import java.awt.BorderLayout;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.RowSorter;
import javax.swing.SortOrder;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class ControlPanel {

	private String[] columnNames = { "Pos", "Name", "Num", "#1 Int", "#2 Int",
	      "#3 Int", "Lap Time", "NumInt", "LastNotifTime" };

	private JFrame frmMain;
	private JScrollPane scrPnlMain;
	private JTable tblTimes;
	private JPanel pnlNorth;
	private JPanel pnlSouth;
	private JPanel pnlWest;
	private JPanel pnlEast;
	private DefaultTableModel timesDataModel;

	private Date clock;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		ControlPanel window = new ControlPanel();
		window.frmMain.setVisible(true);
		window.addPilot("Vettel", "2");
		window.addPilot("Vettel", "1");
		window.addPilot("Maldorado", "2");
		window.addPilot("Vettel", "4");
		window.addPilot("Vettel", "3");
		window.addPilot("Maldorado", "1");

		window.setPilotIntermediate("1", 1, "ciao");

	}

	/**
	 * Create the application.
	 */
	public ControlPanel() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {

		clock = new Date();

		timesDataModel = new DefaultTableModel();
		for (int col = 0; col < columnNames.length; col++) {
			timesDataModel.addColumn(columnNames[col]);
		}

		frmMain = new JFrame();
		frmMain.setBounds(100, 100, 450, 300);
		frmMain.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmMain.getContentPane().setLayout(new BorderLayout(0, 0));

		JPanel panel = new JPanel();
		frmMain.getContentPane().add(panel, BorderLayout.CENTER);
		panel.setLayout(new BorderLayout(0, 0));

		scrPnlMain = new JScrollPane();
		panel.add(scrPnlMain, BorderLayout.CENTER);

		tblTimes = new JTable(timesDataModel);
		scrPnlMain.setViewportView(tblTimes);

		pnlNorth = new JPanel();
		frmMain.getContentPane().add(pnlNorth, BorderLayout.NORTH);

		pnlSouth = new JPanel();
		frmMain.getContentPane().add(pnlSouth, BorderLayout.SOUTH);

		pnlWest = new JPanel();
		frmMain.getContentPane().add(pnlWest, BorderLayout.WEST);

		pnlEast = new JPanel();
		frmMain.getContentPane().add(pnlEast, BorderLayout.EAST);

		tblTimes.getColumnModel().getColumn(7).setMinWidth(0);
		tblTimes.getColumnModel().getColumn(7).setMaxWidth(0);
		tblTimes.getColumnModel().getColumn(7).setWidth(0);

		TableRowSorter<TableModel> sorter = new TableRowSorter<TableModel>(
		      tblTimes.getModel());
		tblTimes.setRowSorter(sorter);

		List<RowSorter.SortKey> sortKeys = new ArrayList<RowSorter.SortKey>();
		sortKeys.add(new RowSorter.SortKey(1, SortOrder.ASCENDING));
		sortKeys.add(new RowSorter.SortKey(2, SortOrder.ASCENDING));
		sorter.setSortKeys(sortKeys);

	}

	public void setPilotIntermediate(String pilotNum, int intermediateNum,
	      String intermediateTime) {
		boolean isPresent = false;
		int rowNumber = 0;
		int setRowNumber = 0;
		while ((isPresent == false) && (rowNumber < timesDataModel.getRowCount())) {
			if (timesDataModel.getValueAt(rowNumber, 2) == pilotNum) {
				isPresent = true;
				setRowNumber = rowNumber;
			}
			rowNumber += 1;
		}

		if (isPresent == true) {
			timesDataModel.setValueAt(intermediateTime, setRowNumber,
			      (intermediateNum + 2));
		}
	}

	public void addPilot(String name, String num) {
		Object[] row = { "-", name, num, "-", "-", "-", "-", clock.getTime(), 0 };
		timesDataModel.addRow(row);
	}

}
