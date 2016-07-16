with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Terminal; use Terminal;
with Form; use Form;

procedure Test_Form is
  I : Integer;
  N : Natural;
  S : Integer;
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

   Move_To (15, 5);
   S := 3;
   Get_Radio_Button (16, (1 => To_Unbounded_String ("Sex"),
                          2 => To_Unbounded_String ("Drugs"),
                          3 => To_Unbounded_String ("Rock & roll")),
                     S);
   Move_To (19, 1);
   Put ("wybrano S = " & Integer'Image (S));

end Test_Form;

