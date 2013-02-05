package body Race is

   -- procedura per otttenere una configurazione da un file di testo
   function Get_Config (Filename : in String) return Configuration_Ref_T is
   begin
      return Read_Config_File (Filename);
   end Get_Config;
   --+------------

   -- procedura per impostare la gara partendo da una configurazione
   procedure Build_Race (Configuration_Ref : in Configuration_Ref_T) is
   begin
      null;
   end Build_Race;
   --+------------

end Race;
