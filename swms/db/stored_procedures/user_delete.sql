CREATE OR REPLACE procedure user_update 
(
 i_active_user_id number,
 i_user_id in number,
 i_first_name in varchar2,
 i_last_name in varchar2,
 i_department in varchar2,
 i_employee_id in number,
 i_user_name in varchar2
) as

  err_user_pass_combination exception;
  PRAGMA EXCEPTION_INIT(err_user_pass_combination, -90001);  
  
begin

	 if (i_user_id <> i_active_user_id) then
	 	user_check_superuser(i_active_user_id);
	 end if;
	 
	 update dat_user
 		set 
			first_name = i_first_name,
			last_name = i_last_name,
			department = i_department,
			employee_id = i_employee_id,
			user_name = i_user_name
		where
			     id = i_user_id;

		commit;
end;
/
