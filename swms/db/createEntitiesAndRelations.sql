/***************************************************************************
 * SCRIPTNAME:	createEntitiesAndRelations
 * FUNCTION:	(re)create all tables, relations and sequences
 *
 * NOTE:		Drops all tables, so all existing data is lost!!!
 * 				if tables or sequences do not exist, errors occur - ignore!!
 *				
 *				
 ***************************************************************************/


/**********************************************
 * drop all tables
 *********************************************/

drop table swms.dat_activity_status;
drop table swms.dat_workflow;
drop table swms.dat_activity_flow;
drop table swms.mn_role_activity_assignment;
drop table swms.dat_activity;
drop table swms.dat_workflow_scheme;
drop table swms.mn_role_user_assignment;
drop table swms.dat_role;
drop table swms.dat_user;


/**********************************************
 * create all tables
 *********************************************/

-- table USER
CREATE TABLE swms.dat_user
(
  id NUMBER NOT NULL,
  first_name VARCHAR2(30) NOT NULL,
  last_name VARCHAR2(30) NOT NULL,
  department VARCHAR2(30) NOT NULL,
  employee_id NUMBER NOT NULL,
  user_name VARCHAR2(30) UNIQUE NOT NULL,
  password VARCHAR2(10) NOT NULL,
  super_user_ind CHAR(1) NOT NULL CHECK (super_user_ind IN ('Y', 'N')),
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT pk_dat_user PRIMARY KEY (id)
);

-- table ROLE
CREATE TABLE swms.dat_role
(
  id NUMBER,
  Role_name VARCHAR2(30) NOT NULL,
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_dat_role PRIMARY KEY (id)
);

-- table ROLE_USER_ASSIGNMENT
CREATE TABLE swms.mn_role_user_assignment
(
  id NUMBER NOT NULL,
  user_id NUMBER NOT NULL,
  role_id NUMBER NOT NULL,
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_mn_role_user_assignment PRIMARY KEY (id)
);

-- table ACTIVITY
CREATE TABLE swms.dat_activity
(
  id NUMBER NOT NULL,
  workflow_scheme_id NUMBER NOT NULL,
  name VARCHAR2(30) NOT NULL,
  description VARCHAR2(2000),
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_dat_activity PRIMARY KEY (id)
);

-- table ROLE_ACTIVITY_ASSIGNMENT
CREATE TABLE swms.mn_role_activity_assignment
(
  id NUMBER,
  role_id NUMBER NOT NULL,
  Activity_ID NUMBER NOT NULL,
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_mn_Role_Activity_assignment PRIMARY KEY (id)
);

-- table ACTIVITY_FLOW
CREATE TABLE swms.dat_activity_flow
(
  id NUMBER NOT NULL,
  event VARCHAR2(30) NOT NULL,
  predecessor_id NUMBER,
  activity_id NUMBER NOT NULL,
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_dat_activity_flow PRIMARY KEY (id)
);

-- table WORKFLOW_SCHEME
CREATE TABLE swms.dat_workflow_scheme
(
  id NUMBER NOT NULL,
  name VARCHAR2(30) UNIQUE NOT NULL,
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_dat_workflow_scheme PRIMARY KEY (id)
);

-- table WORKFLOW
CREATE TABLE swms.dat_workflow
(
  id NUMBER NOT NULL,
  
  name VARCHAR2(30) NOT NULL,
  workflow_scheme_id NUMBER NOT NULL,
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_dat_workflow PRIMARY KEY (id)
);

-- table ACTIVITY_STATUS
CREATE TABLE swms.dat_activity_status
(
  id NUMBER NOT NULL,
  activity_id NUMBER NOT NULL,
  workflow_id NUMBER NOT NULL,
  comments VARCHAR2(30),
  
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  update_date DATE,
  update_user NUMBER,  
  
  CONSTRAINT PK_dat_activity_status PRIMARY KEY (id)
);




/**********************************************
 * constraints for foreign-keys
 *********************************************/

-- 1 USER <- n ROLE_USER_ASSIGNMENTs -> 1 ROLE (n USERs <-> n ROLEs)
ALTER TABLE swms.mn_role_user_assignment
 ADD CONSTRAINT role_user_assignment_role_fk
 FOREIGN KEY (role_id)
 REFERENCES swms.DAT_ROLE (id) ENABLE
 VALIDATE;
 
-- 1 USER <- n ROLE_USER_ASSIGNMENTs -> 1 ROLE (n USERs <-> n ROLEs)
 ALTER TABLE swms.mn_role_user_assignment
 ADD CONSTRAINT role_user_assignment_user_fk
 FOREIGN KEY (user_id)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE;
  
-- 1 USER <- n ROLE_ACTIVITY_ASSIGNMENTs -> 1 ROLE (n ACTIVITYs <-> n ROLEs)  
 ALTER TABLE swms.mn_role_activity_assignment
 ADD CONSTRAINT role_act_assign_activity_fk
 FOREIGN KEY (activity_id)
 REFERENCES swms.dat_activity (id) ENABLE
 VALIDATE;

-- 1 USER <- n ROLE_ACTIVITY_ASSIGNMENTs -> 1 ROLE (n ACTIVITYs <-> n ROLEs)  
 ALTER TABLE swms.mn_role_activity_assignment
 ADD CONSTRAINT role_act_assign_role_fk
 FOREIGN KEY (role_id)
 REFERENCES swms.dat_role (id) ENABLE
 VALIDATE;

-- 1 WORKFLOW_SCHEME <- n ACTIVITYs
 ALTER TABLE swms.dat_activity
 ADD CONSTRAINT activity_workflow_scheme_fk
 FOREIGN KEY (workflow_scheme_id)
 REFERENCES swms.dat_workflow_scheme (id) ENABLE
 VALIDATE;
 
-- 1 WORKFLOW_SCHEME <- n WORKFLOWs
 ALTER TABLE swms.dat_workflow
 ADD CONSTRAINT workflow_workflow_scheme_fk
 FOREIGN KEY (workflow_scheme_id)
 REFERENCES swms.dat_workflow_scheme (id) ENABLE
 VALIDATE;

-- 1 WORKFLOW <- n ACTIVITY_STATUSes
 ALTER TABLE swms.dat_activity_status
 ADD CONSTRAINT activity_status_workflow_fk
 FOREIGN KEY (workflow_id)
 REFERENCES swms.dat_workflow (id) ENABLE
 VALIDATE;

-- 1 ACTIVITY <- n ACTIVITY_STATUSes 
 ALTER TABLE swms.dat_activity_status
 ADD CONSTRAINT activity_status_activity_fk
 FOREIGN KEY (activity_id)
 REFERENCES swms.dat_activity (id) ENABLE
 VALIDATE;

-- 1 ACTIVITY <- n ACTIVITY_FLOWs 
 ALTER TABLE swms.dat_activity_flow
 ADD CONSTRAINT activity_flow_activity_fk
 FOREIGN KEY (activity_id)
 REFERENCES swms.dat_activity (id) ENABLE
 VALIDATE;

-- 1 ACTIVITY_FLOW <- n ACTIVITY_FLOWs (successors)
 ALTER TABLE swms.dat_activity_flow
 ADD CONSTRAINT activity_flow_predecessor_fk
 FOREIGN KEY (predecessor_id)
 REFERENCES swms.dat_activity (id) ENABLE
 VALIDATE;
 
 
 
/**
* create FKs for the UPDATE_USER and the CREATION_USER
*/
 
 ALTER TABLE swms.dat_activity_status
 ADD CONSTRAINT const_creation_user_fk_1
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_activity_status
 ADD CONSTRAINT const_update_user_fk_1
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_workflow
 ADD CONSTRAINT const_creation_user_fk_2
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_workflow
 ADD CONSTRAINT const_update_user_fk_2
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 
 
 ALTER TABLE swms.dat_activity_flow
 ADD CONSTRAINT const_creation_user_fk_3
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_activity_flow
 ADD CONSTRAINT const_update_user_fk_3
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE;  

 ALTER TABLE swms.mn_role_activity_assignment
 ADD CONSTRAINT const_creation_user_fk_4
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.mn_role_activity_assignment
 ADD CONSTRAINT const_update_user_fk_4
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE;  

 ALTER TABLE swms.dat_activity
 ADD CONSTRAINT const_creation_user_fk_5
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_activity
 ADD CONSTRAINT const_update_user_fk_5
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE;  

 ALTER TABLE swms.dat_workflow_scheme
 ADD CONSTRAINT const_creation_user_fk_6
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_workflow_scheme
 ADD CONSTRAINT const_update_user_fk_6
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE;  

 ALTER TABLE swms.mn_role_user_assignment
 ADD CONSTRAINT const_creation_user_fk_7
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.mn_role_user_assignment
 ADD CONSTRAINT const_update_user_fk_7
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_user
 ADD CONSTRAINT const_creation_user_fk_8
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_user
 ADD CONSTRAINT const_update_user_fk_8
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_role
 ADD CONSTRAINT const_creation_user_fk_9
 FOREIGN KEY (creation_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 

 ALTER TABLE swms.dat_role
 ADD CONSTRAINT const_update_user_fk_9
 FOREIGN KEY (update_user)
 REFERENCES swms.dat_user (id) ENABLE
 VALIDATE; 


/**
* create used SEQUENCES
*/

DROP SEQUENCE SEQ_ACTIVITY_ID;
DROP SEQUENCE SEQ_ACTIVITY_FLOW_ID;
DROP SEQUENCE SEQ_ACTIVITY_STATUS_ID;
DROP SEQUENCE SEQ_ROLE_ID;
DROP SEQUENCE SEQ_USER_ID;
DROP SEQUENCE SEQ_WORKFLOW_ID;
DROP SEQUENCE SEQ_WORKFLOW_SCHEME_ID;
DROP SEQUENCE SEQ_ROLE_ACTIVITY_ASSIGN_ID;
DROP SEQUENCE SEQ_ROLE_USER_ASSIGNMENT_ID;

CREATE SEQUENCE SEQ_ACTIVITY_ID;
CREATE SEQUENCE SEQ_ACTIVITY_FLOW_ID;
CREATE SEQUENCE SEQ_ACTIVITY_STATUS_ID;
CREATE SEQUENCE SEQ_ROLE_ID;
CREATE SEQUENCE SEQ_USER_ID;
CREATE SEQUENCE SEQ_WORKFLOW_ID;
CREATE SEQUENCE SEQ_WORKFLOW_SCHEME_ID;
CREATE SEQUENCE SEQ_ROLE_ACTIVITY_ASSIGN_ID;
CREATE SEQUENCE SEQ_ROLE_USER_ASSIGNMENT_ID;
