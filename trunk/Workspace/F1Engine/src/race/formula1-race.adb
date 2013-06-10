package body Formula1.Race is

   -- procedura per impostare la gara partendo da una configurazione
   procedure Build_Race (Configuration : in Configuration_T.Vector) is
      -- Configuration : Configuration_T.Vector;
      -- uso il riferimento perchè non conosco a priori la lunghezza della stringa
      Circuit_Filename_Ref : String_Ref_T;
   begin
      -- ottengo l'oggetto che contiene la configurazione
      -- Read_Config_File (Race_Filename, Configuration);
      -- ottengo il riferimento al nome del circuito
      Circuit_Filename_Ref := Configuration.Element(0).all.Element(0);
      -- ottengo il numero di giri
      The_Race.Num_Laps := Integer'Value (Configuration.Element(1).all.Element(0).all);
      -- ottengo le condizioni meteo
      The_Race.Meteo := Meteo_T'Value (Configuration.Element (2).all.Element (0).all);
      -- costruisco il tracciato sulla variabilie Track
      Build_Track (Circuit_Filename_Ref.all);
      -- inserisco il tracciato Track nella gara Race
      The_Race.Track := Track_Race;
      -- ho finito la costruzione del circuito, posso liberae la memoria
      -- Free(Configuration_Ref);
      null;
   end Build_Race;
   --+------------

   -- procedura per far partire la gara
   procedure Start_Race is
   begin
      null;
   end Start_Race;
   --+------------

end Formula1.Race;
