* <HEADER>------------------------------------------------------------------------------------------+
* Date Time / Name Firstname (sy-uname)                    / Ticket: XXXXXX
* +-----------------------------------------------------------------------------------------</HEADER>

CLASS lcx_exception IMPLEMENTATION.

  METHOD constructor.

    super->constructor( ).
    mv_error_message = error_message.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_report IMPLEMENTATION.

  METHOD initialization.

    mo_sel = NEW #( ).
    mo_main = NEW #( ).

  ENDMETHOD.

  METHOD at_selection_screen.

  ENDMETHOD.

  METHOD on_input.

    CASE iv_param.

      WHEN 'P_PATH'.
        mo_sel->validate_file_path( ).

    ENDCASE.

  ENDMETHOD..

  METHOD on_value_request.

    CASE iv_param.

      WHEN 'P_PATH'.
        mo_sel->f4_path( ).

    ENDCASE.

  ENDMETHOD.

  METHOD start_of_selection.

    TRY.
        mo_main->execute( ).
      CATCH lcx_exception INTO DATA(lo_exception).
        MESSAGE lo_exception->mv_error_message TYPE 'E'.
        LEAVE LIST-PROCESSING.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_sel IMPLEMENTATION.

  METHOD f4_path.

    DATA: lt_files  TYPE filetable,
          lv_rc     TYPE i,
          lv_action TYPE i.

    cl_gui_frontend_services=>file_open_dialog(
      EXPORTING
*        default_extension = 'EXT'
*        file_filter = '(*.EXT)|*.EXT|'
        initial_directory = CONV #( p_path )
        multiselection = abap_false
    CHANGING
      file_table = lt_files
      rc = lv_rc
      user_action = lv_action
    EXCEPTIONS
      file_open_dialog_failed = 1
      OTHERS = 2
      ).

    IF sy-subrc IS NOT INITIAL.
      RAISE EXCEPTION TYPE lcx_exception EXPORTING error_message = 'Couldn''t select file'.
    ELSEIF lv_action = cl_gui_frontend_services=>action_ok AND lines( lt_files ) > 0.
      p_path = lt_files[ 1 ]-filename.
    ENDIF.

  ENDMETHOD.

  METHOD validate_file_path.

    IF p_path IS NOT INITIAL AND NOT cl_gui_frontend_services=>file_exist( CONV #( p_path ) ).
      MESSAGE 'File does not exists' TYPE 'E' DISPLAY LIKE 'W'.
      LEAVE LIST-PROCESSING.
    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD execute.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_data IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_alv IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

  METHOD display.

  ENDMETHOD.

ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.

  METHOD constructor.

  ENDMETHOD.

ENDCLASS.
