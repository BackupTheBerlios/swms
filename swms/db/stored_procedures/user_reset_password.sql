/***************************************************************************
 * procedure user_delete
 * 		DESCRIPTION:
 *			resets a password of a user
 *
 * 		PARAMETER:	
 *			i_active_user_id	user that performs that operation
 *			i_user_id			user that password should be reseted
 *			i_password			new password to set
 *
 *		RAISES:
 *			err_user_not_authorized if the active user is NOT a superuser
 ***************************************************************************/
CREATE OR REPLACE procedure user_reset_password 
(
 i_active_user_id number,
 i_user_id in number,
 i_password in varchar2
) as

  err_user_not_authorized exception;
  PRAGMA EXCEPTION_INIT(err_user_not_authorized, -90009);
    
  dummy number;  
  
begin

 	user_check_superuser(i_active_user_id);

	 update dat_user
 		set
		    password    = i_password,
			update_date = sysdate,
			update_user = i_active_user_id
		where
			     id = i_user_id;

		commit;
end;
/
