/***************************************************************************
 * procedure user_check_superuser
 * 		DESCRIPTION:
 *			checks if the given user is a superuser.
 *			Raises a err_user_not_authorized-exception if user is not
 *			a superuser.
 *
 * 		PARAMETER:	
 *			i_user_id	user that should me checked
 *
 *		RAISES:
 *			err_user_not_authorized if giben user is NOT a superuser
 ***************************************************************************/
CREATE OR REPLACE procedure user_check_superuser 
(
 i_user_id number
) as
  
  err_user_not_authorized exception;
  PRAGMA EXCEPTION_INIT(err_user_not_authorized, -90009);
  
  dummy number;  
  
begin

	 for dummy_cur in (select 1 from dat_user
		where
			     id = i_user_id
			 and super_user_ind = 'Y') loop
	
	   return;
	 end loop;
	 
	 raise err_user_not_authorized;
end;
/
