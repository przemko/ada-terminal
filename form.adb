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
      Str : String (1 .. Width) := (others => ' ');
      Position : Integer := 1;
      Ch : Character;
   begin
      Show_Cursor;
      for I in 1 .. Width  loop
         Put ('_');
      end loop;
      Move_Backward (Width);
      loop
         Get_Immediate (Ch);
         case Ch is
            when ASCII.LF =>
               -- koniec wczytywania liczby
               exit;
            when '0' .. '9' | '+' | '-' =>
               -- kolejna cyfra lub znak (+/-)
               if Position < Width and
                 (Ch in '0' .. '9' or  Position = 1) then
                  Str (Position) := Ch;
                  Put (Ch);
                  Position := Position + 1;
               end if;
            when ASCII.DEL =>
               -- kasowanie ostatniej cyfry lub znaku (+/-)
               if Position > 1 then
                  Move_Backward;
                  Put ("_");
                  Move_Backward;
                  Str (Position - 1 .. Width) := Str (Position .. Width) & " ";
                  Position := Position - 1;
               end if;
            when others =>
               null;
         end case;
      end loop;
      Value := Integer'Value (Str);
   end Get_Integer;

   procedure Get_Natural (Line, Column, Width : Positive;
                          Value : out Natural) is
   begin
      Move_To (Line, Column);
      Get_Natural (Width, Value);
   end Get_Natural;

   procedure Get_Natural (Width : Positive;
                          Value : out Natural) is
      Str : String (1 .. Width) := (others => ' ');
      Position : Integer := 1;
      Ch : Character;
   begin
      Show_Cursor;
      for I in 1 .. Width  loop
         Put ('_');
      end loop;
      Move_Backward (Width);
      loop
         Get_Immediate (Ch);
         case Ch is
            when ASCII.LF =>
               -- koniec wpisywania liczby
               exit;
            when '0' .. '9' =>
               -- kolejna cyfra
               if Position < Width then
                  Str (Position) := Ch;
                  Put (Ch);
                  Position := Position + 1;
               end if;
            when ASCII.DEL =>
               -- kasowanie ostatniej cyfry
               if Position > 1 then
                  Move_Backward;
                  Put ("_");
                  Move_Backward;
                  Str (Position - 1 .. Width) := Str (Position .. Width) & " ";
                  Position := Position - 1;
               end if;
            when others =>
               null;
         end case;
      end loop;
      Value := Natural'Value (Str);
   end Get_Natural;

end Form;
