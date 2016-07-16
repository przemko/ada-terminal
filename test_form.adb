with Ada.Text_IO; use Ada.Text_IO;
with Terminal; use Terminal;
with Form; use Form;

procedure Test_Form is
  I : Integer;
  N : Natural;
begin
   Clear_Screen;
   Move_To (10, 10);
   Put ("Podaj liczbę całkowitą: ");
   Get_Integer (8, I);
   Move_To (11, 10);
   Put ("Podaj liczbę naturalną: ");
   Get_Natural (8, N);
   Move_To (13, 1);
   Put_Line ("wczytano I = " & Integer'Image (I) &
             ", N = " & Natural'Image (N));
end Test_Form;

