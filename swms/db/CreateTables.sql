
CREATE TABLE SWMS.mn_Role_Activity_assignment
(
  ID NUMBER,
  role_ID_fk NUMBER NOT NULL,
  Activity_ID NUMBER NOT NULL,
  CONSTRAINT PK_mn_Role_Activity_assignment PRIMARY KEY (ID )
)
CREATE TABLE SWMS.dat_role
(
  ID NUMBER,
  Role_name VARCHAR2(30) NOT NULL,
  CONSTRAINT PK_dat_role PRIMARY KEY (ID )
)

CREATE TABLE SWMS.mn_role_user_assignment
(
  ID NUMBER NOT NULL,
  user_id NUMBER NOT NULL,
  role_id NUMBER NOT NULL,
  CONSTRAINT PK_mn_role_user_assignment PRIMARY KEY (ID )
)

CREATE TABLE SWMS.dat_user
(
  ID NUMBER NOT NULL,
  first_name VARCHAR2(30) NOT NULL,
  last_name VARCHAR2(30) NOT NULL,
  department VARCHAR2(30) NOT NULL,
  employee_id NUMBER NOT NULL,
  user_name VARCHAR2(30) UNIQUE NOT NULL,
  password VARCHAR2(10) NOT NULL,
  CONSTRAINT PK_dat_user PRIMARY KEY (ID )
)

CREATE TABLE SWMS.dat_workflow_scheme
(
  id NUMBER NOT NULL,
  name VARCHAR2(30) UNIQUE NOT NULL,
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  CONSTRAINT PK_dat_workflow_scheme PRIMARY KEY (id )
)

CREATE TABLE SWMS.dat_activity
(
  id NUMBER NOT NULL,
  workflow_scheme_id NUMBER NOT NULL,
  name VARCHAR2(30) NOT NULL,
  description VARCHAR2(30),
  CONSTRAINT PK_dat_activity PRIMARY KEY (id )
)

CREATE TABLE SWMS.dat_activity_flow
(
  id NUMBER NOT NULL,
  event VARCHAR2(30) NOT NULL,
  predecessor_id NUMBER,
  activity_id NUMBER NOT NULL,
  CONSTRAINT PK_dat_activity_flow PRIMARY KEY (id )
)

CREATE TABLE SWMS.dat_activity_status
(
  id NUMBER NOT NULL,
  user_id NUMBER NOT NULL,
  activity_id NUMBER NOT NULL,
  workflow_id NUMBER NOT NULL,
  comments VARCHAR2(30),
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  CONSTRAINT PK_dat_activity_status PRIMARY KEY (id )
)

CREATE TABLE SWMS.dat_workflow
(
  id NUMBER NOT NULL,
  name VARCHAR2(30) NOT NULL,
  worflow_scheme_id NUMBER NOT NULL,
  creation_date DATE NOT NULL,
  creation_user NUMBER NOT NULL,
  CONSTRAINT PK_dat_workflow PRIMARY KEY (id )
)

