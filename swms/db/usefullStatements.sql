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