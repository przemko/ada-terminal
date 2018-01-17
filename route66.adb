with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

with terminal; use Terminal;

procedure Route66 is

  type Interval is range -2 .. 2;
  package Random_Value is new Ada.Numerics.Discrete_Random (Interval);
  use Random_Value;
  G : Generator;

  X : Integer := 25;
  DX : Integer;
  
begin
  Reset (G);
  Hide_Cursor;
  Set_Background (black, bright);
  loop
    Scroll_Down;
    Move_To (1, X);
    Set_Background (black, normal);
    Put ("                             ");
    Set_Background (black, bright);
    DX := Integer(Random(G));
    X := X + DX;
    if X < 1 or else X > 50 then
      DX := -DX;
      X := X + DX;
    end if;
    delay 0.05;
  end loop;
end Route66;

