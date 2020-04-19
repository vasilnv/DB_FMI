use movies
--1
SELECT *
FROM MOVIEEXEC JOIN MOVIE ON MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
WHERE MOVIEEXEC.CERT# = (SELECT MOVIE.PRODUCERC# 
FROM MOVIE
WHERE MOVIE.TITLE LIKE 'STAR WARS')

/*--1--������!!!!
SELECT *
FROM MOVIEEXEC INNER JOIN MOVIE ON MOVIEEXEC.CERT# = (SELECT MOVIE.PRODUCERC# 
FROM MOVIE
WHERE MOVIE.TITLE LIKE 'STAR WARS')
*/
--2
SELECT DISTINCT MOVIEEXEC.NAME
FROM MOVIEEXEC JOIN MOVIE ON MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
JOIN STARSIN ON MOVIE.TITLE = STARSIN.MOVIETITLE
JOIN MOVIESTAR ON STARSIN.STARNAME = MOVIESTAR.NAME
WHERE MOVIESTAR.NAME LIKE 'HARRISON FORD'

--3
SELECT DISTINCT STUDIO.NAME, STARSIN.STARNAME
FROM STUDIO JOIN MOVIE ON STUDIO.NAME = MOVIE.STUDIONAME
JOIN STARSIN ON MOVIE.TITLE = STARSIN.MOVIETITLE
ORDER BY STUDIO.NAME

--4
SELECT STARSIN.STARNAME, MOVIEEXEC.NETWORTH, MOVIE.TITLE
FROM STARSIN JOIN MOVIE ON STARSIN.MOVIETITLE = MOVIE.TITLE
JOIN MOVIEEXEC ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
WHERE MOVIEEXEC.NETWORTH >= ALL(SELECT MOVIEEXEC.NETWORTH
FROM MOVIEEXEC)

--5
SELECT MOVIESTAR.NAME, STARSIN.MOVIETITLE
FROM MOVIESTAR LEFT JOIN STARSIN ON MOVIESTAR.NAME = STARSIN.STARNAME

use pc
--1
select product.maker, product.model, product.type
from product left join laptop on product.model = laptop.model
left join pc on product.model = pc.model
left join printer on product.model = printer.model
where printer.model is null and laptop.model is null and pc.model is null

--2
select distinct t1.maker
from (select product.maker
from product 
where type like 'Printer') t1 join (select product.maker
from product
where type like 'Laptop') t2 on t1.maker = t2.maker 

--3
select distinct l1.hd
from laptop l1 join laptop l2 on l1.hd = l2.hd 
where l1.model != l2.model

--4
select pc.model
from pc left join product on product.model = pc.model
where product.maker is null

use ships

--1
SELECT *
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS

--2
SELECT *
FROM SHIPS RIGHT JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
ORDER BY NAME

--3
SELECT CLASSES.COUNTRY, SHIPS.NAME
FROM CLASSES JOIN SHIPS ON SHIPS.CLASS = CLASSES.CLASS
LEFT JOIN OUTCOMES ON OUTCOMES.SHIP = SHIPS.NAME
WHERE BATTLE IS NULL

--4
SELECT SHIPS.NAME AS SHIPNAME
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE CLASSES.NUMGUNS >= 7 AND SHIPS.LAUNCHED = 1916

--5
SELECT SHIPS.NAME, BATTLES.NAME, BATTLES.DATE
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
JOIN BATTLES ON OUTCOMES.BATTLE = BATTLES.NAME
WHERE OUTCOMES.RESULT = 'sunk'
ORDER BY BATTLES.NAME

--6
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, SHIPS.LAUNCHED
FROM SHIPS JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME = SHIPS.CLASS

--7 
SELECT CLASSES.CLASS, CLASSES.TYPE, CLASSES.NUMGUNS, CLASSES.COUNTRY, CLASSES.BORE, CLASSES.DISPLACEMENT
FROM CLASSES LEFT JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
WHERE SHIPS.NAME IS NULL

--8
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS, OUTCOMES.RESULT
FROM CLASSES JOIN SHIPS ON SHIPS.CLASS = CLASSES.CLASS
JOIN OUTCOMES ON OUTCOMES.SHIP = SHIPS.NAME
WHERE OUTCOMES.BATTLE LIKE 'North Atlantic'