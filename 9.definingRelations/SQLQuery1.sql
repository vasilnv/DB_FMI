/*
задача 1
а) Дефинирайте следните релации:
Product (maker, model, type), където:
- модел е низ от точно 4 символа,
- производител е низ от точно 1 символ,
- тип е низ до 7 символа;
Printer (code, model, price), където:
- код е цяло число,
- модел е низ от точно 4 символа,
- цена с точност до два знака след десетичната запетая;
б) Добавете кортежи с примерни данни към новосъздадените релации.
в) Добавете към релацията Printer атрибути:
- type - низ до 6 символа (забележка: type може да приема
стойност 'laser', 'matrix' или 'jet'),
- color - низ от точно 1 символ, стойност по подразбиране 'n'
(забележка: color може да приема стойност 'y' или 'n').
г) Напишете заявка, която премахва атрибута price от релацията Printer.
д) Изтрийте релациите, които сте създали в Задача 1.*/
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
Задача 2
а) Нека създадем мини вариант на Facebook. Искаме да имаме следните
релации (може да предложите и друг вариант):
- Users: уникален номер (id), email, парола, дата на регистрация.
- Friends: двойки от номера на потребители, напр. ако 12 е приятел на 21, 25 и
40, ще има кортежи (12,21), (12,25), (12,40).
- Walls: номер на потребител, номер на потребител написал съобщението,
текст на съобщението, дата.
- Groups: уникален номер, име, описание (по подразбиране - празен низ).
- GroupMembers: двойки от вида номер на група - номер на потребител.
б) Добавете кортежи с примерни данни към новосъздадените релации.
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
-- Groups: уникален номер, име, описание (по подразбиране - празен низ).
-- GroupMembers: двойки от вида номер на група - номер на потребител.
CREATE TABLE GROUPS (
	ID INT PRIMARY KEY,
	NAME VARCHAR(20),
	DESRIPTION VARCHAR(256)
)
-- GroupMembers: двойки от вида номер на група - номер на потребител.
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
