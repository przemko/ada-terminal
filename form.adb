with Ada.Text_IO; use Ada.Text_IO;
with Terminal; use Terminal;

package body Form is
   
   procedure Get_Integer (Line, Column, Width : Positive;
			  Value : out Integer) is
   begin
      Move_To (Line, Column);
      Get_Integer (Width, Value);
   end Get_Integer;
   
   procedure Get_Integer (Width : Positive;
			  Value : out Integer) is
      Str : String (1 .. Width) := (1 => '0', others => ' ');
      Position : Integer := 1;
      Ch : Character;
   begin
      Show_Cursor;
      Save_Position;
      Put (Str);
      Restore_Position;
      loop
	 Get_Immediate (Ch);
	 case Ch is
	    when ASCII.LF =>
	       exit;
	    when '0' .. '9' | '+' | '-' =>
	       Str (Position) := Ch;
	       Put (Ch);
	       if Position < Width then
		  Position := Position + 1;
	       else
		  Move_Backward;
	       end if;
	    when others =>
	       Move_Backward;
	 end case;
      end loop;
      Value := Integer'Value (Str);
   end Get_Integer;
   
end Form;
