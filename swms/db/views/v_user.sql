/***************************************************************************
 * view v_user
 * 		DESCRIPTION:
 *			shows a list of all users (and hides there passwords)
 ***************************************************************************/
CREATE OR REPLACE FORCE VIEW SWMS.V_USER
(ID, FIRST_NAME, LAST_NAME, DEPARTMENT, EMPLOYEE_ID, 
 USER_NAME)
AS 
select id, first_name, last_name, department, employee_id, user_name from dat_user;
