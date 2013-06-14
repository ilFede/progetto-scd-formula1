with Formula1.Pilot; use Formula1.Pilot;
with Formula1.Race; use Formula1.Race;
with CORBA.ORB;
with PolyORB.Setup.Client;
with Formula1.Sender; use Formula1.Sender;
with Formula1.Grid; use Formula1.Grid;
with Ada.Calendar; use Ada.Calendar;


package body Formula1.Startup is

   procedure Race_Startup (Race_Config_Filename_Ref : in String_Ref_T; IOR_Str_Ref : in String_Ref_T) is
     --  controller per inviare i dati al monitor
      Sender_Ref      : Sender_Ref_T := new Formula1.Sender.Sender_T;
      --  configurazione di un concorrente (pilota + auto)
      Competitor_Configuration : Configuration_T.Vector;
      --  configurazione tracciato
      Track_Configuration : Configuration_T.Vector;
      --  vettore di piloti
      Pilot_Vett          : Pilot_Vector_T.Vector;
      Pilot_Ref           : Pilot_Ref_T;
      -- variabili di appoggio
      Ch        : Character;
      Available : Boolean := false;

   begin
      -- inizializo il monitor
      Sender_Ref.Inizialize_Corba (IOR_Str_Ref);
      -- estraggo i parametri della gara
      Read_Config_File (Race_Config_Path & Race_Config_Filename_Ref.all, Competitor_Configuration);
      -- estraggo le informazioni sul circuito
      for J in Competitor_Configuration.First_Index .. (Competitor_Configuration.First_Index + 2) loop
         Track_Configuration.Append(Competitor_Configuration.Element(J));
      end loop;
      -- costruisco il circuito
      Build_Race (Track_Configuration);
      -- Invio i dati al pannello
      Sender_Ref.all.Send_Circuiti_Description(The_Race.Track.Name, new String'(Real_T'Image(The_Race.Track.Lap_Length)), new String'(Positive'Image(The_Race.Num_Laps)), new String '(Meteo_T'Image(The_Race.Meteo)));
      -- istanzio e configuro i piloti
      -- Read_Config_File (Race_Config_Path & Competitors_Config_Filename, Competitor_Configuration);
      -- imposto il numero di piloti nella griglia
      The_Race.Track.Grid_Ref.all.Set_Num_Pilots(Competitor_Configuration.Last_Index - 2);
      -- per ogni pilota creo il task e carico la strategia
      Put_Line("***** SCHIERAMENTO PILOTI *****");
      for I in Competitor_Configuration.First_Index + 3 .. Competitor_Configuration.Last_Index loop
	 declare
	    Configuration       : String_Vector_Ref_T := Competitor_Configuration.Element (I);
	    Strategy            : Integer_Vector_Ref_T := new Integer_Vector_T.Vector;
	    Pilot_Filename_Ref : String_Ref_T := Configuration.Element (0);
	    Car_Filename_Ref  : String_Ref_T := Configuration.Element (1);
            Pilot_Configuration_Ref : Configuration_Vect_Ref_T := new Configuration_T.Vector;
            Car_Configuration_Ref : Configuration_Vect_Ref_T := new Configuration_T.Vector;

	 begin
            -- leggo e salvo la configurazione del pilota
            Read_Config_File (Pilots_Set_Path & Pilot_Filename_Ref.all, Pilot_Configuration_Ref.all);
            -- leggo e salvo la configurazione della vettira
            Read_Config_File (Cars_Set_Path & Car_Filename_Ref.all, Car_Configuration_Ref.all);
	    --	    -- leggo la stetegia
	    for J in 2 .. Configuration.Last_Index loop
	       Strategy.Append (Integer'Value (Configuration.Element (J).all));
	    end loop;
	    --	    -- creo il pilota e lo appendo al vettore di piloti
	    Pilot_Ref := new Pilot_T (Sender_Ref, Pilot_Configuration_Ref, Car_Configuration_Ref, Strategy);
	    --	    Pilot_Vett.Append (Pilot_Ref);
	    --	    null;
	 end;
      end loop;

      The_Race.Track.Grid_Ref.all.Wait_To_Pilots;
      delay Duration(1);

      Put_Line ("PILOTI SCHIERATI, PREMI UN TASTO PER PARTIRE");

      loop
	 Ada.Text_IO.Get_Immediate (Ch, Available);
	 exit when Available = true;
      end loop;

      Put_Line ("***** GARA AVVIATA!!! *****");

      Race_Start_Time := Clock;

      The_Race.Track.Grid_Ref.Start_Race;

      Sender_Ref.all.Send_Start_Race;

      -- Plt_Ref := Build_Pilot("Vettel.plt");
      -- Car_Ref := Build_Car("Redbull.car");
      -- configuro il circuito
      -- Build_Track("");
      -- CircuitTrack.CircuitConfig;
      -- Put_Line("dadsdsad");
      -- Circuit_Config;
      -- Put_Line("dadsdsad");
      --test := new Race_Pilot (8);

   end Race_Startup;
end Formula1.Startup;
