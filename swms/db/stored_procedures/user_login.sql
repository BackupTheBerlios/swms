CREATE OR REPLACE procedure user_reset_password 
(
 i_user_id in number,
 i_password in varchar2
) as

  err_user_not_authorized exception;
  PRAGMA EXCEPTION_INIT(err_user_not_authorized, -90009);
    
  dummy number;  
  
begin
	 select 1 into dummy from dat_user
		where
			     id = i_user_id
			 and password = i_password;		 
		
		if (sql%rowcount <> 1) then
		   rollback;
		   raise err_user_not_authorized;
		end if;

		commit;
end;
