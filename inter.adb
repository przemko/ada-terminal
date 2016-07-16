with Ada.Text_IO; use Ada.Text_IO;
with Terminal; use Terminal;
with Form; use Form;

procedure Inter is

  I : Integer;

begin
   Clear_Screen;
   Move_To (10, 10);
   Put ("Podaj liczbę całkowitą: ");
   Get_Integer (8, I);
   New_Line;
   Put_Line ("wczytano: " & Integer'Image (I));
end Inter;

