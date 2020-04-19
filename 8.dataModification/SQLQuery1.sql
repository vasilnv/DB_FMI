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
/* Използвайте две INSERT заявки. Съхранете в базата данни факта, че персонален компютър
модел 1100 е направен от производителя C, има процесор 2400 MHz, RAM 2048 MB, твърд диск
500 GB, 52x оптично дисково устройство и струва $299. Нека новият компютър има код 12.
Забележка: модел и CD са от тип низ.*/
SELECT * FROM PC
--INSERT INTO PRODUCT (model, maker, type) VALUES ('1100', 'C', 'PC')
--INSERT INTO PC (PC.model, PC.code, PC.cd, PC.hd, PC.price, PC.ram, PC.speed) VALUES ('1100', 12, '52x', 500, 299, 2048, 2400)
--DELETE FROM PC WHERE MODEL LIKE '1100'

/*Да се изтрият от таблицата Laptop всички лаптопи, направени от производител, който не
произвежда принтери. */
SELECT *
FROM LAPTOP
WHERE MODEL IN (
SELECT MODEL 
FROM PRODUCT 
WHERE MAKER NOT IN (SELECT MAKER FROM PRODUCT WHERE TYPE='PRINTER')  
) 

/* Производител А купува производител B. На всички продукти на В променете производителя да
бъде А.*/

/*update product 
set maker = 'J'
where product.maker like 'B'
*/

/*8. Да се намали наполовина цената на всеки компютър и да се добавят по 20 GB към всеки твърд
диск. */
/*select * from pc
update pc
set pc.price=pc.price/2,
	pc.hd=pc.hd+20;
select * from pc
*/

/*9. За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.
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
10. Два британски бойни кораба от класа Nelson - Nelson и Rodney - са били пуснати на вода
едновременно през 1927 г. Имали са девет 16-инчови оръдия (bore) и водоизместимост от 34000
тона (displacement). Добавете тези факти към базата от данни.
*/
SELECT * FROM CLASSES
SELECT * FROM SHIPS

--INSERT INTO CLASSES (CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT) VALUES ('Nelson', 'bb', 'Gt. Britain', 9, 16, 34000)
--INSERT INTO SHIPS (NAME, CLASS, LAUNCHED) VALUES ('Nelson', 'Nelson', 1927)
--INSERT INTO SHIPS (NAME, CLASS, LAUNCHED) VALUES ('Rodney', 'Nelson', 1927)

SELECT * FROM CLASSES
SELECT * FROM SHIPS

/*11. Изтрийте от таблицата Ships всички кораби, които са потънали в битка.
*/
--SELECT * -> DELETE
SELECT * FROM SHIPS WHERE SHIPS.NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT LIKE 'SUNK')

/*12. Променете данните в релацията Classes така, че калибърът (bore) да се измерва в сантиметри (в
момента е в инчове, 1 инч ~ 2.5 см) и водоизместимостта да се измерва в метрични тонове (1 м.т.
= 1.1 т.)
*/
SELECT * FROM CLASSES

UPDATE CLASSES
SET BORE=BORE*2.5,
DISPLACEMENT=DISPLACEMENT*1.1

SELECT * FROM CLASSES
	
