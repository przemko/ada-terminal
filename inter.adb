with Ada.Text_IO; use Ada.Text_IO;
with Terminal; use Terminal;
with Form; use Form;

procedure Inter is

  I : Natural;

begin
   Clear_Screen;
   Move_To (10, 10);
   Put ("Podaj liczbę naturalną: ");
   Get_Natural (8, I);
   New_Line;
   Put_Line ("wczytano: " & Natural'Image (I));
end Inter;

