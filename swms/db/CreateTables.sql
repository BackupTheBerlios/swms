
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

