with Ada.Containers.Vectors;

package Common is

   -- tipo del segmento
   subtype Segment_Type_T is Positive range 1 .. 4;

   -- sottotipo per la velocità
   subtype Speed_T is Float range 1.0 .. 600.0;

   -- sottotipo per la lunghezza del segmento
   --subtype Length_T is Positive range 1 .. Positive'Last;

   -- sottotipo per il numero di corsie del segmento e sottosegmento
   subtype Num_Lanes_Seg_T is Positive range 1 .. 2;

   -- sottotipo per il coefficente di performance del segmento
   subtype Performance_Coeff_T is Positive range 1 .. 10;

   -- sottotipo per il meteo
   type Meteo_T is (Dry, Wet);

   -- puntatore ad una stringa
   type String_Ref_T is access String;

   -- array per i token delle configurazioni
   -- formato token:
   -- Circuito: condizione meteo | numero di giri
   -- Segmento: tipo | velocità | lunghezza | penalità prestazioni
   package String_Vector_T is new Ada.Containers.Vectors
     (Element_Type => String_Ref_T,
      Index_Type   => Natural);

   -- riferimento per accedere all'array di stringhe
   type String_Vector_Ref_T is access String_Vector_T.Vector;

   -- struttura per memorizzare una intera configurazione, è un'array di String_Vector_Ref_T
   package Configuration_T is new Ada.Containers.Vectors
     (Element_Type => String_Vector_Ref_T,
      Index_Type   => Natural);

   -- riferimento per accedere al tipo Conf_T
   type Configuration_Ref_T is access Configuration_T.Vector;

   -- funzione per fare il token di una stringa, restituisce un riferimento ad un vector di puntatori a stringhe
   function String_Tokenizer (Str : in String) return String_Vector_Ref_T;

   -- funzione per leggere il file di configurazione e salvarlo in una struttura comoda
   function Read_Config_File (Filename : in String) return Configuration_Ref_T;


end Common;
