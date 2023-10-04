CLASS zabhirap_helloword_1234 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zabhirap_helloword_1234 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write(
      EXPORTING
        data   = |Hellow Word !  ({ cl_abap_context_info=>get_user_alias( ) })|
*        name   =
*      RECEIVING
*        output =
    ).
  ENDMETHOD.

ENDCLASS.
