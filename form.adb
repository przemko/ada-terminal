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
   begin
      Value := 0;
   end Get_Integer;
   
end Form;
