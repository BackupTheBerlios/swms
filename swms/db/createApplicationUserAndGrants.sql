/***************************************************************************
 * SCRIPTNAME:	createApplicationUserAndGrants
 * FUNCTION:	create the user for the application and its grants 
 *
 * NOTE:		THIS SCRIPT SHOULD BE RUN as SWMS
 ***************************************************************************/

--drop user SWMS
drop user application;
 

--create user "APPLICATION" with default TABLESPACE "SWMS"
CREATE USER "APPLICATION" IDENTIFIED BY "APPLICATION"
 DEFAULT TABLESPACE SWMS
 TEMPORARY TABLESPACE TEMP
 PROFILE DEFAULT
 QUOTA  UNLIMITED ON SWMS;


--assign GRANTS to APPLICATION
GRANT CREATE SESSION TO "APPLICATION";

grant select on v_user to APPLICATION

grant execute on user_change_password to application;
grant execute on user_check_superuser to application;
grant execute on user_delete to application;
grant execute on user_insert to application;
grant execute on user_login to application;
grant execute on user_reset_password to application;
grant execute on user_update to application;

--create synonyms for APPLICATION
create synonym application.v_user for swms.v_user;

create synonym application.user_change_password for swms.user_change_password;
create synonym application.user_check_superuser for swms.user_check_superuser;
create synonym application.user_delete for swms.user_delete;
create synonym application.user_insert for swms.user_insert;
create synonym application.user_login for swms.user_login;
create synonym application.user_reset_password for swms.user_reset_password;
create synonym application.user_update for swms.user_update;




