CREATE OR REPLACE function user_login
(
 i_user_name in varchar2,
 i_password in varchar2
) return number as 

  err_user_not_authorized exception;
  PRAGMA EXCEPTION_INIT(err_user_not_authorized, -90009);
     
  
begin

	 for dummy_cur in (select id from dat_user
		where
			     user_name = i_user_name
			 and password = i_password) loop
	
	   return dummy_cur.id;
	 end loop;
	 
	 raise err_user_not_authorized;
end;
