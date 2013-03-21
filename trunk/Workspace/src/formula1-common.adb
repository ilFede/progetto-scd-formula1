with Ada.Characters.Latin_1;
with Ada.Text_IO;
with GNAT.String_Split;
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;


package body Formula1 is

   procedure String_Tokenizer (Str : in String; String_Vector_Ref : in out String_Vector_Ref_T) is
      use Ada.Characters;
      use Ada.Text_IO;
      use GNAT;

      --  The input data would normally be read from some external source or
      --  whatever. Latin_1.HT is a horizontal tab.

      Subs : String_Split.Slice_Set;
      --  Subs is populated by the actual substrings.

      Seps : constant String := " #" & Latin_1.HT;
      --  just an arbitrary simple set of whitespace.
      Tokens_Ref : String_Vector_Ref_T;
   begin
      Put_Line ("Splitting '" & Str & "' at whitespace.");
      --  Introduce our job.

      String_Split.Create (S          => Subs,
			   From       => Str,
			   Separators => Seps,
			   Mode       => String_Split.Multiple);
      --  Create the split, using Multiple mode to treat strings of multiple
      --  whitespace characters as a single separator.
      --  This populates the Subs object.

      Put_Line ("Got" & String_Split.Slice_Number'Image (String_Split.Slice_Count (Subs)) & " substrings:");
      --  Report results, starting with the count of substrings created.
      Tokens_Ref := new String_Vector_T.Vector;

      for I in 1 .. String_Split.Slice_Count (Subs) loop
	 --  Loop though the substrings.
	 declare
	    Sub : constant String := String_Split.Slice (Subs, I);
	    --  Pull the next substring out into a string object for easy handling.
	 begin
	    Put_Line (String_Split.Slice_Number'Image (I) &
		 " -> " &
		 Sub &
		 " (length" & Positive'Image (Sub'Length) &
		 ")");

	    --  Output the individual substrings, and their length.
	    String_Vector_Ref.all.Append (new String'(Sub));
	 end;
      end loop;
   end String_Tokenizer;
   --+------------

   procedure Read_Config_File (Filename : in String; Configuration : in out Configuration_T.Vector) is
      Segment_Conf     : String_Vector_T.Vector;
      -- Conf_Ref   : Configuration_Ref_T;
      File             : Ada.Text_IO.File_Type;
   begin
      -- apro il file contenente la configurazione
      Ada.Text_IO.Open (File => File,
			Mode => Ada.Text_IO.In_File,
			Name => Filename);
      -- estraggo le informazione dal circuito e le metto in una struttura comoda da maneggiare
      -- struttura dove salvo i dati
      -- Conf_Ref := new Configuration_T.Vector;
      -- ciclo per la lettura del file
      while not Ada.Text_IO.End_Of_File (File) loop
	 declare
	    -- Leggo la prima riga togliendo gli spazi all'inizio e alla fine
	    Line              : String := Trim (Ada.Text_IO.Get_Line (File), Both);
	    --Line_Trim : String := Trim (Line, Both);
	    String_Vector_Ref : String_Vector_Ref_T := new String_Vector_T.Vector;
	 begin
	    -- ignoro i commenti
	    if Line'Length /= 0 and then Line (Line'First) /= '#' then
	       -- ottengo i token
	       String_Tokenizer (Line, String_Vector_Ref);
	       -- salvo il segmento nella struttura dati
	       Configuration.Append (String_Vector_Ref);
	    end if;
	 end;
      end loop;
      -- chiudo il file
      Ada.Text_IO.Close (File);
      -- restituisco la configurazione
   end Read_Config_File;
   --+------------

   -- procedura per otttenere una configurazione da un file di testo
   --function Get_Config (Filename : in String) return Configuration_Ref_T is
   --begin
   --return Read_Config_File (Filename);
   --end Get_Config;
   --+------------

   procedure Race_Startup is
   -- configurazione di un pilota
      Pilot_Configuration : Configuration_T.Vector;
      -- vettore di piloti
      Pilot_Vett          : Pilot_Vector_T.Vector;
   begin
      null;
      -- costrisco il circuito
      Build_Race (Race_Config_Path & Race_Config_Filename);
      -- istanzio e configuro i piloti
      Read_Config_File (Race_Config_Path & Competitors_Config_Filename, Pilot_Configuration);
      -- per ogni pilota creo il task e carico la strategia

      for I in Pilot_Configuration.First_Index .. Pilot_Configuration.Last_Index loop
	 declare
	    Configuration       : String_Vector_Ref_T := Pilot_Configuration.Element (I);
	    Strategy            : Float_Vector_Ref_T := new Float_Vector_T.Vector;
	    Pilot_Ref           : Pilot_Ref_T;
	    Pilot_Name_Filename : String_Ref_T := Configuration.Element (0);
	    Pilot_Car_Filename  : String_Ref_T := Configuration.Element (1);
	 begin
	    -- leggo la stetegia
	    for J in 2 .. Configuration.Last_Index loop
	       Strategy.Append (Float'Value (Configuration.Element (J).all));
	    end loop;
	    -- creo il pilota e lo appendo al vettore di piloti
	    Pilot_Ref := new Pilot_T (Pilot_Name_Filename, Pilot_Car_Filename, Strategy);
	    Pilot_Vett.Append (Pilot_Ref);
	    null;
	 end;
      end loop;


      null;


      -- Plt_Ref := Build_Pilot("Vettel.plt");
      -- Car_Ref := Build_Car("Redbull.car");
      null;
      -- configuro il circuito
      -- Build_Track("");
      -- CircuitTrack.CircuitConfig;
      -- Put_Line("dadsdsad");
      -- Circuit_Config;
      -- Put_Line("dadsdsad");
      --test := new Race_Pilot (8);

   end Race_Startup;
   --+------------

end Formula1;
