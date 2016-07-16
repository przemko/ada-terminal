with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Terminal; use Terminal;
with Form; use Form;

procedure Test_Form is
   STR : Unbounded_String;
   I : Integer;
   N : Natural;
   OPT : Options_Type (1..3) := (To_Unbounded_String ("Sex"),
                                 To_Unbounded_String ("Drugs"),
                                 To_Unbounded_String ("Rock n' roll"));
   S : Integer;
   SEL : Selection_Type (1..3);
begin
   Clear_Screen;
   Move_To (6, 10);
   Put ("  Podaj łańcuch znaków: ");
   Get_Unbounded_String (20, STR);
   Move_To (8, 1);
   Put ("wczytano STR = " & "'" & To_String (STR) & "'");
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
   Get_Radio_Button (16, OPT, S);
   Move_To (19, 1);
   Put ("wybrano S = " & Integer'Image (S));

   Move_To (15, 45);
   SEL := (False, True, False);
   Get_Selection (16, OPT, SEL);
   Move_To (19, 40);
   Put ("wybrano SEL = ");
   for I in SEL'Range loop
      if SEL (I) then
         Put (To_String (OPT (I)) & " ");
      end if;
   end loop;
   Move_To (21, 1);
end Test_Form;

