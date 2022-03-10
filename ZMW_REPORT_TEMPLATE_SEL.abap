* <HEADER>------------------------------------------------------------------------------------------+
* Date Time / Name Firstname (sy-uname)                    / Ticket: XXXXXX
* +-----------------------------------------------------------------------------------------</HEADER>

DATA: value TYPE c.

SELECTION-SCREEN: BEGIN OF BLOCK file WITH FRAME TITLE text-001.

PARAMETERS: p_path TYPE filename-fileextern,    "External File
            p_file TYPE filename-fileintern.    "Internal File

SELECTION-SCREEN: END OF BLOCK file.

SELECTION-SCREEN: BEGIN OF BLOCK main WITH FRAME TITLE text-002.

PARAMETERS: p_param  TYPE value,   "Basic Parameter
            p_param2 TYPE value.

SELECT-OPTIONS: p_sel FOR (value),  "Basic Select-Option
                p_sel2 FOR (value).

SELECTION-SCREEN: END OF BLOCK main.

SELECTION-SCREEN: BEGIN OF BLOCK parameters WITH FRAME TITLE text-003.

PARAMETERS: c_check1 AS CHECKBOX,
            c_check2 AS CHECKBOX.

PARAMETERS: r_radio  RADIOBUTTON GROUP rg1,
            r_radio2 RADIOBUTTON GROUP rg1.

SELECTION-SCREEN: END OF BLOCK parameters.