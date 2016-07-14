with Ada.Text_IO; use Ada.Text_IO;

with Terminal; use Terminal;

procedure Cursor is 
begin
   Clear_Screen;
   Move_To (10, 10);
   Put ("_ tu jest (10, 10)");
   Move_To (5, 15);
   Put ("_ tu jest (5, 15)");
   Move_To (2, 2);
   Set_Color (White, Bright);
   Put ("Odliczanie: ");
   Set_Color (Green, Bright);
   for I in reverse 0 .. 10 loop
      Save_Position;
      if I < 4 then 
	 Set_Color (Red, Bright);
      elsif I < 8 then
	 Set_Color (Yellow, Bright);
      end if;
      Bell;
      Put (Integer'Image (I) & " ");
      Restore_Position;
      delay 1.0;
   end loop;
   Set_Color (White, Bright);
   Put ("BUM!!!");
   Reset_Color;
end Cursor;
