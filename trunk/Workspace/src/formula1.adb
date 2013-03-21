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

end Formula1;
