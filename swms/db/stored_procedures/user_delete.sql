/***************************************************************************
 * procedure user_delete
 * 		DESCRIPTION:
 *			deletes an existing user from the database.
 *
 * 		PARAMETER:	
 *			i_active_user_id	user that performs that operation
 *			i_user_id			user that should be deleted
 *
 *		RAISES:
 *			err_user_not_authorized if the active user is NOT a superuser
 ***************************************************************************/
CREATE OR REPLACE procedure user_delete 
(
 i_active_user_id number,
 i_user_id in number
) as

begin

 	user_check_superuser(i_active_user_id);
	 
	delete from dat_user
		where
			     id = i_user_id;

		commit;
end;
/
