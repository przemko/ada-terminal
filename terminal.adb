with Ada.Text_IO; use Ada.Text_IO;

package body Terminal is
   
   procedure Bell is
   begin
      Put (ASCII.BEL);
   end Bell;
   
   -----------------------------
   --     Obsługa kolorów     --
   -----------------------------
   
   procedure Reset_Color is
   begin
      Put (ASCII.ESC & "[39;49m");
   end Reset_Color;
   
   procedure Set_Color (Color : Color_Type; Intensity : Intensity_Type) is
   begin
      case Intensity is
	 when Normal  =>
	    case Color is
	       when Black =>
		  Put (ASCII.ESC & "[30m");
	       when Red =>
		  Put (ASCII.ESC & "[31m");
	       when Green =>
		  Put (ASCII.ESC & "[32m");
	       when Yellow =>
		  Put (ASCII.ESC & "[33m");
	       when Blue =>
		  Put (ASCII.ESC & "[34m");
	       when Magenta =>
		  Put (ASCII.ESC & "[35m");
	       when Cyan =>
		  Put (ASCII.ESC & "[36m");
	       when White =>
		  Put (ASCII.ESC & "[37m");
	    end case;
	 when Bright =>
	    case Color is
	       when Black =>
		  Put (ASCII.ESC & "[30;1m");
	       when Red =>
		  Put (ASCII.ESC & "[31;1m");
	       when Green =>
		  Put (ASCII.ESC & "[32;1m");
	       when Yellow =>
		  Put (ASCII.ESC & "[33;1m");
	       when Blue =>
		  Put (ASCII.ESC & "[34;1m");
	       when Magenta =>
		  Put (ASCII.ESC & "[35;1m");
	       when Cyan =>
		  Put (ASCII.ESC & "[36;1m");
	       when White =>
		  Put (ASCII.ESC & "[37;1m");
	    end case;
      end case;
   end Set_Color;
   
   procedure Set_Color (Color : Color_Type) is
   begin
      Set_Color (Color, Normal);
   end Set_Color;
   
   procedure Set_Background (Color : Color_Type; Intensity : Intensity_Type) is
   begin
      case Intensity is
	 when Normal =>
	    case Color is
	       when Black =>
		  Put (ASCII.ESC & "[40m");
	       when Red =>
		  Put (ASCII.ESC & "[41m");
	       when Green =>
		  Put (ASCII.ESC & "[42m");
	       when Yellow =>
		  Put (ASCII.ESC & "[43m");
	       when Blue =>
		  Put (ASCII.ESC & "[44m");
	       when Magenta =>
		  Put (ASCII.ESC & "[45m");
	       when Cyan =>
		  Put (ASCII.ESC & "[46m");
	       when White =>
		  Put (ASCII.ESC & "[47m");
	    end case;
	 when Bright =>
	    case Color is
	       when Black =>
		  Put (ASCII.ESC & "[100m");
	       when Red =>
		  Put (ASCII.ESC & "[101m");
	       when Green =>
		  Put (ASCII.ESC & "[102m");
	       when Yellow => 
		  Put (ASCII.ESC & "[103m");
	       when Blue =>
		  Put (ASCII.ESC & "[104m");
	       when Magenta =>
		  Put (ASCII.ESC & "[105m");
	       when Cyan =>
		  Put (ASCII.ESC & "[106m");
	       when White =>
		  Put (ASCII.ESC & "[107m");
	    end case;
      end case;
   end Set_Background;
   
   procedure Set_Background (Color : Color_Type) is
   begin
      Set_Background (Color, Normal);
   end Set_Background;
   
   procedure Set_Bright is
   begin
      Put (ASCII.ESC & "[1m");
   end Set_Bright;
   
   procedure Set_Dim is
   begin
      Put (ASCII.ESC & "[2m");
   end Set_Dim;
   
   procedure Set_Underline is
   begin
      Put (ASCII.ESC & "[4m");
   end Set_Underline;
   
   procedure Set_Blink is
   begin
      Put (ASCII.ESC & "[5m");
   end Set_Blink;
   
   procedure Set_Reverse is
   begin
      Put (ASCII.ESC & "[7m");
   end Set_Reverse;
   
   procedure Set_Hidden is
   begin
      Put (ASCII.ESC & "[8m");
   end Set_Hidden;
   
   procedure Reset_All is
   begin
      Put (ASCII.ESC & "[0m");
   end Reset_All;
   
   procedure Reset_Bright is
   begin
      Put (ASCII.ESC & "[21m");
   end Reset_Bright;
   
   procedure Reset_Dim is
   begin
      Put (ASCII.ESC & "[22m");
   end Reset_Dim;
   
   procedure Reset_Underline is
   begin
      Put (ASCII.ESC & "[24m");
   end Reset_Underline;
   
   procedure Reset_Blink is
   begin
      Put (ASCII.ESC & "[25m");
   end Reset_Blink;
   
   procedure Reset_Reverse is
   begin
      Put (ASCII.ESC & "[27m");
   end Reset_Reverse;
   
   procedure Reset_Hidden is
   begin
      Put (ASCII.ESC & "[28m");
   end Reset_Hidden;
   
   -------------------------------------
   --     Przemieszczanie kursora     --
   -------------------------------------
   
   procedure Clear_Screen is
   begin
      Put (ASCII.ESC & "[2J");
   end Clear_Screen;
   
   procedure Move_To (Line, Column : Natural) is
      SLine : String := Natural'Image (Line);
      SColumn : String := Natural'Image (Column);
   begin
      Put (ASCII.ESC & "[" & SLine (SLine'First + 1 .. SLine'Last) & 
	     ";" & SColumn (SColumn'First + 1 .. SColumn'Last) & "H");
   end Move_To;
   
   procedure Move_Up (Lines : Natural) is
      SLines : String := Natural'Image (Lines);
   begin
      Put (ASCII.ESC & "[" & SLines (SLines'First + 1 .. SLines'Last) & "A");
   end Move_Up;
   
   procedure Move_Down (Lines : Natural) is
      SLines : String := Natural'Image (Lines);
   begin
      Put (ASCII.ESC & "[" & SLines (SLines'First + 1 .. SLines'Last) & "B");
   end Move_Down;
   
   procedure Move_Forward (Columns : Natural) is
      SColumns : String := Natural'Image (Columns);
   begin
      Put (ASCII.ESC & "[" & SColumns (SColumns'First + 1 .. SColumns'Last) & "C");
   end Move_Forward;
   
   procedure Move_Backward (Columns : Natural) is
      SColumns : String := Natural'Image (Columns);
   begin
      Put (ASCII.ESC & "[" & SColumns (SColumns'First + 1 .. SColumns'Last) & "D");
   end Move_Backward;
   
   procedure Erase_To_EOL is
   begin
      Put (ASCII.ESC & "[K");
   end Erase_To_EOL;
   
   procedure Save_Position is
   begin
      Put (ASCII.ESC & "[s");
   end Save_Position;
   
   procedure Restore_Position is
   begin
      Put (ASCII.ESC & "[u");
   end Restore_Position;
   
end Terminal;
