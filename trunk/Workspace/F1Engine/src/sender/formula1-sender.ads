with CORBA;
with CORBA.ORB;

with MDLControlPanel.TimePanelInterface;
with MDLControlPanel.TimePanelInterface.Helper;

package Formula1.Sender is

   -- risorsa protetta sottosegmento
   protected type Sender_T is

      -- procedura per inizializzare CORBA
      procedure Inizialize_Corba (IOR_Ref : String_Ref_T);

      -- procedura per aggiungere il pilota al pannello
      procedure Add_Pilot (Pilot_Number : in CORBA.long; Pilot_Name : in String_Ref_T; Pilot_Surname : in String_Ref_T; Pilot_Car : in String_Ref_T; Pilot_Strategy_Str : in String_Ref_T; Car_Fuel_Level_Ref : in String_Ref_T);

      -- procedura per inviare il tempo dell'intermedio
      procedure Send_Time (Pilot_Number : in CORBA.long; Time : in String_Ref_T; Num_Lap : in CORBA.Long; Num_Intermediate : in CORBA.Long; Ticket : in Corba.Long; Tot_Time : in String_Ref_T);

      -- notifica l'ingresso ai box
      procedure Enter_Box (Pilot_Number : in CORBA.Long);

      -- notifica l'uscita dai box
      procedure Exit_Box (Pilot_Number : in CORBA.Long; Fuel_Level : in String_Ref_T);

      -- invia la descrizione del circuito
      procedure Send_Circuiti_Description (Circuit_Name : in String_Ref_T; Length : in String_Ref_T; Num_Laps : in String_Ref_T; Meteo : in String_Ref_T);

      -- notifica la partenza
      procedure Send_Start_Race;

      -- invia la quantità di benzina rimasta
      procedure Send_Fuel_And_Tires (Pilot_Number : in CORBA.Long; Fuel_Level : in String_Ref_T; Tires_Wear : in Corba.Long);

      -- notifica la fine della gara per il pilota
      procedure Send_Finish_Race (Pilot_Number : in CORBA.Long; Time : in String_Ref_T; Reason : in Corba.Long);


   private
      MyInterface : MDLControlPanel.TimePanelInterface.Ref;


   end Sender_T;

   type Sender_Ref_T is access Sender_T;


end Formula1.Sender;
