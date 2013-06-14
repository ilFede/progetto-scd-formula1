with MDLControlPanel.TimePanelInterface;
with MDLControlPanel.TimePanelInterface.Helper;
with CORBA;
with Ada.Command_Line; use Ada.Command_Line;


with Ada.Command_Line;

package body Formula1.Sender is

   protected body Sender_T is

      -- inizializza CORBA
      procedure Inizialize_Corba (IOR_Ref : String_Ref_T) is
      begin
         CORBA.ORB.Initialize ("ORB");
         CORBA.ORB.String_To_Object (CORBA.To_CORBA_String (IOR_Ref.all), MyInterface);
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end Inizialize_Corba;
      --+--------

      -- aggiunge un pilota
      procedure Add_Pilot (Pilot_Number : in CORBA.long; Pilot_Name : in String_Ref_T; Pilot_Surname : in String_Ref_T; Pilot_Car : in String_Ref_T; Pilot_Strategy_Str : in String_Ref_T; Car_Fuel_Level_Ref : in String_Ref_T) is
      begin
         MDLControlPanel.TimePanelInterface.sendPilot (MyInterface, Pilot_Number, CORBA.To_CORBA_String (Pilot_Name.all & " " & Pilot_Surname.all), CORBA.To_CORBA_String (Pilot_Car.all), CORBA.To_CORBA_String (Pilot_Strategy_Str.all), CORBA.To_CORBA_String (Car_Fuel_Level_Ref.all));
         -- MDLControlPanel.TimePanelInterface.sendPilot (MyInterface, CORBA.To_CORBA_String(CORBA.Long'Image(Number)), CORBA.To_CORBA_String (Name.all & Surname.all));
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end Add_Pilot;
      --+--------

      -- invia un intermedio
      procedure Send_Time (Pilot_Number : in CORBA.long; Time : in String_Ref_T; Num_Lap : in CORBA.Long; Num_Intermediate : in CORBA.Long; Ticket : in Corba.Long; Tot_Time : in String_Ref_T) is
      begin
         MDLControlPanel.TimePanelInterface.sendPilotIntermediate (MyInterface, Pilot_Number, CORBA.To_CORBA_String (Time.all), Num_Lap, Num_Intermediate, Ticket, CORBA.To_CORBA_String (Tot_Time.all));
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end Send_Time;
      --+--------

      -- notifica l'ingresso ai box
      procedure Enter_Box (Pilot_Number : in CORBA.Long) is
      begin
         MDLControlPanel.TimePanelInterface.enterBox (MyInterface, Pilot_Number);
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end;
      --+--------

      -- notifica l'uscita dai box
      procedure Exit_Box (Pilot_Number : in CORBA.Long; Fuel_Level : in String_Ref_T) is
      begin
         MDLControlPanel.TimePanelInterface.exitBox (MyInterface, Pilot_Number, CORBA.To_CORBA_String(Fuel_Level.all));
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end;
      --+--------

      -- invia la descrizione del circuito
      procedure Send_Circuiti_Description (Circuit_Name : in String_Ref_T; Length : in String_Ref_T; Num_Laps : in String_Ref_T; Meteo : in String_Ref_T) is
      begin
         MDLControlPanel.TimePanelInterface.sendRaceDescription(MyInterface, CORBA.To_CORBA_String (Circuit_Name.all), CORBA.To_CORBA_String (Length.all), CORBA.To_CORBA_String(Num_Laps.all), CORBA.To_CORBA_String(Meteo.all));
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end Send_Circuiti_Description;
      --+--------

      -- notifica l'avvio della gara
      procedure Send_Start_Race is
      begin
         MDLControlPanel.TimePanelInterface.sendStartRace (MyInterface);
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end Send_Start_Race;
      --+--------

      -- invia la quantità di benzina rimasta
      procedure Send_Fuel_And_Tires (Pilot_Number : in CORBA.Long; Fuel_Level : in String_Ref_T; Tires_Wear : in Corba.Long) is
      begin
         MDLControlPanel.TimePanelInterface.sendFuelAndTires (MyInterface, Pilot_Number, CORBA.To_CORBA_String (Fuel_Level.all), Tires_Wear);
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end;
      --+--------

      procedure Send_Finish_Race (Pilot_Number : in CORBA.Long; Time : in String_Ref_T; Reason : in Corba.Long) is
      begin
         MDLControlPanel.TimePanelInterface.sendFinishRace (MyInterface, Pilot_Number, CORBA.To_CORBA_String (Time.all), Reason);
      exception
         when others =>
            Put_Line ("!!!!!!!!! Impossibile inviare dati al monitor !!!!!!!!!");
      end Send_Finish_Race;
      --+--------

   end Sender_T;

end Formula1.Sender;
