with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Form is

   type Options_Type is array (Integer range <>) of Unbounded_String;

   type Selection_Type is array (Integer range <>) of Boolean;

   procedure Get_Integer (Line, Column, Width : Positive;
                          Value : out Integer);
   procedure Get_Integer (Width : Positive;
                          Value : out Integer);

   procedure Get_Natural (Line, Column, Width : Positive;
                          Value : out Natural);
   procedure Get_Natural (Width : Positive;
                          Value : out Natural);

   procedure Get_Radio_Button (Line, Column, Width : Positive;
                               Options : Options_Type;
                               Selection : in out Integer)
     with
     Pre => Selection in Options'Range;

   procedure Get_Radio_Button (Width : Positive;
                               Options : Options_Type;
                               Selection : in out Integer)
     with
     Pre => Selection in Options'Range;

   procedure Get_Selection (Line, Column, Width : Positive;
                            Options : Options_Type;
                            Selection : in out Selection_Type)
     with
     Pre => Selection'First = Options'First
     and Selection'Last = Options'Last;

   procedure Get_Selection (Width : Positive;
                            Options : Options_Type;
                            Selection : in out Selection_Type)
     with
     Pre => Selection'First = Options'First
     and Selection'Last = Options'Last;

end Form;
