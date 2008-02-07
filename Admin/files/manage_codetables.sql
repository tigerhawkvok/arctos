-- select 'grant update,insert,delete on ' || table_name || ' to manage_codetables;' from all_tables where table_name like 'CT%';
create role manage_codetables;
grant update,insert,delete on CTISLAND_GROUP to manage_codetables;
grant update,insert,delete on CTKARYO_STAIN_PROC to manage_codetables;
grant update,insert,delete on CTKILL_METHOD to manage_codetables;
grant update,insert,delete on CTLAT_LONG_ERROR_UNITS to manage_codetables;
grant update,insert,delete on CTLAT_LONG_REF_SOURCE to manage_codetables;
grant update,insert,delete on CTLAT_LONG_UNITS to manage_codetables;
grant update,insert,delete on CTLENGTH_UNITS to manage_codetables;
grant update,insert,delete on CTLEXICAL_RELATIONSHIP to manage_codetables;
grant update,insert,delete on CTLOAN_INSTALLMENT_STATUS to manage_codetables;
grant update,insert,delete on CTLOAN_ITEM_STATUS to manage_codetables;
grant update,insert,delete on CTLOAN_STATUS to manage_codetables;
grant update,insert,delete on CTLOAN_TYPE to manage_codetables;
grant update,insert,delete on CTLOCALITY_SECTION_PART to manage_codetables;
grant update,insert,delete on CTNATURE_OF_ID to manage_codetables;
grant update,insert,delete on CTNS to manage_codetables;
grant update,insert,delete on CTNUMERIC_AGE_UNITS to manage_codetables;
grant update,insert,delete on CTORIG_ELEV_UNITS to manage_codetables;
grant update,insert,delete on CTPERMIT_TYPE to manage_codetables;
grant update,insert,delete on CTPREFIX to manage_codetables;
grant update,insert,delete on CTAGE_CLASS to manage_codetables;
grant update,insert,delete on CTAGE_DET_METHOD to manage_codetables;
grant update,insert,delete on CTATTRIBUTE_CODE_TABLES to manage_codetables;
grant update,insert,delete on CTATTRIBUTE_TYPE to manage_codetables;
grant update,insert,delete on CTBIN_OBJ_ASPECT to manage_codetables;
grant update,insert,delete on CTBIN_OBJ_SUBJECT to manage_codetables;
grant update,insert,delete on CTBIOL_RELATIONS to manage_codetables;
grant update,insert,delete on CTBORROW_STATUS to manage_codetables;
grant update,insert,delete on CTCATALOGED_ITEM_TYPE to manage_codetables;
grant update,insert,delete on CTCF_LOAN_USE_TYPE to manage_codetables;
grant update,insert,delete on CTCITATION_TYPE_STATUS to manage_codetables;
grant update,insert,delete on CTCLASS to manage_codetables;
grant update,insert,delete on CTCOLLECTING_METHOD to manage_codetables;
grant update,insert,delete on CTCOLLECTING_SOURCE to manage_codetables;
grant update,insert,delete on CTCOLLECTION_CDE to manage_codetables;
grant update,insert,delete on CTCOLLECTOR_ROLE to manage_codetables;
grant update,insert,delete on CTCOLL_CONTACT_ROLE to manage_codetables;
grant update,insert,delete on CTCOLL_OBJECT_TYPE to manage_codetables;
grant update,insert,delete on CTCOLL_OBJ_DISP to manage_codetables;
grant update,insert,delete on CTCOLL_OBJ_FLAGS to manage_codetables;
grant update,insert,delete on CTCOLL_OTHER_ID_TYPE to manage_codetables;
grant update,insert,delete on CTCONTAINER_TYPE to manage_codetables;
grant update,insert,delete on CTACCN_STATUS to manage_codetables;
grant update,insert,delete on CTACCN_TYPE to manage_codetables;
grant update,insert,delete on CTADDR_TYPE to manage_codetables;
grant update,insert,delete on CTADDR_USE to manage_codetables;
grant update,insert,delete on CTAGENT_ADDR_JOB_TITLE to manage_codetables;
grant update,insert,delete on CTAGENT_ADDR_TYPE to manage_codetables;
grant update,insert,delete on CTAGENT_NAME_TYPE to manage_codetables;
grant update,insert,delete on CTAGENT_RELATIONSHIP to manage_codetables;
grant update,insert,delete on CTAGENT_ROLE to manage_codetables;
grant update,insert,delete on CTAGENT_TYPE to manage_codetables;
grant update,insert,delete on CTSPECIMEN_PART_NAME to manage_codetables;
grant update,insert,delete on CTSPECIMEN_PRESERV_METHOD to manage_codetables;
grant update,insert,delete on CTSUFFIX to manage_codetables;
grant update,insert,delete on CTTAXA_FORMULA to manage_codetables;
grant update,insert,delete on CTTAXA_ROLE to manage_codetables;
grant update,insert,delete on CTTAXONOMIC_AUTHORITY to manage_codetables;
grant update,insert,delete on CTTAXON_RELATION to manage_codetables;
grant update,insert,delete on CTTAXON_VARIABLE to manage_codetables;
grant update,insert,delete on CTTRANSACTION_TYPE to manage_codetables;
grant update,insert,delete on CTURL_TYPE to manage_codetables;
grant update,insert,delete on CTVERIFICATIONSTATUS to manage_codetables;
grant update,insert,delete on CTWEIGHT_UNITS to manage_codetables;
grant update,insert,delete on CT_ATTRIBUTE_CODE_TABLES to manage_codetables;
grant update,insert,delete on CTPROJECT_AGENT_ROLE to manage_codetables;
grant update,insert,delete on CTPUBLICATION_TYPE to manage_codetables;
grant update,insert,delete on CTREFERENCERELATION to manage_codetables;
grant update,insert,delete on CTREQUEST_STATUS to manage_codetables;
grant update,insert,delete on CTSECTION_TYPE to manage_codetables;
grant update,insert,delete on CTSEX_CDE to manage_codetables;
grant update,insert,delete on CTSHIPMENT_CARRIER to manage_codetables;
grant update,insert,delete on CTSHIPMENT_STATUS to manage_codetables;
grant update,insert,delete on CTSHIPPED_CARRIER_METHOD to manage_codetables;
grant update,insert,delete on CTFLAG_YES_NO_UNKNOWN to manage_codetables;
grant update,insert,delete on CTFLUID_CONCENTRATION to manage_codetables;
grant update,insert,delete on CTFLUID_TYPE to manage_codetables;
grant update,insert,delete on CTSPECIMEN_PART_LIST_ORDER to manage_codetables;
grant update,insert,delete on CTSPECIMEN_PART_MODIFIER to manage_codetables;
grant update,insert,delete on CTGEOG_SOURCE_AUTHORITY to manage_codetables;
grant update,insert,delete on CTGEOREFMETHOD to manage_codetables;
grant update,insert,delete on CTHABITAT_DESC to manage_codetables;
grant update,insert,delete on CTCONTAINER_TYPE_SIZE to manage_codetables;
grant update,insert,delete on CTCONTINENT to manage_codetables;
grant update,insert,delete on CTCORRESP_TYPE to manage_codetables;
grant update,insert,delete on CTDATUM to manage_codetables;
grant update,insert,delete on CTDEACCN_TYPE to manage_codetables;
grant update,insert,delete on CTDEPTH_UNITS to manage_codetables;
grant update,insert,delete on CTDOWNLOAD_PURPOSE to manage_codetables;
grant update,insert,delete on CTEGG_NEST_COMBO to manage_codetables;
grant update,insert,delete on CTELECTRONIC_ADDR_TYPE to manage_codetables;
grant update,insert,delete on CTENCUMBRANCE_ACTION to manage_codetables;
grant update,insert,delete on CTEW to manage_codetables;
grant update,insert,delete on CTFEATURE to manage_codetables;
grant update,insert,delete on CTFLAGS to manage_codetables;
grant update,insert,delete on CTFLAG_YES_NO to manage_codetables;
grant update,insert,delete on CTHISTO_SECTION_ORIENT to manage_codetables;
grant update,insert,delete on CTHISTO_STAIN_PROC to manage_codetables;
grant update,insert,delete on CTID_MODIFIER to manage_codetables;
grant update,insert,delete on CTIMAGE_CONTENT_TYPE to manage_codetables;
grant update,insert,delete on CTIMAGE_OBJECT_TYPE to manage_codetables;
grant update,insert,delete on CTINFRASPECIFIC_RANK to manage_codetables;
