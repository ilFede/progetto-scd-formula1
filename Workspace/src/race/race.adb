package body Race is

   -- procedura per impostare la gara partendo da una configurazione
   procedure Build_Race (Race_Filename : in String) is
      Configuration_Ref : Configuration_Ref_T;
      -- uso il riferimento perchè non conosco a priori la lunghezza della stringa
      Circuit_Filename_Ref : String_Ref_T;
   begin
      -- ottengo l'oggetto che contiene la configurazione
      Configuration_Ref := Read_Config_File (Race_Filename);
      -- ottengo il riferimento al nome del circuito
      Circuit_Filename_Ref := Configuration_Ref.all.Element(0).all.Element(0);
      -- ottengo il numero di giri
      Race.Num_Laps := Integer'Value (Configuration_Ref.all.Element(1).all.Element(0).all);
      -- ottengo le condizioni meteo
      Race.Meteo := Meteo_T'Value (Configuration_Ref.all.Element(2).all.Element(0).all);
      -- il nome del circuito è un riferimento contenuto nella struttura dati Configuration_Ref
      Race.Track_Ref := Build_Track (Circuit_Filename_Ref.all);
      null;
   end Build_Race;
   --+------------

   -- procedura per far partire la gara
   procedure Start_Race is
   begin
      null;
   end Start_Race;
   --+------------

end Race;
