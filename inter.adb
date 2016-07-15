with Ada.Text_IO; use Ada.Text_IO;
with Terminal; use Terminal;
with Form; use Form;

procedure Inter is

  I : Integer;

begin
  Clear_Screen;
  Get_Integer (10, 10, 8, I);
  New_Line;
  Put_Line ("wczytano: " & Integer'Image (I));
end Inter;

