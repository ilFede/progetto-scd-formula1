with Ada.Containers.Vectors;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Corba; use Corba;
with Ada.Calendar; use Ada.Calendar;

package Formula1 is

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI GENERICI
   ---------------------------------------------------

   -- sottotipo per la velocit�
   --type Speed_T is digits 2 range 0.0 .. 600.0;

   -- sottotipo per la distaza
   --type Distance_T is digits 2 range 0.0 .. 100000.0;

   -- tipo per distanze e velocit�
   type Real_T is digits 2 range -1000000.0..1000000.0;


   -- sottotipo per la lunghezza del segmento
   -- subtype Length_T is Positive range 1 .. Positive'Last;

   -- puntatore ad una stringa
   type String_Ref_T is access String;

   -- array per i token delle configurazioni
   package String_Vector_T is new Ada.Containers.Vectors
     (Element_Type => String_Ref_T,
      Index_Type   => Natural);

   -- array integer usato per le strategie
   package Integer_Vector_T is new Ada.Containers.Vectors
     (Element_Type => Integer,
      Index_Type   => Natural);

   -- accesso per Float_Vector_T
    type Integer_Vector_Ref_T is access Integer_Vector_T.Vector;

   -- riferimento per accedere all'array di stringhe
   type String_Vector_Ref_T is access String_Vector_T.Vector;

   -- struttura per memorizzare una intera configurazione, � un'array di String_Vector_Ref_T
   package Configuration_T is new Ada.Containers.Vectors
     (Element_Type => String_Vector_Ref_T,
      Index_Type   => Natural);

   -- riferimento per accedere al tipo Conf_T
   type Configuration_Vect_Ref_T is access Configuration_T.Vector;

   -- sottotipo per le percuntuali
   subtype Percent_T is Float range 0.0..100.0;

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER  LA GARA
   ---------------------------------------------------

   -- sottotipo per il meteo
   type Meteo_T is (dry, wet);

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER I SEGMENTI E SOTTOSEGMENTI
   ---------------------------------------------------

   -- costante con la lunghezza in metri di un sottosegmento
   Subsegment_Lenght : Real_T := 300.0;

   -- tipo del segmento
   type Segment_Type_T is (acc, const, dec, box);

   -- sottotipo per il numero di corsie del segmento e sottosegmento
   subtype Num_Lanes_Seg_T is Positive range 1 .. 2;

   -- tipo per determinare se un segmento ha il rilevamento dei tempi
   subtype Has_Time_Check_T is Corba.Long range 0..4;

   -- costante per il distacco minimo delle auto
   Min_Gap : Duration := 0.05;

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER I PILOTI
   ---------------------------------------------------

   -- sottotipo per la skil di accelerazione
   subtype Skill_Acceleration_T is Positive range 1..10;

   -- sottotipo per il coefficente di decelerazione
   subtype Skill_Deceleration_T is Positive range 1..10;

   -- istante di inizio della gara
   Race_Start_Time : Time;

   ---------------------------------------------------
   -- DEFINIZIONE DEI TIPI E SOTTOTIPI PER LE VETTURE
   ---------------------------------------------------

   -- sottotipo per il coefficente di accelerazione
   subtype Coeff_Acceleration_T is Positive range 1..10;

   -- sottotipo per il coefficente di decelerazione
   subtype Coeff_Deceleration_T is Positive range 1..10;

   -- sottotipo per il coefficente di tenuta
   subtype Coeff_Roadholding_T is Positive range 1..10;

   -- sottotipo per il coefficente di usrura gomme
   subtype Coeff_Tire_Wear_T is Positive range 1..10;

   -- sottotipo per il coefficente di affidabilit�
   subtype Coeff_Reliability_T is Integer range 1..100;

   -- sottotipo per le condizioni delle gomme
   subtype Tires_Condition_T is Corba.Long range 0..2;
   -- 0 => Buone
   -- 1 => Mediocri
   -- 2 => Consumate

   -- sottotipo per il consumo di carburante
   subtype Car_Consumption_T is Float range 0.0..300.0;

   -- costante di decelazione standard
   Standard_Deceleration : Real_T := 39.0;

   ---------------------------------------------------
   -- COSTANTI PER LA MODELLAZIONED DELL'ACCELERAZIONE
   ---------------------------------------------------

   -- tipo per le costanti nelle funzioni logaritmiche dell'accelerazione
   -- type Log_Constant is digits 4 range 0.0..200.0;

   -- definizione delle costanti
   Alpha : constant Real_T := 80.0;
   Beta : constant Real_T := 100.0;

   ---------------------------------------------------
   -- PATH PER LE VARIE CONFIGURAZIONI
   ---------------------------------------------------

   -- costante con il path delle configurazioni di gara e piloti partecipanti
   Race_Config_Path : String := "../conf/";

   -- costante con le configurazioni dei singoli piloti dispinibili
   Pilots_Set_Path : String := "../conf/pilots_set/";

   -- costante con le configurazioni delle singole vetture dispinibili
   Cars_Set_Path : String := "../conf/cars_set/";

   -- costante con le configurazioni dei singoli circiti dispinibili
   Circuits_Set_Path : String := "../conf/circuits_set/";

   -- costante con le configurazioni dello IOR
   IOR_Set_Path : String := "../../";


   -- nome file con la configurazione della gara
   -- Race_Config_Filename : constant String := "race.conf";

   -- nome file con la configurazione dei concorrenti
   -- Competitors_Config_Filename : constant String := "competitors.conf";


   ---------------------------------------------------
   -- DEFINIZIONE DELLE FUNZIONI E PROCEDURE GENERICHE
   ---------------------------------------------------

   -- funzione per fare il token di una stringa, restituisce un riferimento ad un vector di puntatori a stringhe
   procedure String_Tokenizer (Str : in String; String_Vector_Ref : in out String_Vector_Ref_T);

   -- funzione per leggere il file di configurazione e salvarlo in una struttura comoda
   procedure Read_Config_File (Filename : in String; Configuration : in out Configuration_T.Vector);

   -- funzione per ottenere una configurazione leggendola da file
   --function Get_Config (Filename : String) return Configuration_Ref_T;


end Formula1;
