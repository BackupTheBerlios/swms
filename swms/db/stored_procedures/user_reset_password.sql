CREATE OR REPLACE procedure user_reset_password 
(
 i_active_user_id number,
 i_user_id in number,
 i_new_password in varchar2
) as

  err_user_not_found exception;
  PRAGMA EXCEPTION_INIT(err_user_not_found, -90002); 
   
begin
	 user_check_superuser(i_active_user_id);
	 
	 update dat_user
	 	set 
			password = i_new_password,
			update_user = i_active_user_id,
			update_date = sysdate
		where
			     id = i_user_id;			 
		
		if (sql%rowcount <> 1) then
		   rollback;
		   raise err_user_not_found;
		end if;

		commit;
end;
/
