with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

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
               if Position > 2 or Str (1) not in ' ' | '+' | '-' then
                  exit;
               end if;
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
               if Position > 1 then
                  exit;
               end if;
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

   procedure Get_Radio_Button (Line, Column, Width : Positive;
                               Options : Options_Type;
                               Selection : in out Integer)
   is
   begin
      Move_To (Line, Column);
      Get_Radio_Button(Width, Options, Selection);
   end Get_Radio_Button;

   procedure Get_Radio_Button (Width : Positive;
                               Options : Options_Type;
                               Selection : in out Integer)
   is
      Position : Integer := Selection;
      Ch : Character;
      Lines : Positive;
   begin
      Hide_Cursor;
      for I in Options'Range loop
         if I = Selection then
            Put ("(O) ");
         else
            Put ("( ) ");
         end if;
         if Length (Options (I)) > Width - 4 then
            Put (To_String (Options (I)) (1 .. Width - 4));
         else
            Put (To_String (Options (I)));
            for J in 1 .. Width - 4 - Length (Options (I)) loop
               Put ("_");
            end loop;
         end if;
         Move_Backward (Width);
         Move_Down;
      end loop;
      Move_Forward;
      Move_Up (1 + Options'Last - Selection);
      Show_Cursor;
      loop
         Get_Immediate (Ch);
         case Ch is
            when ASCII.LF =>
               exit;
            when ' ' =>
               if Position /= Selection then
                  if Position < Selection then
                     Lines := Selection - Position;
                     Move_Down (Lines);
                     Put (" ");
                     Move_Backward;
                     Move_Up (Lines);
                  else
                     Lines := Position - Selection;
                     Move_Up (Lines);
                     Put (" ");
                     Move_Backward;
                     Move_Down (Lines);
                  end if;
                  Put ("O");
                  Move_Backward;
                  Selection := Position;
               end if;
            when ASCII.ESC =>
               Get_Immediate (Ch);
               if Ch = '[' then
                  Get_Immediate (Ch);
                  if Ch = 'A' and Position > Options'First then
                     Move_Up;
                     Position := Position - 1;
                  elsif Ch = 'B' and Position < Options'Last then
                     Move_Down;
                     Position := Position + 1;
                  end if;
               else
                  null;
               end if;
            when others =>
               null;
         end case;
      end loop;
   end Get_Radio_Button;

end Form;
