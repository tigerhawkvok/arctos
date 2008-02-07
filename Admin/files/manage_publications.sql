create role manage_publications;
grant insert,update,delete on CITATION to manage_publications;
grant insert,update,delete on FIELD_NOTEBOOK_SECTION to manage_publications;
grant insert,update,delete on JOURNAL to manage_publications;
grant insert,update,delete on JOURNAL_ARTICLE to manage_publications;
grant insert,update,delete on PAGE to manage_publications;
grant insert,update,delete on PROJECT to manage_publications;
grant insert,update,delete on PROJECT_AGENT to manage_publications;
grant insert,update,delete on PROJECT_PUBLICATION to manage_publications;
grant insert,update,delete on PROJECT_TRANS to manage_publications;
grant insert,update,delete on PUBLICATION to manage_publications;
grant insert,update,delete on PUBLICATION_AUTHOR_NAME to manage_publications;
grant insert,update,delete on PUBLICATION_URL to manage_publications;