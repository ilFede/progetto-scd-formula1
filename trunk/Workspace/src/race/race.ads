with Ada.Containers.Vectors;
with Track;
with Common;

package Race is
   use Track;
   use Common;


   -- definizione del tipo di record che rappresenta un circuito
   type Race is
   -- parametri che caratterizzano un circuito
   record
      -- circito
      Track_Ref : Track_Ref_T;
      -- numero di giri
      Num_Laps : Positive;
      -- condizioni meteo
      Meteo : Meteo_T;
   end record;

   -- procedure per ottenere una configurazione di gara partendo da un file
   function Get_Config(Filename : in String) return Configuration_Ref_T;

   -- procedura per configurare la gara partendo da una configurazione
   procedure Build_Race (Configuration_Ref : in Configuration_Ref_T);

   -- entità che rappresenta il circuito
   Race_Track : Track_T;
end Race;
