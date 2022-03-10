* <HEADER>------------------------------------------------------------------------------------------+
* 10.03.2022 12:57:47 / Name Firstname (sy-uname)                    / Ticket: XXXXXX
* +-----------------------------------------------------------------------------------------</HEADER>

INCLUDE zmw_report_template_top.  " Global Data
INCLUDE zmw_report_template_sel.  " Selection Screen
INCLUDE zmw_report_template_cd1.  " Class Definition
INCLUDE zmw_report_template_ci1.  " Class Implementation

INITIALIZATION.
  lcl_report=>initialization( ).

AT SELECTION-SCREEN.
  lcl_report=>at_selection_screen( ).

AT SELECTION-SCREEN ON p_path.
  lcl_report=>on_input( 'P_PATH' ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.
  lcl_report=>on_value_request( 'P_PATH' ).

START-OF-SELECTION.
  lcl_report=>start_of_selection( ).
