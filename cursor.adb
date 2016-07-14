with Ada.Text_IO; use Ada.Text_IO;

with Terminal; use Terminal;

procedure Cursor is 
begin
   Clear_Screen;
   Move_To (10, 10);
   Put ("_ tu jest (10, 10)");
   Move_To (5, 15);
   Put ("_ tu jest (5, 15)");
end Cursor;
