USE MOVIES
select * from moviestar
--1
--INSERT INTO MOVIESTAR (NAME, BIRTHDATE) VALUES ('Nicole Kidman', '1967-06-20')

--2
--123, CALVIN COOLIDGE, FASTLANE, 20000000
SELECT * FROM MOVIE

SELECT * FROM MOVIEEXEC WHERE NETWORTH < 30000000
--DELETE FROM MOVIEEXEC WHERE NETWORTH < 30000000

SELECT * FROM MOVIESTAR WHERE ADDRESS IS NULL
--DELETE FROM MOVIESTAR WHERE ADDRESS IS NULL
SELECT * FROM MOVIESTAR

use pc
/* ����������� ��� INSERT ������. ��������� � ������ ����� �����, �� ���������� ��������
����� 1100 � �������� �� ������������� C, ��� �������� 2400 MHz, RAM 2048 MB, ����� ����
500 GB, 52x ������� ������� ���������� � ������ $299. ���� ������ �������� ��� ��� 12.
���������: ����� � CD �� �� ��� ���.*/
SELECT * FROM PC
--INSERT INTO PRODUCT (model, maker, type) VALUES ('1100', 'C', 'PC')
--INSERT INTO PC (PC.model, PC.code, PC.cd, PC.hd, PC.price, PC.ram, PC.speed) VALUES ('1100', 12, '52x', 500, 299, 2048, 2400)
--DELETE FROM PC WHERE MODEL LIKE '1100'

/*�� �� ������� �� ��������� Laptop ������ �������, ��������� �� ������������, ����� ��
���������� ��������. */
SELECT *
FROM LAPTOP
WHERE MODEL IN (
SELECT MODEL 
FROM PRODUCT 
WHERE MAKER NOT IN (SELECT MAKER FROM PRODUCT WHERE TYPE='PRINTER')  
) 

/* ������������ � ������ ������������ B. �� ������ �������� �� � ��������� ������������� ��
���� �.*/

/*update product 
set maker = 'J'
where product.maker like 'B'
*/

/*8. �� �� ������ ���������� ������ �� ����� �������� � �� �� ������� �� 20 GB ��� ����� �����
����. */
/*select * from pc
update pc
set pc.price=pc.price/2,
	pc.hd=pc.hd+20;
select * from pc
*/

/*9. �� ����� ������ �� ������������ B �������� �� ���� ��� ��� ��������� �� ������.
*/

/*update product
set product.maker = 'B'
where product.maker='j'
*/
select * from product

select* from laptop join product on laptop.model=product.model

/*update laptop
set laptop.screen=laptop.screen+1
where model in (select model from product where maker='B')
*/
select* from laptop join product on laptop.model=product.model

--------------
use ships
/* 
10. ��� ��������� ����� ������ �� ����� Nelson - Nelson � Rodney - �� ���� ������� �� ����
������������ ���� 1927 �. ����� �� ����� 16-������ ������ (bore) � ��������������� �� 34000
���� (displacement). �������� ���� ����� ��� ������ �� �����.
*/
SELECT * FROM CLASSES
SELECT * FROM SHIPS

--INSERT INTO CLASSES (CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT) VALUES ('Nelson', 'bb', 'Gt. Britain', 9, 16, 34000)
--INSERT INTO SHIPS (NAME, CLASS, LAUNCHED) VALUES ('Nelson', 'Nelson', 1927)
--INSERT INTO SHIPS (NAME, CLASS, LAUNCHED) VALUES ('Rodney', 'Nelson', 1927)

SELECT * FROM CLASSES
SELECT * FROM SHIPS

/*11. �������� �� ��������� Ships ������ ������, ����� �� �������� � �����.
*/
--SELECT * -> DELETE
SELECT * FROM SHIPS WHERE SHIPS.NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT LIKE 'SUNK')

/*12. ��������� ������� � ��������� Classes ����, �� ��������� (bore) �� �� ������� � ���������� (�
������� � � ������, 1 ��� ~ 2.5 ��) � ����������������� �� �� ������� � �������� ������ (1 �.�.
= 1.1 �.)
*/
SELECT * FROM CLASSES

UPDATE CLASSES
SET BORE=BORE*2.5,
DISPLACEMENT=DISPLACEMENT*1.1

SELECT * FROM CLASSES
	
