package Form is

   procedure Get_Integer (Line, Column, Width : Positive;
                          Value : out Integer);
   procedure Get_Integer (Width : Positive;
                          Value : out Integer);

   procedure Get_Natural (Line, Column, Width : Positive;
                          Value : out Natural);
   procedure Get_Natural (Width : Positive;
                          Value : out Natural);

end Form;
