/***************************************************************************
 * SCRIPTNAME:	usefullStatements
 * FUNCTION:	collection of usefull SQL-statements
 *
 ***************************************************************************/
 
-- show currently open sessions on database
select * from v$session;

-- select statement to get create sequence-statements for all IDs
select 'CREATE SEQUENCE SEQ_' || substr(table_name, instr(table_name, '_')+1) || '_ID;' from user_tab_columns
where column_name = 'ID';

-- select statement to get cdrop sequence-statements for all IDs
select 'DROP SEQUENCE SEQ_' || substr(table_name, instr(table_name, '_')+1) || '_ID;' from user_tab_columns
where column_name = 'ID';


-- select statement to get create view statements for all user_tables
select 'CREATE OR REPLACE FORCE VIEW V_' || substr(table_name, instr(table_name, '_')+1)  || ' AS SELECT * FROM ' || table_name || ';' from user_tables

-- select statement to get grant statements for all procedures
select 'grant execute on ' || lower(object_name) || ' to application;' from all_procedures
where owner = 'SWMS'

-- select statement to get grant statements for all views
select 'grant execute on ' || lower(view_name) || ' to application;' from all_views
where owner = 'SWMS'

-- select statement to get create synonym statements for all procedures
select 'create synonym application.' || lower(object_name) || ' for swms.'|| lower(object_name) ||';' from all_procedures
where owner = 'SWMS'

-- select statement to get create synonym statements for all procedures
select 'create synonym application.' || lower(view_name) || ' for swms.'|| lower(view_name) ||';' from all_views
where owner = 'SWMS'