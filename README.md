# ada-terminal
## Obsługa tekstowego terminala

### Pakiet Terminal

#### Definiowane typy

- Intensity_Type
- Color_Type

#### Obsługa kolorów i trybów

- **procedure** Reset_All
- **procedure** Reset_Blink
- **procedure** Reset_Bright
- **procedure** Reset_Color
- **procedure** Reset_Dim
- **procedure** Reset_Hidden
- **procedure** Reset_Reverse
- **procedure** Reset_Underline
- **procedure** Set_Background (Color : Color_Type)
- **procedure** Set_Background (Color : Color_Type; Intensity : Intensity_Type)
- **procedure** Set_Blink
- **procedure** Set_Bright
- **procedure** Set_Color (Color : Color_Type)
- **procedure** Set_Color (Color : Color_Type; Intensity : Intensity_Type)
- **procedure** Set_Dim
- **procedure** Set_Hidden
- **procedure** Set_Reverse
- **procedure** Set_Underline

#### Przenoszenie kursora

- **procedure** Move_Backward
- **procedure** Move_Backward (Columns : Positive)
- **procedure** Move_Down
- **procedure** Move_Down (Lines : Positive)
- **procedure** Move_Forward
- **procedure** Move_Forward (Columns : Positive)
- **procedure** Move_To (Line, Column : Positive)
- **procedure** Move_Up
- **procedure** Move_Up (Lines : Positive)
- **procedure** Restore_Position
- **procedure** Save_Position

#### Czyszczenie ekranu

- **procedure** Clear_Screen
- **procedure** Clear_To_BOL
- **procedure** Clear_To_BOS
- **procedure** Clear_To_EOL
- **procedure** Clear_To_EOS
- **procedure** Clear_Line

#### Scrollowanie

- **procedure** Scroll_Down 
- **procedure** Scroll_Down (Lines : Positive)
- **procedure** Scroll_Up
- **procedure** Scroll_Up (Lines : Positive)

#### Inne

- **procedure** Bell
- **procedure** Hide_Cursor
- **procedure** Show_Cursor

### Pakiet Form

#### Definiowane typy

- Options_Type
- Selection_Type

#### Wprowadzanie liczb

- **procedure** Get_Integer (Width : Positive; Value : **out** Integer)
- **procedure** Get_Integer (Line, Column, Width : Positive; Value : **out** Integer)
- **procedure** Get_Natural (Width : Positive; Value : **out** Natural)
- **procedure** Get_Natural (Line, Column, Width : Positive; Value : **out** Natural)
 
#### Wprowadzanie łańcucha znaków

- **procedure** Get_Unbounded_String (Width : Positive; Value : **out** Unbounded_String)
- **procedure** Get_Unbounded_String (Line, Column, Width : Positive; Value : **out** Unbounded_String)

#### Wybieranie jednej opcji

- **procedure** Get_Radio_Button (Width : Positive; Options : Options_Type; Selection : **in out** Integer)
- **procedure** Get_Radio_Button (Line, Column, Width : Positive; Options : Options_Type; Selection : **in out** Integer) 

#### Wybieranie podzbioru opcji

- **procedure** Get_Selection (Width : Positive; Options : Options_Type; Selection : **in out** Selection_Type)
- **procedure** Get_Selection (Line, Column, Width : Positive; Options : Options_Type; Selection : **in out** Selection_Type) 
