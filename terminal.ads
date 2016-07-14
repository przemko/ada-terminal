package Terminal is
   
   type Intensity_Type is (Normal, Dark, Bright, Light);
   
   type Color_Type is (Black, Red, Green, Yellow, Blue, Magenta, Cyan, White);
   
   procedure Clear_Screen;
   procedure Reset_Color;
   procedure Set_Color (Color : Color_Type; Intensity : Intensity_Type);
   procedure Set_Color (Color : Color_Type);
   procedure Set_Background (Color : Color_Type; Intensity : Intensity_Type);
   procedure Set_Background (Color : Color_Type);
   procedure Set_Bright;
   procedure Set_Dim;
   procedure Set_Underline;
   procedure Set_Blink;
   procedure Set_Reverse;
   procedure Set_Hidden;
   procedure Reset_All;
   procedure Reset_Bright;
   procedure Reset_Dim;
   procedure Reset_Underline;
   procedure Reset_Blink;
   procedure Reset_Reverse;
   procedure Reset_Hidden;
   
end Terminal;
