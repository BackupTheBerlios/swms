/***************************************************************************
 * procedure user_delete
 * 		DESCRIPTION:
 *			changes the data of a user.
 *			That operation can be performed only by the user himself,
 *			or a superuser.
 *
 * 		PARAMETER:	
 *			i_active_user_id	user that performs that operation
 *			i_user_id			user that data should be changed
 *			i_new_first_name	the new first name of the user
 *			i_new_last_name		the new surname of the user
 *			i_new_department	the new department of the user
 *			i_new_employee_id	the new employee id of the user
 *			i_new_user_name		the new username of the user
 *						
 *
 *		RAISES:
 *			err_user_not_authorized if the active user is the user
 *									that should be changed and is
 *									NOT a superuser
 ***************************************************************************/
CREATE OR REPLACE procedure user_update 
(
 i_active_user_id number,
 i_user_id in number,
 i_new_first_name in varchar2,
 i_new_last_name in varchar2,
 i_new_department in varchar2,
 i_new_employee_id in number,
 i_new_user_name in varchar2
) as

  err_user_pass_combination exception;
  PRAGMA EXCEPTION_INIT(err_user_pass_combination, -90001);  
  
begin

	 if (i_user_id <> i_active_user_id) then
	 	user_check_superuser(i_active_user_id);
	 end if;
	 
	 update dat_user
 		set 
			first_name = i_new_first_name,
			last_name = i_new_last_name,
			department = i_new_department,
			employee_id = i_new_employee_id,
			user_name = i_new_user_name,
			update_date = sysdate,
			update_user = i_active_user_id
		where
			     id = i_user_id;

		commit;
end;
/
