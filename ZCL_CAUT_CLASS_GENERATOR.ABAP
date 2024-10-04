class ZCL_CAUT_CLASS_GENERATOR definition
  public
  create protected .

public section.

  types:
    BEGIN OF gty_s_texts,
        spras    TYPE spras,
        textpool TYPE textpool_t,
      END OF gty_s_texts .
  types:
    gty_t_texts TYPE STANDARD TABLE OF gty_s_texts .
  types:
    BEGIN OF gty_s_method_params,
        param_name       TYPE seosconame,
        param_type       TYPE seopardecl,
        ref_type         TYPE seotyptype,
        data_type        TYPE rs38l_typ,
        pass_type        TYPE seoparpass,
        order            TYPE seoorder, 
      END OF gty_s_method_params .
  types:
    gty_t_method_params TYPE STANDARD TABLE OF gty_s_method_params .
  types:
    BEGIN OF gty_s_method_exception,  
        name TYPE seosconame,
      END OF gty_s_method_exception .
  types:
    gty_t_method_exceptions TYPE STANDARD TABLE OF gty_s_method_exception .    

  constants GC_CHANGING type SEOSUBCODF-PARDECLTYP value SEOS_PARDECLTYP_CHANGING ##NO_TEXT.
  constants GC_EXPORTING type SEOSUBCODF-PARDECLTYP value SEOS_PARDECLTYP_EXPORTING ##NO_TEXT.
  constants GC_EXPOSURE_PRIVATE type SEOEXPOSE value SEOC_EXPOSURE_PRIVATE ##NO_TEXT.
  constants GC_EXPOSURE_PROTECTED type SEOEXPOSE value SEOC_EXPOSURE_PROTECTED ##NO_TEXT.
  constants GC_EXPOSURE_PUBLIC type SEOEXPOSE value SEOC_EXPOSURE_PUBLIC ##NO_TEXT.
  constants GC_IMPORTING type SEOSUBCODF-PARDECLTYP value SEOS_PARDECLTYP_IMPORTING ##NO_TEXT.
  constants GC_PROP_TYP_CONSTANTS type SEOCOMPODF-ATTDECLTYP value SEOO_ATTDECLTYP_CONSTANTS ##NO_TEXT.
  constants GC_PROP_TYP_DATA type SEOCOMPODF-ATTDECLTYP value SEOO_ATTDECLTYP_DATA ##NO_TEXT.
  constants GC_PROP_TYP_STATICS type SEOCOMPODF-ATTDECLTYP value SEOO_ATTDECLTYP_STATICS ##NO_TEXT.
  constants GC_RETURNING type SEOSUBCODF-PARDECLTYP value SEOS_PARDECLTYP_RETURNING ##NO_TEXT.
  constants GC_TYPE_BOXED type SEOTYPE-TYPTYPE value SEOO_TYPTYPE_BOXED ##NO_TEXT.
  constants GC_TYPE_LIKE type SEOTYPE-TYPTYPE value SEOO_TYPTYPE_LIKE ##NO_TEXT.
  constants GC_TYPE_OBJECT type SEOTYPE-TYPTYPE value SEOO_TYPTYPE_OBJECT ##NO_TEXT.
  constants GC_TYPE_OTHERS type SEOTYPE-TYPTYPE value SEOO_TYPTYPE_OTHERS ##NO_TEXT.
  constants GC_TYPE_REF_TO type SEOTYPE-TYPTYPE value SEOO_TYPTYPE_REF_TO ##NO_TEXT.
  constants GC_TYPE_TYPE type SEOTYPE-TYPTYPE value SEOO_TYPTYPE_TYPE ##NO_TEXT.
  constants GC_PASS_TYPE_REFERENCE type SEOPARPASS value SPRX_CONST_BY_REFERENCE ##NO_TEXT. 
  constants GC_PASS_TYPE_VALUE type SEOPARPASS value SPRX_CONST_BY_VALUE ##NO_TEXT. 

  class-methods CHECK_CLASS_EXISTS_ACTIVE
    importing
      !IV_CLSNAME type CLIKE
    returning
      value(RV_EXISTS) type BOOLEAN .
  class-methods GET_NEW
    importing
      !IV_NAME type CLIKE
      !IV_SUPERCLASS type CLIKE optional
      !IV_DESCR type CLIKE optional
    returning
      value(RO_INSTANCE) type ref to ZCL_CAUT_CLASS_GENERATOR .
  class-methods INSTANTIATE_FROM_EXISTING
    importing
      !IV_CLSNAME type CLIKE
    returning
      value(RO_INSTANCE) type ref to ZCL_CAUT_CLASS_GENERATOR
    exceptions
      CLASS_DOES_NOT_EXIST
      ERROR_READING_CLASS .
  class-methods MERGE_CLASSES_TO_NEW
    importing
      !IO_CLASS_ADD type ref to ZCL_CAUT_CLASS_GENERATOR
      !IO_CLASS_INTO type ref to ZCL_CAUT_CLASS_GENERATOR
    returning
      value(RO_MERGED) type ref to ZCL_CAUT_CLASS_GENERATOR .
  methods ADD_ATTRIBUTE
    importing
      !IV_NAME type CLIKE
      !IV_DATA_TYPE type RS38L_TYP
      !IV_TYPE type SEOATTDECL
      !IV_VALUE type CLIKE optional
      !IV_EXPOSURE type SEOEXPOSE
      !IV_DESCR type CLIKE
      !IV_TYPE_REF type SEOTYPTYPE .
  methods ADD_CONSTANT
    importing
      !IV_NAME type CLIKE
      !IV_DATA_TYPE type RS38L_TYP
      !IV_VALUE type CLIKE
      !IV_EXPOSURE type SEOEXPOSE
      !IV_DESCR type CLIKE .
  methods ADD_METHOD
    importing
      !IV_NAME type CLIKE
      !IV_STATIC type BOOLEAN
      !IV_EXPOSURE type CLIKE
      !IV_REDEFINE type BOOLEAN
      !IV_DESC type CLIKE
      !IV_CLASS_EXCEPTIONS type SEONEWEXC default ABAP_FALSE
      !IV_SOURCE type RSWSOURCET
      !IV_PARAMS type GTY_T_METHOD_PARAMS
      !IT_EXCEPTIONS type GTY_T_METHOD_EXCEPTIONS optional .
  methods ADD_TYPE
    importing
      !IV_NAME type CLIKE
      !IV_SRC type CLIKE
      !IV_EXPOSURE type SEOEXPOSE
      !IV_TYPE_REF type SEOTYPTYPE default GC_TYPE_OTHERS .
  methods CLASS_DELETE
    exceptions
      CLASS_DOES_NOT_EXIST
      ERROR_DURING_DELETION .
  methods CLONE_RENAMED
    importing
      !IV_NEW_NAME type CLIKE
    returning
      value(RO_CLONE) type ref to ZCL_CAUT_CLASS_GENERATOR .
  methods GENERATE_CLASS
    importing
      !IV_PCK type DEVCLASS
      !IV_OVERWRITE type BOOLEAN default ABAP_FALSE
    exceptions
      CLASS_EXISTS
      GENERATION_ERROR .
  methods GET_CLASS_NAME
    returning
      value(RV_NAME) type STRING .
  methods GET_TEXTPOOL_NAME
    returning
      value(RV_NAME) type PROGRAMM .
protected section.

  data GS_CLASS type VSEOCLASS .
  data GS_INCLUDES type SEOP_METHODS_W_INCLUDE .
  data GS_INHERITANCE type VSEOEXTEND .
  data GT_ALIASES type SEOO_ALIASES_R .
  data GT_ATTRIBUTES type SEOO_ATTRIBUTES_R .
  data GT_CLSDEFERRDS type SEOT_CLSDEFERRDS_R .
  data GT_EVENTS type SEOO_EVENTS_R .
  data GT_EXCEPS type SEOS_EXCEPTIONS_R .
  data GT_FRIENDSHIPS type SEOF_FRIENDSHIPS_R .
  data GT_IMPLEMENTINGS type SEOR_IMPLEMENTINGS_R .
  data GT_IMPL_DETAILS type SEOR_REDEFINITIONS_R .
  data GT_INTDEFERRDS type SEOT_INTDEFERRDS_R .
  data GT_INTERFACES type SEOK_INT_TYPEINFOS .
  data GT_LOCALS_DEF type RSWSOURCET .
  data GT_LOCALS_IMP type RSWSOURCET .
  data GT_LOCALS_MAC type RSWSOURCET .
  data GT_METHODS type SEOO_METHODS_R .
  data GT_METHOD_SOURCES type SEO_METHOD_SOURCE_TABLE .
  data GT_PARAMETERS type SEOS_PARAMETERS_R .
  data GT_REDEFINITIONS type SEOR_REDEFINITIONS_R .
  data GT_TEXTS type GTY_T_TEXTS .
  data GT_TYPEPUSAGES type SEOT_TYPEPUSAGES_R .
  data GT_TYPES type SEOO_TYPES_R .
  data GT_TYPE_SOURCES type SEOO_TYPESRC .

  methods ADD_TYPE_SOURCE
    importing
      !IV_NAME type CLIKE
      !IV_SOURCE type CLIKE .
  methods RETRIEVE_LOCALS .
  methods RETRIEVE_MACROS .
  methods RETRIEVE_METHOD_SOURCES .
  methods RETRIEVE_TEXT_POOL .
  methods RETRIEVE_TYPE_SOURCES .
private section.
ENDCLASS.



CLASS ZCL_CAUT_CLASS_GENERATOR IMPLEMENTATION.


  METHOD add_attribute.

    APPEND INITIAL LINE TO gt_attributes ASSIGNING FIELD-SYMBOL(<ls_attr>).
    <ls_attr>-clsname     = gs_class-clsname.
    <ls_attr>-cmpname     = iv_name.
    <ls_attr>-descript    = iv_descr.
    <ls_attr>-state       = seoc_state_implemented.
    <ls_attr>-exposure    = iv_exposure.
    <ls_attr>-attdecltyp  = iv_type.
    <ls_attr>-typtype     = iv_type_ref.
    <ls_attr>-type        = iv_data_type.
    <ls_attr>-attvalue    = iv_value.

  ENDMETHOD.


  METHOD add_constant.

    me->add_attribute(
      EXPORTING
        iv_name      =  iv_name
        iv_data_type =  iv_data_type
        iv_value     =  iv_value
        iv_type      =  gc_prop_typ_constants
        iv_exposure  =  iv_exposure
        iv_descr     =  iv_descr
        iv_type_ref  =  gc_type_type
    ).
  ENDMETHOD.


  METHOD add_method.
    "Insert method declaration
    APPEND INITIAL LINE TO gt_methods ASSIGNING FIELD-SYMBOL(<ls_method>).
    <ls_method>-clsname    = gs_class-clsname.
    <ls_method>-cmpname    = iv_name.
    <ls_method>-langu      = sy-langu.
    <ls_method>-descript   = iv_desc .
    <ls_method>-state      = seoc_state_implemented.
    <ls_method>-exposure   = iv_exposure.
    <ls_method>-redefin    = iv_redefine.
    <ls_method>-mtddecltyp = SWITCH seomtddecl( iv_static WHEN abap_true THEN seoo_mtddecltyp_class_method
                                                                         ELSE seoo_mtddecltyp_method ).
    <ls_method>-mtdnewexc = iv_class_exceptions. 

    "Add method parameters
    LOOP AT iv_params ASSIGNING FIELD-SYMBOL(<ls_inparam>).
      APPEND INITIAL LINE TO gt_parameters ASSIGNING FIELD-SYMBOL(<ls_param>).
      <ls_param>-clsname    = gs_class-clsname.
      <ls_param>-cmpname    = iv_name.
      <ls_param>-sconame    = <ls_inparam>-param_name.
      <ls_param>-cmptype    = seoo_cmptype_method.
      <ls_param>-pardecltyp = <ls_inparam>-param_type.
      <ls_param>-typtype    = <ls_inparam>-ref_type.
      <ls_param>-type       = <ls_inparam>-data_type.
      <ls_param>-parpasstyp = <ls_inparam>-pass_type. 
      <ls_param>-editorder  = <ls_inparam>-order. 
    ENDLOOP.

    
    " Added possibility to create method with exceptions
    LOOP AT it_exceptions REFERENCE INTO DATA(ld_in_exception).
      APPEND INITIAL LINE TO gt_exceps REFERENCE INTO DATA(ld_exception).
      ld_exception->clsname = gs_class-clsname.
      ld_exception->cmpname = iv_name.
      ld_exception->sconame = ld_in_exception->name.
    ENDLOOP.

    "And sourcecode
    APPEND INITIAL LINE TO gt_method_sources ASSIGNING FIELD-SYMBOL(<ls_method_src>).
    <ls_method_src>-cpdname =	iv_name.
    <ls_method_src>-source = iv_source.
  ENDMETHOD.


  METHOD add_type.
    READ TABLE gt_types WITH KEY cmpname = iv_name TRANSPORTING NO FIELDS.
    CHECK sy-subrc <> 0.
    APPEND INITIAL LINE TO gt_types ASSIGNING FIELD-SYMBOL(<ls_type>).
    <ls_type>-clsname      = gs_class-clsname.
    <ls_type>-cmpname      = iv_name.
    <ls_type>-editorder    = sy-tabix.
    <ls_type>-state        = 1.
    <ls_type>-typtype      = iv_type_ref.
    <ls_type>-exposure     = iv_exposure.
    <ls_type>-typesrc_leng = strlen( iv_src ).
    <ls_type>-typesrc      = iv_src .
    <ls_type>-author       = sy-uname.
    <ls_type>-createdon    = sy-datum.
    me->add_type_source(
      EXPORTING
        iv_name   = iv_name
        iv_source = iv_src
    ).
  ENDMETHOD.


  METHOD add_type_source.
    READ TABLE gt_type_sources WITH KEY cmpname = iv_name
                               ASSIGNING FIELD-SYMBOL(<ls_sources>).
    IF sy-subrc <> 0.
      APPEND INITIAL LINE TO gt_type_sources ASSIGNING <ls_sources>.
    ENDIF.
    <ls_sources>-cmpname = iv_name.
    APPEND iv_source TO <ls_sources>-source.
  ENDMETHOD.


  METHOD check_class_exists_active.

    rv_exists = abap_false.
    DATA(ls_clskey) = VALUE seoclskey( clsname = iv_clsname ).
* Check if active version of class exists
    CALL FUNCTION 'SEO_CLASS_GET'
      EXPORTING
        clskey       = ls_clskey
        version      = '1'
        state        = '1'
      EXCEPTIONS
        not_existing = 1
        deleted      = 2
        is_interface = 3
        model_only   = 4
        OTHERS       = 5.

    IF sy-subrc = 0.
      rv_exists = abap_true.
    ENDIF.


  ENDMETHOD.


  METHOD class_delete.
    DATA(ls_delkey) = VALUE seoclskey( clsname = me->get_class_name( ) ).
    CALL FUNCTION 'SEO_CLASS_DELETE_COMPLETE'
      EXPORTING
        clskey       = ls_delkey
      EXCEPTIONS
        not_existing = 1
        is_interface = 2
        db_error     = 3
        no_access    = 4
        other        = 5
        OTHERS       = 6.

    CHECK sy-subrc > 0.
    IF sy-subrc = 1.
      RAISE class_does_not_exist.
    ELSE.
      RAISE error_during_deletion.
    ENDIF.
  ENDMETHOD.


  METHOD clone_renamed.
    ro_clone = NEW zcl_caut_class_generator( ).
    ro_clone->gs_class          = me->gs_class         .
    ro_clone->gt_attributes     = me->gt_attributes    .
    ro_clone->gt_methods        = me->gt_methods       .
    ro_clone->gt_events         = me->gt_events        .
    ro_clone->gt_types          = me->gt_types         .
    ro_clone->gt_parameters     = me->gt_parameters    .
    ro_clone->gt_exceps         = me->gt_exceps        .
    ro_clone->gt_implementings  = me->gt_implementings .
    ro_clone->gs_inheritance    = me->gs_inheritance   .
    ro_clone->gt_redefinitions  = me->gt_redefinitions .
    ro_clone->gt_impl_details   = me->gt_impl_details  .
    ro_clone->gt_friendships    = me->gt_friendships   .
    ro_clone->gt_typepusages    = me->gt_typepusages   .
    ro_clone->gt_clsdeferrds    = me->gt_clsdeferrds   .
    ro_clone->gt_intdeferrds    = me->gt_intdeferrds   .
    ro_clone->gt_aliases        = me->gt_aliases       .
    ro_clone->gt_method_sources = me->gt_method_sources.
    ro_clone->gt_texts          = me->gt_texts         .
    ro_clone->gt_locals_def     = me->gt_locals_def    .
    ro_clone->gt_locals_imp     = me->gt_locals_imp    .
    ro_clone->gt_locals_mac     = me->gt_locals_mac    .
    ro_clone->gt_type_sources   = me->gt_type_sources  .

    "Add new name everywhere
    ro_clone->gs_class-clsname = iv_new_name.
    ro_clone->gs_inheritance-clsname = iv_new_name.
    DATA: ls_attributes     LIKE LINE OF ro_clone->gt_attributes,
          ls_methods        LIKE LINE OF ro_clone->gt_methods,
          ls_events         LIKE LINE OF ro_clone->gt_events,
          ls_types          LIKE LINE OF ro_clone->gt_types,
          ls_parameters     LIKE LINE OF ro_clone->gt_parameters,
          ls_exceps         LIKE LINE OF ro_clone->gt_exceps,
          ls_implementings  LIKE LINE OF ro_clone->gt_implementings,
          ls_redefinitions  LIKE LINE OF ro_clone->gt_redefinitions,
          ls_impl_details   LIKE LINE OF ro_clone->gt_impl_details,
          ls_friendships    LIKE LINE OF ro_clone->gt_friendships,
          ls_typepusages    LIKE LINE OF ro_clone->gt_typepusages,
          ls_clsdeferrds    LIKE LINE OF ro_clone->gt_clsdeferrds,
          ls_intdeferrds    LIKE LINE OF ro_clone->gt_intdeferrds,
          ls_aliases        LIKE LINE OF ro_clone->gt_aliases.
          "ls_method_sources LIKE LINE OF ro_clone->gt_method_sources.

    ls_attributes-clsname = iv_new_name.
    ls_methods-clsname = iv_new_name.
    ls_events-clsname = iv_new_name.
    ls_types-clsname = iv_new_name.
    ls_parameters-clsname = iv_new_name.
    ls_exceps-clsname = iv_new_name.
    ls_implementings-clsname = iv_new_name.
    ls_redefinitions-clsname = iv_new_name.
    ls_impl_details-clsname = iv_new_name.
    ls_friendships-clsname = iv_new_name.
    ls_typepusages-clsname = iv_new_name.
    ls_clsdeferrds-clsname = iv_new_name.
    ls_intdeferrds-clsname = iv_new_name.
    ls_aliases-clsname = iv_new_name.

    MODIFY ro_clone->gt_attributes     FROM ls_attributes     TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_methods        FROM ls_methods        TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_events         FROM ls_events         TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_types          FROM ls_types          TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_parameters     FROM ls_parameters     TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_exceps         FROM ls_exceps         TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_implementings  FROM ls_implementings  TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_redefinitions  FROM ls_redefinitions  TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_impl_details   FROM ls_impl_details   TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_friendships    FROM ls_friendships    TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_typepusages    FROM ls_typepusages    TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_clsdeferrds    FROM ls_clsdeferrds    TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_intdeferrds    FROM ls_intdeferrds    TRANSPORTING clsname WHERE clsname IS NOT INITIAL.
    MODIFY ro_clone->gt_aliases        FROM ls_aliases        TRANSPORTING clsname WHERE clsname IS NOT INITIAL.


  ENDMETHOD.


  METHOD generate_class.
    " Sort methods and attributes by a default SAP sequence:
    " - scope - Constant > Static > Instance
    " - visibility - Public > Protected > Private
    " - name - ascending
    SORT gt_attributes BY attdecltyp DESCENDING exposure DESCENDING cmpname ASCENDING.
    SORT gt_methods BY mtddecltyp DESCENDING exposure DESCENDING cmpname ASCENDING.

    " To sort methods an EditOrder needs to be populated
    LOOP AT gt_methods REFERENCE INTO DATA(ld_method).
      ld_method->editorder = sy-tabix.
    ENDLOOP.

    CALL FUNCTION 'SEO_CLASS_CREATE_COMPLETE'
      EXPORTING
        devclass        = iv_pck
        version         = seoc_version_active
        genflag         = abap_false
        authority_check = seox_true
        overwrite       = iv_overwrite
*       SUPPRESS_METHOD_GENERATION           = SEOX_FALSE
*       SUPPRESS_REFACTORING_SUPPORT         = SEOX_TRUE
        method_sources  = gt_method_sources
        locals_def      = gt_locals_def
        locals_imp      = gt_locals_imp
        locals_mac      = gt_locals_mac
*       SUPPRESS_INDEX_UPDATE                = SEOX_FALSE
        typesrc         = gt_type_sources
*       SUPPRESS_CORR   = SEOX_FALSE
*       SUPPRESS_DIALOG =
*       LIFECYCLE_MANAGER                    =
*       LOCAgsAU        =
*       LOCK_HANDLE     =
*       SUPPRESS_UNLOCK = SEOX_FALSE
*       SUPPRESS_COMMIT = SEOX_FALSE
*       GENERATE_METHOD_IMPgsWO_FRAME       = SEOX_FALSE
*  IMPORTING
*       KORRNR          =
*  TABLES
*       CLASS_DESCRIPTIONS                   =
*       COMPONENT_DESCRIPTIONS               =
*       SUBCOMPONENT_DESCRIPTIONS            =
      CHANGING
        class           = gs_class
        inheritance     = gs_inheritance
        redefinitions   = gt_redefinitions
        implementings   = gt_implementings
        impl_details    = gt_impl_details
        attributes      = gt_attributes
        methods         = gt_methods
        events          = gt_events
        types           = gt_types
*       TYPE_SOURCE     =
        parameters      = gt_parameters
        exceps          = gt_exceps
        aliases         = gt_aliases
        typepusages     = gt_typepusages
        clsdeferrds     = gt_clsdeferrds
        intdeferrds     = gt_intdeferrds
        friendships     = gt_friendships
      EXCEPTIONS
        existing        = 1
        is_interface    = 2
        db_error        = 3
        component_error = 4
        no_access       = 5
        other           = 6
        OTHERS          = 7.
    IF sy-subrc = 1.
      RAISE class_exists.
    ELSEIF sy-subrc > 0.
      RAISE generation_error.
    ENDIF.

    "Still here? then class was generated, lets update the text pool
    DATA(lv_poolname) = me->get_textpool_name( ).
    DATA:lo_writer   TYPE REF TO if_siw_repository_writer.
    lo_writer = cl_siw_resource_access=>s_get_instance( ).

    LOOP AT gt_texts ASSIGNING FIELD-SYMBOL(<ls_text>).
      TRY.
          lo_writer->write_textpool(
                i_prog         = lv_poolname
                i_langu        = <ls_text>-spras
                i_tab_textpool = <ls_text>-textpool ).

        CATCH cx_siw_resource_failure.
          RAISE generation_error.
      ENDTRY.
    ENDLOOP.

    COMMIT WORK AND WAIT.
  ENDMETHOD.


  METHOD get_class_name.
    rv_name = gs_class-clsname.
  ENDMETHOD.


  METHOD get_new.

    ro_instance = NEW zcl_caut_class_generator( ).
    ro_instance->gs_class-clsname   = iv_name.
    ro_instance->gs_class-state     = seoc_state_implemented.
    ro_instance->gs_class-langu     = sy-langu.
    ro_instance->gs_class-descript  = iv_descr.

    IF iv_superclass IS SUPPLIED.
      ro_instance->gs_inheritance-clsname    = iv_name.
      ro_instance->gs_inheritance-refclsname = iv_superclass.
      ro_instance->gs_inheritance-state      = seoc_state_implemented.
    ENDIF.

  ENDMETHOD.


  METHOD get_textpool_name.
    DATA: ls_class        TYPE seoclskey.

    ls_class-clsname = me->get_class_name( ).
    CALL FUNCTION 'SEO_CLASS_GET_INCLUDE_BY_NAME'
      EXPORTING
        clskey   = ls_class
      IMPORTING
        progname = rv_name.

  ENDMETHOD.


  METHOD instantiate_from_existing.
    IF NOT check_class_exists_active( iv_clsname ).
      RAISE class_does_not_exist.
    ENDIF.


    DATA(ls_clskey) = VALUE seoclskey( clsname = iv_clsname ).
    ro_instance = NEW zcl_caut_class_generator(  ).

    CALL FUNCTION 'SEO_CLASS_TYPEINFO_GET'
      EXPORTING
        clskey               = ls_clskey
        version              = seoc_version_active
        with_master_language = abap_true
      IMPORTING
        class                = ro_instance->gs_class
        attributes           = ro_instance->gt_attributes
        methods              = ro_instance->gt_methods
        events               = ro_instance->gt_events
        types                = ro_instance->gt_types
        parameters           = ro_instance->gt_parameters
        exceps               = ro_instance->gt_exceps
        implementings        = ro_instance->gt_implementings
        inheritance          = ro_instance->gs_inheritance
        redefinitions        = ro_instance->gt_redefinitions
        impl_details         = ro_instance->gt_impl_details
        friendships          = ro_instance->gt_friendships
        typepusages          = ro_instance->gt_typepusages
        clsdeferrds          = ro_instance->gt_clsdeferrds
        intdeferrds          = ro_instance->gt_intdeferrds
        aliases              = ro_instance->gt_aliases
      EXCEPTIONS
        not_existing         = 1
        is_interface         = 2
        model_only           = 3
        OTHERS               = 4.

    IF sy-subrc <> 0.
      RAISE error_reading_class.
    ENDIF.

    ro_instance->retrieve_method_sources( ).
    ro_instance->retrieve_text_pool( ).
    ro_instance->retrieve_locals( ).
    ro_instance->retrieve_macros( ).
    ro_instance->retrieve_type_sources( ).

  ENDMETHOD.


  METHOD merge_classes_to_new.

    "WARNING! This implementation is not complete, it was done just to comply with the needs
    "of the ARC003 class autogenerator (CAUT006). If you need to use for other projects where
    "classes to be merged can have other components (local clases, local types, etc) please
    "be mindfull of these constraints >>>>
    "This class will only merge new methods and attributes into the destination class

    "Start by creating a new instance with the same contents as the destination
    ro_merged = io_class_into->clone_renamed( io_class_into->get_class_name( ) ).

    "And start adding the delta from the source class

    "Methods and related components
    LOOP AT io_class_add->gt_methods ASSIGNING FIELD-SYMBOL(<ls_method_add>).
      "Only add if method does not exist
      READ TABLE ro_merged->gt_methods WITH KEY cmpname = <ls_method_add>-cmpname
                                       TRANSPORTING NO FIELDS.
      CHECK sy-subrc <> 0.
      "Does not exit, add the method
      "Sources
      APPEND <ls_method_add> TO ro_merged->gt_methods.
      LOOP AT io_class_add->gt_method_sources ASSIGNING FIELD-SYMBOL(<ls_src_add>)
                                              WHERE cpdname = <ls_method_add>-cmpname.
        APPEND <ls_src_add> TO  ro_merged->gt_method_sources.
      ENDLOOP.
      "Parameters
      LOOP AT io_class_add->gt_parameters   ASSIGNING FIELD-SYMBOL(<ls_param_add>)
                                               WHERE cmpname = <ls_method_add>-cmpname.
        APPEND <ls_param_add> TO  ro_merged->gt_parameters.
      ENDLOOP.
      "Exceptions
      LOOP AT io_class_add->gt_exceps ASSIGNING FIELD-SYMBOL(<ls_exc_add>)
                                         WHERE cmpname = <ls_method_add>-cmpname.
        APPEND <ls_exc_add> TO  ro_merged->gt_exceps.
      ENDLOOP.
    ENDLOOP.

    "Attributes
    LOOP AT io_class_add->gt_attributes ASSIGNING FIELD-SYMBOL(<ls_attr_add>).
      READ TABLE ro_merged->gt_attributes WITH KEY cmpname = <ls_attr_add>-cmpname
                                      TRANSPORTING NO FIELDS.
      CHECK sy-subrc <> 0.
      APPEND <ls_attr_add> TO ro_merged->gt_attributes.
    ENDLOOP.

  ENDMETHOD.


  METHOD retrieve_locals.
    DATA: ls_class                 TYPE seoclskey,
          lt_locals_definitions    TYPE seop_source,
          lt_locals_implementation TYPE seop_source.
    ls_class-clsname = me->get_class_name( ).

    CALL FUNCTION 'SEO_CLASS_GET_INCLUDE_SOURCE'
      EXPORTING
        clskey                       = ls_class
        inctype                      = seop_ext_class_locals_def
      IMPORTING
        source                       = lt_locals_definitions
      EXCEPTIONS
        _internal_class_not_existing = 0
        not_existing                 = 0
        OTHERS                       = 0.

    CHECK sy-subrc = 0.

    CALL FUNCTION 'SEO_CLASS_GET_INCLUDE_SOURCE'
      EXPORTING
        clskey                       = ls_class
        inctype                      = seop_ext_class_locals_imp
      IMPORTING
        source                       = lt_locals_implementation
      EXCEPTIONS
        _internal_class_not_existing = 0
        not_existing                 = 0
        OTHERS                       = 0.

    CHECK sy-subrc = 0.

    gt_locals_def = CORRESPONDING #( lt_locals_definitions ).
    gt_locals_imp = CORRESPONDING #( lt_locals_implementation ).




  ENDMETHOD.


  METHOD retrieve_macros.

    DATA: ls_class  TYPE seoclskey,
          lt_macros TYPE seop_source.
    ls_class-clsname = me->get_class_name( ).

    CALL FUNCTION 'SEO_CLASS_GET_INCLUDE_SOURCE'
      EXPORTING
        clskey                       = ls_class
        inctype                      = seop_ext_class_macros
      IMPORTING
        source                       = lt_macros
      EXCEPTIONS
        _internal_class_not_existing = 0
        not_existing                 = 0
        OTHERS                       = 0.

    CHECK sy-subrc = 0.

    gt_locals_mac = CORRESPONDING #( lt_macros ).

  ENDMETHOD.


  METHOD retrieve_method_sources.

    DATA: ls_mtdkey        TYPE seocpdkey,
          lv_idx           TYPE i,
"          ls_sigkey        TYPE seocmpkey,
          ls_method_source TYPE seo_method_source,
          lt_sources       TYPE seop_source_string.

    "get all method sources and signatures
    LOOP AT gt_methods ASSIGNING FIELD-SYMBOL(<ls_method>).
      CHECK <ls_method>-alias IS INITIAL.
      MOVE-CORRESPONDING <ls_method> TO ls_mtdkey.
      ls_mtdkey-cpdname = <ls_method>-cmpname.
*   get method source
      CLEAR lt_sources.
      CALL FUNCTION 'SEO_METHOD_GET_SOURCE'
        EXPORTING
          mtdkey                        = ls_mtdkey
        IMPORTING
          source_expanded               = lt_sources
        EXCEPTIONS
          _internal_method_not_existing = 1
          _internal_class_not_existing  = 2
          version_not_existing          = 3
          inactive_new                  = 4
          inactive_deleted              = 5
          OTHERS                        = 6.
      IF sy-subrc <> 0.
        RETURN.
      ENDIF.

*   delete method / end method
      DELETE lt_sources INDEX 1.
      DESCRIBE TABLE lt_sources LINES lv_idx.
      DELETE lt_sources INDEX lv_idx.
      ls_method_source-cpdname = <ls_method>-cmpname.
      ls_method_source-source = lt_sources.
      APPEND ls_method_source TO gt_method_sources.
    ENDLOOP.

  ENDMETHOD.


  METHOD retrieve_text_pool.
    DATA(lv_include_name) =  me->get_textpool_name( ).

    "Get installed languages
    SELECT DISTINCT spras
      FROM t002c
      INTO TABLE @DATA(lt_languages)
      WHERE lainst = @abap_true.

    CHECK sy-subrc = 0.

    "Get texts for each language
    LOOP AT lt_languages ASSIGNING FIELD-SYMBOL(<ls_langu>).
      APPEND INITIAL LINE TO gt_texts ASSIGNING FIELD-SYMBOL(<ls_txt>).
      <ls_txt>-spras = <ls_langu>-spras.
      READ TEXTPOOL lv_include_name INTO <ls_txt>-textpool
                                    LANGUAGE <ls_langu>-spras.
    ENDLOOP.



  ENDMETHOD.


  METHOD retrieve_type_sources.
    DATA: ls_key   TYPE seoclskey,
          lt_types TYPE seoo_types_r.

    ls_key-clsname = me->get_class_name( ).
    CALL FUNCTION 'SEO_TYPE_READ_ALL'
      EXPORTING
        cifkey            = ls_key
      IMPORTING
        types             = lt_types
      EXCEPTIONS
        clif_not_existing = 1
        OTHERS            = 2.
    IF sy-subrc <> 0.
      RETURN."No types to convert
    ENDIF.

    LOOP AT lt_types  ASSIGNING FIELD-SYMBOL(<ls_type>).
      me->add_type_source(
        EXPORTING
          iv_name   = <ls_type>-cmpname
          iv_source = <ls_type>-typesrc
      ).
    ENDLOOP.


  ENDMETHOD.
ENDCLASS.
