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

      Subs : String_Split.Slice_Set;
      Seps : constant String := " #" & Latin_1.HT;
      Tokens_Ref : String_Vector_Ref_T;
   begin
      String_Split.Create (S          => Subs,
			   From       => Str,
			   Separators => Seps,
			   Mode       => String_Split.Multiple);
      Tokens_Ref := new String_Vector_T.Vector;
      for I in 1 .. String_Split.Slice_Count (Subs) loop
	 declare
	    Sub : constant String := String_Split.Slice (Subs, I);
	 begin
	    String_Vector_Ref.all.Append (new String'(Sub));
	 end;
      end loop;
   end String_Tokenizer;
   --+------------

   procedure Read_Config_File (Filename : in String; Configuration : in out Configuration_T.Vector) is
      Segment_Conf     : String_Vector_T.Vector;
      File             : Ada.Text_IO.File_Type;
   begin
      -- apro il file contenente la configurazione
      Ada.Text_IO.Open (File => File,
			Mode => Ada.Text_IO.In_File,
			Name => Filename);
      -- estraggo le informazione dal circuito e le metto in una struttura comoda da maneggiare
      -- ciclo per la lettura del file
      while not Ada.Text_IO.End_Of_File (File) loop
	 declare
	    -- Leggo la prima riga togliendo gli spazi all'inizio e alla fine
	    Line              : String := Trim (Ada.Text_IO.Get_Line (File), Both);
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
   end Read_Config_File;
   --+------------

end Formula1;
