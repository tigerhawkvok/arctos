create role manage_specimens;
grant update,insert on cataloged_item to manage_specimens;
grant update,insert,delete on coll_object to manage_specimens;
grant update,insert,delete on COLLECTOR to manage_specimens;
grant update,insert,delete on ATTRIBUTES to manage_specimens;
grant update,insert,delete on BINARY_OBJECT to manage_specimens;
grant update,insert,delete on BIOL_INDIV_RELATIONS to manage_specimens;
grant update,insert,delete on COLL_OBJECT_REMARK to manage_specimens;
grant update,insert,delete on COLL_OBJECT_ENCUMBRANCE to manage_specimens;
grant update,insert,delete on coll_obj_other_id_num to manage_specimens;
grant update,insert,delete on specimen_part to manage_specimens;
grant update,insert on COLLECTING_EVENT to manage_specimens;
grant update,insert,delete on cataloged_item to manage_specimens;
grant update on spec_with_loc to manage_specimens;