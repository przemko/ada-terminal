package Terminal is
   
   type Intensity_Type is (Normal, Bright);
   
   type Color_Type is (Black, Red, Green, Yellow, Blue, Magenta, Cyan, White);
   
   procedure Bell;
   
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
   
   procedure Clear_Screen;
   procedure Clear_To_EOS;
   procedure Clear_To_BOS;
   procedure Clear_Line;
   procedure Clear_To_EOL;
   procedure Clear_To_BOL;
   procedure Move_To (Line, Column : Positive);
   procedure Move_Up (Lines : Positive);
   procedure Move_Up;
   procedure Move_Down (Lines : Positive);
   procedure Move_Down;
   procedure Move_Forward (Columns : Positive);
   procedure Move_Forward;
   procedure Move_Backward (Columns : Positive);
   procedure Move_Backward;
   procedure Save_Position;
   procedure Restore_Position;
   procedure Scroll_Up (Lines : Positive);
   procedure Scroll_Up;
   procedure Scroll_Down (Lines : Positive);
   procedure Scroll_Down;
   
   procedure Hide_Cursor;
   procedure Show_Cursor;
   
end Terminal;
