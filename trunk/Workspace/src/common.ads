with Ada.Containers.Vectors;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

package Common is

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI GENERICI
   ---------------------------------------------------

   -- sottotipo per la velocità
   subtype Speed_T is Float range 1.0 .. 600.0;

   -- sottotipo per la lunghezza del segmento
   -- subtype Length_T is Positive range 1 .. Positive'Last;

   -- puntatore ad una stringa
   type String_Ref_T is access String;

 -- array per i token delle configurazioni
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

   ---------------------------------------------------
   -- DEFINIZIONE DELLE FUNZIONI E PROCEDURE GENERICHE
   ---------------------------------------------------

   -- funzione per fare il token di una stringa, restituisce un riferimento ad un vector di puntatori a stringhe
   function String_Tokenizer (Str : in String) return String_Vector_Ref_T;

   -- funzione per leggere il file di configurazione e salvarlo in una struttura comoda
   function Read_Config_File (Filename : in String) return Configuration_Ref_T;

   -- funzione per ottenere una configurazione leggendola da file
   --function Get_Config (Filename : String) return Configuration_Ref_T;

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER  LA GARA
   ---------------------------------------------------

   -- sottotipo per il meteo
   type Meteo_T is (dry, wet);

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER I PILOTI
   ---------------------------------------------------

   -- sottotipo per la skil di accelerazione
   subtype Skill_Acceleration_T is Positive range 1..10;

   -- sottotipo per il coefficente di decelerazione
   subtype Skill_Deceleration_T is Positive range 1..10;

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER LE VETTURE
   ---------------------------------------------------

   -- sottotipo per il coefficente di accelerazione
   subtype Coeff_Acceleration_T is Positive range 1..10;

   -- sottotipo per il coefficente di decelerazione
   subtype Coeff_Deceleration_T is Positive range 1..10;

   -- sottotipo per il coefficente di tenuta
   subtype Coeff_Roadholding_T is Positive range 1..10;

   -- sottotipo per il consumo di carburante
   subtype Car_Consumption_T is Float range 0.0..300.0;

   ---------------------------------------------------
   -- PATH PER LE VARIE CONFIGURAZIONI
   ---------------------------------------------------

   -- costante con il path delle configurazioni di gara e piloti partecipanti
   Race_Config_Path : String := "./conf/";

   -- costante con le configurazioni dei singoli piloti dispinibili
   Pilots_Set_Path : String := "./conf/pilots_set/";

   -- costante con le configurazioni delle singole vetture dispinibili
   Cars_Set_Path : String := "./conf/cars_set/";

   -- costante con le configurazioni dei singoli circiti dispinibili
   Circuits_Set_Path : String := "./conf/circuits_set/";

 ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER I SEGMENTI E SOTTOSEGMENTI
   ---------------------------------------------------

   -- costante con la lunghezza in metri di un sottosegmento
   Subsegment_Lengh : Positive := 1;

   -- tipo del segmento
   type Segment_Type_T is (acc, const, dec, box);

   -- sottotipo per il numero di corsie del segmento e sottosegmento
   subtype Num_Lanes_Seg_T is Positive range 1 .. 2;

   -- tipo per determinare se un segmento ha il rilevamento dei tempi
   type Has_Time_Check_T is (yes, no);

end Common;
