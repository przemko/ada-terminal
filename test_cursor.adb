with Ada.Text_IO; use Ada.Text_IO;

with Terminal; use Terminal;

procedure Test_Cursor is 
begin
   Clear_Screen;
   Move_To (10, 10);
   Put ("_ tu jest (10, 10)");
   Move_To (1, 1);
   Put ("_ tu jest (1, 1)");
   Move_To (2, 2);
   delay 3.0;
   Clear_To_EOS;
   Set_Color (White, Bright);
   Hide_Cursor;
   Put ("Odliczanie: ");
   Set_Color (Green, Bright);
   for I in reverse 0 .. 10 loop
      Save_Position;
      if I < 4 then 
	 Set_Color (Red, Bright);
      elsif I < 8 then
	 Set_Color (Yellow, Bright);
      end if;
      Put (Integer'Image (I) & " ");
      Restore_Position;
      delay 1.0;
   end loop;
   Set_Color (White, Bright);
   Put ("BUM!!!");
   Show_Cursor;
   Reset_Color;
end Test_Cursor;
