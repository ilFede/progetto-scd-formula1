with Ada.Containers.Vectors;
with Track;
with Car;
with Pilot;
with Common;

package Race is
   use Track;
   use Common;


   -- definizione del tipo di record che rappresenta un circuito
   type Race_T is
   -- parametri che caratterizzano un circuito
      record
      -- circito
	 Track_Ref : Track_Ref_T;
	 -- numero di giri
	 Num_Laps  : Positive;
	 -- condizioni meteo
	 Meteo     : Meteo_T;
      end record;

   -- instanza della gara
   Race : Race_T;

   -- procedura per configurare la gara partendo da una configurazione
   procedure Build_Race (Race_Filename : in String);

   -- procedura per far partire la gara
   procedure Start_Race;

   -- entit� che rappresenta il circuito
   Race_Track : Track_T;
   end Race;