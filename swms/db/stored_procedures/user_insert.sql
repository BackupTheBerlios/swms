CREATE OR REPLACE function user_insert 
(
 i_active_user_id in number,
 i_first_name in varchar2,
 i_last_name in varchar2,
 i_department in varchar2,
 i_employee_id in number,
 i_user_name in varchar2,
 i_password in varchar2
) return number as
  new_user_id number;
begin

	 user_check_superuser(i_active_user_id);

	 select seq_user_id.nextval into new_user_id from dual;

	 insert into dat_user
		 (id, first_name, last_name, department, employee_id, user_name, password)
	 values 
		 (new_user_id, i_first_name, i_last_name, i_department, 
		  i_employee_id, i_user_name, i_password);
	 commit;
	 
	return new_user_id;
end;
/
