--do this things as SYSDBA  

--create our tablespace
CREATE TABLESPACE SWMS
DATAFILE
  'D:\oracle\oradata\swms\swms.dbf' SIZE 500 M 
AUTOEXTEND ON NEXT 50 M MAXSIZE UNLIMITED

--create user "SWMS"
CREATE USER "SWMS" IDENTIFIED BY "SWMS"
 DEFAULT TABLESPACE SWMS
 TEMPORARY TABLESPACE TEMP
 PROFILE DEFAULT
 QUOTA  UNLIMITED  ON SWMS;


--GRANTS f�r SWMS (hier funktionieren einige nicht ... ignorieren) 
GRANT ADMINISTER DATABASE TRIGGER TO "SWMS";
BEGIN
SYS.DBMS_RESOURCE_MANAGER_PRIVS.GRANT_SYSTEM_PRIVILEGE
  (GRANTEE_NAME => 'SWMS', 
   PRIVILEGE_NAME => 'ADMINISTER_RESOURCE_MANAGER',
   ADMIN_OPTION => FALSE);
END;
/
GRANT ADMINISTER ENCRYPTION TO "SWMS";
GRANT ALTER ANY CLUSTER TO "SWMS";
GRANT ALTER ANY DIMENSION TO "SWMS";
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE => SYS.DBMS_RULE_ADM.ALTER_ANY_EVALUATION_CONTEXT,
  GRANTEE => 'SWMS',
  GRANT_OPTION => FALSE);
END;
/
GRANT ALTER ANY INDEX TO "SWMS";
GRANT ALTER ANY INDEXTYPE TO "SWMS";
GRANT ALTER ANY LIBRARY TO "SWMS";
GRANT ALTER ANY OPERATOR TO "SWMS";
GRANT ALTER ANY OUTLINE TO "SWMS";
GRANT ALTER ANY PROCEDURE TO "SWMS";
GRANT ALTER ANY ROLE TO "SWMS";
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE,
  GRANTEE => 'SWMS',
  GRANT_OPTION => FALSE);
END;
/
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE => SYS.DBMS_RULE_ADM.ALTER_ANY_RULE_SET,
  GRANTEE => 'SWMS',
  GRANT_OPTION => FALSE);
END;
/
GRANT ALTER ANY ENCRYPTION PROFILE TO "SWMS";
GRANT ALTER ANY SEQUENCE TO "SWMS";
GRANT ALTER ANY SNAPSHOT TO "SWMS";
GRANT ALTER ANY TABLE TO "SWMS";
GRANT ALTER ANY TRIGGER TO "SWMS";
GRANT ALTER ANY TYPE TO "SWMS";
GRANT ALTER DATABASE TO "SWMS";
GRANT ALTER PROFILE TO "SWMS";
GRANT ALTER RESOURCE COST TO "SWMS";
GRANT ALTER ROLLBACK SEGMENT TO "SWMS";
GRANT ALTER SESSION TO "SWMS";
GRANT ALTER SYSTEM TO "SWMS";
GRANT ALTER TABLESPACE TO "SWMS";
GRANT ALTER USER TO "SWMS";
GRANT ANALYZE ANY TO "SWMS";
GRANT AUDIT ANY TO "SWMS";
GRANT AUDIT SYSTEM TO "SWMS";
GRANT BACKUP ANY TABLE TO "SWMS";
GRANT BECOME USER TO "SWMS";
GRANT COMMENT ANY TABLE TO "SWMS";
GRANT CREATE ANY CLUSTER TO "SWMS";
GRANT CREATE ANY CONTEXT TO "SWMS";
GRANT CREATE ANY DIMENSION TO "SWMS";
GRANT CREATE ANY DIRECTORY TO "SWMS";
BEGIN
SYS.DBMS_RULE_ADM.GRANT_SYSTEM_PRIVILEGE(
  PRIVILEGE => SYS.DBMS_RULE_ADM.CREATE_ANY_EVALUATION_CONTEXT,
  GRANTEE => 'SWMS',
  GRANT_OPTION => FALSE);
END;
/
GRANT CREATE ANY INDEX TO "SWMS";
GRANT CREATE ANY INDEXTYPE TO "SWMS";
GRANT CREATE ANY LIBRARY TO "SWMS";
GRANT CREATE ANY OPERATOR TO "SWMS";
GRANT CREATE ANY OUTLINE TO "SWMS";
GRANT CREATE ANY PROCEDURE TO "SWMS";
GRANT CREATE ANY ENCRYPTION PROFILE TO "SWMS";
GRANT CREATE ANY SEQUENCE TO "SWMS";
GRANT CREATE ANY SNAPSHOT TO "SWMS";
GRANT CREATE ANY SYNONYM TO "SWMS";
GRANT CREATE ANY TABLE TO "SWMS";
GRANT CREATE ANY TRIGGER TO "SWMS";
GRANT CREATE ANY TYPE TO "SWMS";
GRANT CREATE ANY VIEW TO "SWMS";
GRANT CREATE CLUSTER TO "SWMS";
GRANT CREATE DATABASE LINK TO "SWMS";
GRANT CREATE DIMENSION TO "SWMS";
GRANT CREATE INDEXTYPE TO "SWMS";
GRANT CREATE LIBRARY TO "SWMS";
GRANT CREATE OPERATOR TO "SWMS";
GRANT CREATE PROCEDURE TO "SWMS";
GRANT CREATE PROFILE TO "SWMS";
GRANT CREATE PUBLIC DATABASE LINK TO "SWMS";
GRANT CREATE PUBLIC SYNONYM TO "SWMS";
GRANT CREATE ROLE TO "SWMS";
GRANT CREATE ROLLBACK SEGMENT TO "SWMS";
GRANT CREATE ENCRYPTION PROFILE TO "SWMS";
GRANT CREATE SEQUENCE TO "SWMS";
GRANT CREATE SESSION TO "SWMS";
GRANT CREATE SNAPSHOT TO "SWMS";
GRANT CREATE SYNONYM TO "SWMS";
GRANT CREATE TABLE TO "SWMS";
GRANT CREATE TABLESPACE TO "SWMS";
GRANT CREATE TRIGGER TO "SWMS";
GRANT CREATE TYPE TO "SWMS";
GRANT CREATE USER TO "SWMS";
GRANT CREATE VIEW TO "SWMS";
GRANT DEBUG ANY PROCEDURE TO "SWMS";
GRANT DEBUG CONNECT SESSION TO "SWMS";
GRANT DROP ANY CLUSTER TO "SWMS";
GRANT DROP ANY CONTEXT TO "SWMS";
GRANT DROP ANY DIMENSION TO "SWMS";
GRANT DROP ANY DIRECTORY TO "SWMS";
GRANT DROP ANY INDEX TO "SWMS";
GRANT DROP ANY INDEXTYPE TO "SWMS";
GRANT DROP ANY LIBRARY TO "SWMS";
GRANT DROP ANY OPERATOR TO "SWMS";
GRANT DROP ANY OUTLINE TO "SWMS";
GRANT DROP ANY PROCEDURE TO "SWMS";
GRANT DROP ANY ROLE TO "SWMS";
GRANT DROP ANY ENCRYPTION PROFILE TO "SWMS";
GRANT DROP ANY SEQUENCE TO "SWMS";
GRANT DROP ANY SNAPSHOT TO "SWMS";
GRANT DROP ANY SYNONYM TO "SWMS";
GRANT DROP ANY TABLE TO "SWMS";
GRANT DROP ANY TRIGGER TO "SWMS";
GRANT DROP ANY TYPE TO "SWMS";
GRANT DROP ANY VIEW TO "SWMS";
GRANT DROP PROFILE TO "SWMS";
GRANT DROP PUBLIC DATABASE LINK TO "SWMS";
GRANT DROP PUBLIC SYNONYM TO "SWMS";
GRANT DROP ROLLBACK SEGMENT TO "SWMS";
GRANT DROP TABLESPACE TO "SWMS";
GRANT DROP USER TO "SWMS";
GRANT EXECUTE ANY INDEXTYPE TO "SWMS";
GRANT EXECUTE ANY LIBRARY TO "SWMS";
GRANT EXECUTE ANY OPERATOR TO "SWMS";
GRANT EXECUTE ANY PROCEDURE TO "SWMS";
GRANT EXECUTE ANY TYPE TO "SWMS";
GRANT EXEMPT ACCESS POLICY TO "SWMS";
GRANT FLASHBACK ANY TABLE TO "SWMS";
GRANT FORCE ANY TRANSACTION TO "SWMS";
GRANT FORCE TRANSACTION TO "SWMS";
GRANT GLOBAL QUERY REWRITE TO "SWMS";
GRANT GRANT ANY OBJECT PRIVILEGE TO "SWMS";
GRANT GRANT ANY PRIVILEGE TO "SWMS";
GRANT GRANT ANY ROLE TO "SWMS";
GRANT INSERT ANY TABLE TO "SWMS";
GRANT LOCK ANY TABLE TO "SWMS";
GRANT MANAGE TABLESPACE TO "SWMS";
GRANT ON COMMIT REFRESH TO "SWMS";
GRANT QUERY REWRITE TO "SWMS";
GRANT READUP TO "SWMS";
GRANT READUP DBHIGH TO "SWMS";
GRANT RESTRICTED SESSION TO "SWMS";
GRANT RESUMABLE TO "SWMS";
GRANT SELECT ANY DICTIONARY TO "SWMS";
GRANT SELECT ANY SEQUENCE TO "SWMS";
GRANT SELECT ANY TABLE TO "SWMS";
GRANT SYSDBA TO "SWMS";
GRANT UNDER ANY TABLE TO "SWMS";
GRANT UNDER ANY TYPE TO "SWMS";
GRANT UNDER ANY VIEW TO "SWMS";
GRANT UNLIMITED TABLESPACE TO "SWMS";
GRANT UPDATE ANY TABLE TO "SWMS";
GRANT WRITEDOWN TO "SWMS";
GRANT WRITEDOWN DBLOW TO "SWMS";
GRANT WRITEUP TO "SWMS";
GRANT WRITEUP DBHIGH TO "SWMS";
GRANT "AQ_ADMINISTRATOR_ROLE" TO "SWMS";
GRANT "AQ_USER_ROLE" TO "SWMS";
GRANT "AUTHENTICATEDUSER" TO "SWMS";
GRANT "CTXAPP" TO "SWMS";
GRANT "DBA" TO "SWMS";
GRANT "DELETE_CATALOG_ROLE" TO "SWMS";
GRANT "EJBCLIENT" TO "SWMS";
GRANT "EXECUTE_CATALOG_ROLE" TO "SWMS";
GRANT "EXP_FULL_DATABASE" TO "SWMS";
GRANT "GATHER_SYSTEM_STATISTICS" TO "SWMS";
GRANT "HS_ADMIN_ROLE" TO "SWMS";
GRANT "IMP_FULL_DATABASE" TO "SWMS";
GRANT "JAVA_ADMIN" TO "SWMS";
GRANT "JAVADEBUGPRIV" TO "SWMS";
GRANT "JAVA_DEPLOY" TO "SWMS";
GRANT "JAVAIDPRIV" TO "SWMS";
GRANT "JAVASYSPRIV" TO "SWMS";
GRANT "JAVAUSERPRIV" TO "SWMS";
GRANT "LOGSTDBY_ADMINISTRATOR" TO "SWMS";
GRANT "OEM_MONITOR" TO "SWMS";
GRANT "OLAP_DBA" TO "SWMS";
GRANT "RECOVERY_CATALOG_OWNER" TO "SWMS";
GRANT "RESOURCE" TO "SWMS";
GRANT "SALES_HISTORY_ROLE" TO "SWMS";
GRANT "SELECT_CATALOG_ROLE" TO "SWMS";
GRANT "WKUSER" TO "SWMS";
GRANT "WM_ADMIN_ROLE" TO "SWMS";
GRANT "XDBADMIN" TO "SWMS";

