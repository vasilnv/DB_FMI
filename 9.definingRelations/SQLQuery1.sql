/*
������ 1
�) ����������� �������� �������:
Product (maker, model, type), ������:
- ����� � ��� �� ����� 4 �������,
- ������������ � ��� �� ����� 1 ������,
- ��� � ��� �� 7 �������;
Printer (code, model, price), ������:
- ��� � ���� �����,
- ����� � ��� �� ����� 4 �������,
- ���� � ������� �� ��� ����� ���� ����������� �������;
�) �������� ������� � �������� ����� ��� ��������������� �������.
�) �������� ��� ��������� Printer ��������:
- type - ��� �� 6 ������� (���������: type ���� �� ������
�������� 'laser', 'matrix' ��� 'jet'),
- color - ��� �� ����� 1 ������, �������� �� ������������ 'n'
(���������: color ���� �� ������ �������� 'y' ��� 'n').
�) �������� ������, ����� �������� �������� price �� ��������� Printer.
�) �������� ���������, ����� ��� ������� � ������ 1.*/
--a
/*
DROP TABLE PRODUCTSS
DROP TABLE PRINTERSS

CREATE TABLE PRODUCTSS (
	model CHAR(4) PRIMARY KEY,
	maker CHAR(1),
	type VARCHAR(7)
)

CREATE TABLE PRINTERSS (
	code  INT primary key,
	model CHAR(4),
	PRICE DECIMAL (6,2) --xxxx,yy
)
--b
INSERT INTO PRODUCTSS(model, maker, type) VALUES ('1111', 'N', 'pc')
INSERT INTO PRODUCTSS(model, maker, type) VALUES ('1012', 'N', 'printer')
INSERT INTO PRODUCTSS(model, maker, type) VALUES ('1112', 'M', 'pc')

INSERT INTO PRINTERSS(code, model, price) VALUES (1, '1012', 230.25)
INSERT INTO PRINTERSS(code, model, price) VALUES (2, '1012', 230.5)
INSERT INTO PRINTERSS(code, model, price) VALUES (3, '1012', 240.99)

SELECT * FROM PRODUCTSS
SELECT * FROM PRINTERSS

--C
ALTER TABLE PRINTERSS ADD TYPE VARCHAR(6) NOT NULL DEFAULT 'N/A' CHECK (TYPE IN ('laser', 'matrix', 'jet', 'N/A'))
ALTER TABLE PRINTERSS ADD COLOR CHAR(1) NOT NULL DEFAULT 'N' CHECK(COLOR IN ('Y', 'N'))
SELECT * FROM PRINTERSS

--d
ALTER TABLE PRINTERSS DROP COLUMN price
SELECT * FROM PRINTERSS
*/
--e
--BEGINNING OF a

/* 
������ 2
�) ���� �������� ���� ������� �� Facebook. ������ �� ����� ��������
������� (���� �� ���������� � ���� �������):
- Users: �������� ����� (id), email, ������, ���� �� �����������.
- Friends: ������ �� ������ �� �����������, ����. ��� 12 � ������� �� 21, 25 �
40, �� ��� ������� (12,21), (12,25), (12,40).
- Walls: ����� �� ����������, ����� �� ���������� ������� �����������,
����� �� �����������, ����.
- Groups: �������� �����, ���, �������� (�� ������������ - ������ ���).
- GroupMembers: ������ �� ���� ����� �� ����� - ����� �� ����������.
�) �������� ������� � �������� ����� ��� ��������������� �������.
*/

DROP TABLE FRIENDS
DROP TABLE GROUPMEMBERS
DROP TABLE GROUPS
DROP TABLE WALLS
DROP TABLE USERS
CREATE TABLE USERS(
		ID INT PRIMARY KEY ,
		EMAIL VARCHAR(256),
		PASS VARCHAR(256),
		DATE_OF_REGISTRATION DATE
)
CREATE TABLE FRIENDS (
	FRIEND1 INT,
	FRIEND2 INT

	CONSTRAINT FRIEND_1_FK FOREIGN KEY(FRIEND1) REFERENCES USERS(ID),
	CONSTRAINT FRIEND_2_FK FOREIGN KEY(FRIEND2) REFERENCES USERS(ID)
)
CREATE TABLE WALLS (
	USERWALL INT,
	USERWRITER INT, 
	MESSAGE TEXT,
	MSGDATE DATE

	CONSTRAINT USER_WALL_FK FOREIGN KEY (USERWALL) REFERENCES USERS(ID),
	CONSTRAINT USER_WRITER_FK FOREIGN KEY (USERWRITER) REFERENCES USERS(ID)
)
-- Groups: �������� �����, ���, �������� (�� ������������ - ������ ���).
-- GroupMembers: ������ �� ���� ����� �� ����� - ����� �� ����������.
CREATE TABLE GROUPS (
	ID INT PRIMARY KEY,
	NAME VARCHAR(20),
	DESRIPTION VARCHAR(256)
)
-- GroupMembers: ������ �� ���� ����� �� ����� - ����� �� ����������.
CREATE TABLE GROUPMEMBERS (
	GROUP_ID INT,
	USER_ID INT 

	CONSTRAINT GROUP_ID_FK FOREIGN KEY(GROUP_ID) REFERENCES GROUPS(ID), 
	CONSTRAINT USER_ID_FK FOREIGN KEY (USER_ID) REFERENCES USERS(ID)
)

INSERT INTO USERS (ID, EMAIL, PASS, DATE_OF_REGISTRATION) VALUES (1, 'GOSHO@GMAIL.COM', '1234', '2019-02-02')
INSERT INTO USERS (ID, EMAIL, PASS, DATE_OF_REGISTRATION) VALUES (2, 'GOSHO1@GMAIL.COM', '12345', '2019-02-02')
INSERT INTO USERS (ID, EMAIL, PASS, DATE_OF_REGISTRATION) VALUES (3, 'GOSHO2@GMAIL.COM', '12344', '2019-02-02')

INSERT INTO WALLS (WALLS.MESSAGE, WALLS.MSGDATE, WALLS.USERWALL, WALLS.USERWRITER) VALUES ('AAAAAA', '2019-02-02', 1, 2)

INSERT INTO FRIENDS (FRIENDS.FRIEND1, FRIENDS.FRIEND2) VALUES (1,2)
INSERT INTO GROUPS (GROUPS.ID, GROUPS.NAME, GROUPS.DESRIPTION) VALUES (1, 'GOSHETATA', 'GOGO JOJO')

INSERT INTO GROUPMEMBERS (GROUPMEMBERS.GROUP_ID, GROUPMEMBERS.USER_ID ) VALUES (1, 1)
INSERT INTO GROUPMEMBERS (GROUPMEMBERS.GROUP_ID, GROUPMEMBERS.USER_ID ) VALUES (1, 2)
INSERT INTO GROUPMEMBERS (GROUPMEMBERS.GROUP_ID, GROUPMEMBERS.USER_ID ) VALUES (1, 3)

select * from users
select * from WALLS
select * from GROUPS
select * from GROUPMEMBERS
select * from FRIENDS
