CREATE OR REPLACE procedure user_check_superuser 
(
 i_user_id number
) as
  
  err_user_not_authorized exception;
  PRAGMA EXCEPTION_INIT(err_user_not_authorized, -90009);
  
  dummy number;  
  
begin
	 select 1 into dummy from dat_user
		where
			     id = i_user_id
			 and super_user_ind = 'Y';		 
		
		if (sql%rowcount <> 1) then
		   rollback;
		   raise err_user_not_authorized;
		end if;

		commit;
end;
/
