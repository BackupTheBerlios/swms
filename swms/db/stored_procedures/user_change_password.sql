/***************************************************************************
 * procedure user_change_password
 * 		DESCRIPTION:
 *			changes the password of a user.
 *
 * 		PARAMETER:	
 *			i_active_user_id	user that performs that operation
 *			i_old_password		old_password of the user
 *			i_new_password		new_password to set
 *
 *		RAISES:
 *			err_user_pass_combination
 ***************************************************************************/
CREATE OR REPLACE procedure user_change_password 
(
 i_active_user_id number,
 i_old_password in varchar2,
 i_new_password in varchar2
) as

	err_user_pass_combination exception; 
	PRAGMA EXCEPTION_INIT(err_user_pass_combination, -90001); 

begin
	 update dat_user
 		set 
			password = i_new_password
		where
			     id = i_active_user_id 
			 and password = i_old_password;
			 
		
		if (sql%rowcount <> 1) then
		   rollback;
		   raise err_user_pass_combination;
		end if;

		commit;
end;
/