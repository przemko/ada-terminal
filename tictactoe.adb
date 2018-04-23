with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Numerics.Discrete_Random;
with GNAT.OS_Lib;

with Terminal; use Terminal;

procedure TicTacToe is
   
   type Field is (Empty, Human, Computer);
   type Column is range 1 .. 3;
   type Row is range 1 .. 3;
   Board : array (Column, Row) of Field := (others => (others => Empty));
   type Player is new Field range Human .. Computer;
   
   procedure Draw_Board is
   begin
      Set_Color (Cyan);
      for I in 3 .. 7 loop
	 Move_To (I, 30); Put ("     |     |     ");
      end loop;
      Move_To (8, 30); Put ("-----+-----+-----");
      for I in 9 .. 13 loop
	 Move_To (I, 30); Put ("     |     |     ");
      end loop;
      Move_To (14, 30); Put ("-----+-----+-----");
      for I in 15 .. 19 loop
	 Move_To (I, 30); Put ("     |     |");
      end loop;
      Set_Color (Cyan, Bright);
      Move_To (21, 10); Put ("arrows - move pointer");
      Move_To (22, 10); Put (" enter - select");
      Move_To (23, 10); Put ("   'q' - quit"); 
   end Draw_Board;
   
   procedure Draw (Who : Player; C : Column; R : Row) is
      X : Integer := 30 + 6 * (Integer (C) - 1);
      Y : Integer :=  3 + 6 * (Integer (R) - 1); 
   begin
      case Who is
	 when Human =>
	    Set_Color (Green);
	    Move_To (Y  , X); Put (" ### ");
	    Move_To (Y+1, X); Put ("#   #");
	    Move_To (Y+2, X); Put ("#   #");
	    Move_To (Y+3, X); Put ("#   #");
	    Move_To (Y+4, X); Put (" ### ");
	 when Computer =>
	    Set_Color (Red);
	    Move_To (Y  , X); Put ("#   #");
	    Move_To (Y+1, X); Put (" # # ");
	    Move_To (Y+2, X); Put ("  #  ");
	    Move_To (Y+3, X); Put (" # # ");
	    Move_To (Y+4, X); Put ("#   #");
      end case;
   end Draw;
   
   
   procedure Get_Position (C : in out Column; R : in out Row) is
      CH : Character;
   begin
      Show_Cursor;
      loop
	 Move_To (5 + 6 * (Integer (R) - 1), 32 + 6 * (Integer (C) - 1));
	 Get_Immediate (CH);
	 case CH is
	    when ASCII.LF =>
	       if Board (C, R) = Empty then
		  exit;
	       else
		  Bell;
	       end if;
	    when ASCII.ESC =>
	       Get_Immediate (CH);
	       if CH = '[' then
		  Get_Immediate (CH);
		  if CH = 'A' then
		     if R > 1 then
			R := R - 1;
		     end if;
		  elsif CH = 'B' then
		     if R < 3 then
			R := R + 1;
		     end if;
		  elsif CH = 'D' then
		     if C > 1 then
			C := C - 1;
		     end if;
		  elsif CH = 'C' then
		     if C < 3 then
			C := C + 1;
		     end if;
		  end if;
	       end if;
	    when 'q' | 'Q' =>
	       Move_To (24, 1);
	       Show_Cursor;
	       GNAT.OS_Lib.OS_Exit (0);
	    when others =>
	       null;
	 end case;
      end loop;
   end ;
   
   function Line (Who : Player;
		  A, B, C : Field; 
		  I : out Integer) return Boolean is
   begin
      if A = Empty and then B = Field(Who) and then C = Field(Who) then
	 I := 1;
	 return True;
      elsif A = Field(Who) and then B = Empty and then C = Field(Who) then
	 I := 2; 
	 return True;
      elsif A = Field(Who) and then B = Field(Who) and then C = Empty then
	 I := 3;
	 return True;
      else
	 return False;
      end if;
   end Line;
   
   function One_Move (Who : Player; C : out Column; R : out Row) return Boolean 
   is
      I : Integer;
   begin
      if Line(Who, Board(1,1), Board(2,1), Board(3,1), I) then
	 C := Column(I); R := 1;
      elsif Line(Who, Board(1,2), Board(2,2), Board(3,2), I) then
	 C := Column(I); R := 2;
      elsif Line(Who, Board(1,3), Board(2,3), Board(3,3), I) then
	 C := Column(I); R := 3;
      elsif Line(Who, Board(1,1), Board(1,2), Board(1,3), I) then
	 C := 1; R := Row(I);
      elsif Line(Who, Board(2,1), Board(2,2), Board(2,3), I) then
	 C := 2; R := Row(I);
      elsif Line(Who, Board(3,1), Board(3,2), Board(3,3), I) then
	 C := 3; R := Row(I);
      elsif Line(Who, Board(1,1), Board(2,2), Board(3,3), I) then
	 C := Column(I); R := Row(I);
      elsif Line(Who, Board(1,3), Board(2,2), Board(3,1), I) then
	 C := Column(I); R := Row(4 - I);
      else
	 return False;
      end if;
      return True;
   end One_Move;
   
   End_Of_Game : Boolean := False;
   
   procedure Best_Move (C : out Column; R : out Row) is
   begin
      if One_Move(Computer, C, R) then
	 Set_Color (Cyan);
	 Set_Blink;
	 Move_To (22, 60);
	 Put("I WON :)");
	 Reset_Blink;
	 Set_Color (White);
	 End_Of_Game := True;
	 return;
      elsif One_Move(Human, C, R) then
	 return;
      elsif Board(2,2) = Empty then
	 C := 2; R := 2;
	 return;
      elsif Board(1,1) = Empty then
	 C := 1; R := 1;
	 return;
      elsif Board(1,3) = Empty then
	 C := 1; R := 3;
	 return;
      elsif Board(3,1) = Empty then
	 C := 3; R := 1;
	 return;
      elsif Board(3,3) = Empty then
	 C := 3; R := 3;
	 return;
      elsif Board(1,2) = Empty then
	 C := 1; R := 2;
	 return;
      elsif Board(2,1) = Empty then
	 C := 2; R := 1;
	 return;
      elsif Board(2,3) = Empty then
	 C := 2; R := 3;
	 return;
      elsif Board(3,2) = Empty then
	   C := 3; R := 2;
	   return;
      end if;
      Set_Color (Cyan);
      Set_Blink;
      Move_To (22,60);
      Put ("DRAW");
      Reset_Blink;
      Set_Color (White);
      Move_To (24, 1);
      Show_Cursor;
      GNAT.OS_Lib.OS_Exit (0);
   end Best_Move;
   
   Current_Column : Column := 1;
   Current_Row : Row := 1;
   
begin
   Clear_Screen;
   Hide_Cursor;
   Draw_Board;
   
   loop
      Get_Position (Current_Column, Current_Row);
      Draw (Human, Current_Column, Current_Row);
      Board (Current_Column, Current_Row) := Human;
      
      Best_Move (Current_Column, Current_Row);
      Draw (Computer, Current_Column, Current_Row);
      Board (Current_Column, Current_Row) := Computer;
      exit when End_Of_Game;
   end loop;
   
   Move_To (23, 1);
   Show_Cursor;
end TicTacToe;
