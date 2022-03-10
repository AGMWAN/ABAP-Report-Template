* <HEADER>------------------------------------------------------------------------------------------+
* Date Time / Name Firstname (sy-uname)                    / Ticket: XXXXXX
* +-----------------------------------------------------------------------------------------</HEADER>

CLASS lcx_exception DEFINITION INHERITING FROM cx_static_check.

  PUBLIC SECTION.

    DATA: mv_error_message TYPE string.

    METHODS:
      constructor IMPORTING error_message TYPE string.

ENDCLASS.

CLASS lcl_report DEFINITION.

  PUBLIC SECTION.

    CLASS-METHODS:
      initialization RAISING lcx_exception,
      on_input IMPORTING iv_param TYPE string RAISING lcx_exception,
      at_selection_screen RAISING lcx_exception,
      on_value_request IMPORTING iv_param TYPE string RAISING lcx_exception,
      start_of_selection RAISING lcx_exception.

  PRIVATE SECTION.

    CLASS-DATA:
      mo_sel  TYPE REF TO lcl_sel,
      mo_main TYPE REF TO lcl_main.

ENDCLASS.

CLASS lcl_sel DEFINITION.

  PUBLIC SECTION.

    METHODS:
      f4_path RAISING lcx_exception,
      validate_file_path RAISING lcx_exception.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_main DEFINITION.

  PUBLIC SECTION.

    METHODS: execute RAISING lcx_exception.

  PRIVATE SECTION.

    DATA:
      mo_data TYPE REF TO lcl_data.
*      mo_alv  TYPE REF TO lcl_alv.

ENDCLASS.

CLASS lcl_data DEFINITION.

  PUBLIC SECTION.

    METHODS:
      constructor RAISING lcx_exception.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_alv DEFINITION.

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING io_data TYPE any RAISING lcx_exception,
      display RAISING lcx_exception.

  PRIVATE SECTION.

    DATA:
      mo_alv_table     TYPE REF TO cl_salv_table,
      mo_events        TYPE REF TO cl_salv_events_table,
      mo_event_handler TYPE REF TO lcl_event_handler.

ENDCLASS.

CLASS lcl_event_handler DEFINITION.

  PUBLIC SECTION.

    METHODS:
      constructor IMPORTING io_data TYPE REF TO data RAISING lcx_exception.
*      on_event FOR EVENT event_name OF cl_salv_events_table IMPORTING row column.

  PRIVATE SECTION.

    DATA:
      mo_data TYPE REF TO data.

ENDCLASS.
