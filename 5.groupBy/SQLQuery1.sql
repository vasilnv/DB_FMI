USE PC
--1
SELECT AVG(SPEED) as avgSpeed
FROM PC

--2
select maker, avg(screen) as avgScreen 
from laptop join product on laptop.model = product.model
group by maker

--3
select avg(speed) as avgSpeed
from laptop
where laptop.price > 1000

--4
select maker, avg(price) as avgPrice
from pc join product on pc.model = product.model 
where maker like 'A'
group by maker

--5
select maker, avg(avgPrice)
from (select maker, pc.price as avgPrice
from pc join product on pc.model = product.model
where maker like 'B'
union all
select maker, laptop.price as avgPrice
from laptop join product on laptop.model = product.model
where product.maker like 'B'
) t1
group by maker

--6
select speed, avg(pc.price) as avgPrice
from pc
group by speed

--7
select maker
from product join pc on pc.model = product.model
group by maker
having count(distinct pc.code) >= 3

--8
select maker, max(pc.price) as price
from product join pc on pc.model = product.model
group by maker
having max(price) >= all(select max(price) as price
from product join pc on product.model = pc.model)

--9
select speed, avg(pc.price) as price
from pc
where speed >= 800
group by speed

--10
select t1.maker, hd 
from (
select maker, avg(hd) as hd
from product join pc on product.model = pc.model
group by maker
) t1 join (
select maker
from product join printer on product.model = printer.model
intersect
select maker
from product join pc on product.model = pc.model
) t2 on t1.maker = t2.maker

use ships
--1
SELECT COUNT(CLASSES.CLASS) AS CLASSES
FROM CLASSES
WHERE CLASSES.TYPE LIKE 'BB'

--2
SELECT CLASSES.CLASS , AVG(CLASSES.NUMGUNS)
FROM CLASSES
WHERE CLASSES.TYPE LIKE 'BB'
GROUP BY CLASS

--3
SELECT AVG(CLASSES.NUMGUNS) AVGGUNS
FROM CLASSES
WHERE CLASSES.TYPE LIKE 'BB'

--4
SELECT CLASSES.CLASS, MIN(SHIPS.LAUNCHED) AS FIRSTYEAR, MAX(SHIPS.LAUNCHED) AS LASTYEAR
FROM CLASSES JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
GROUP BY CLASSES.CLASS

--5
SELECT CLASS, COUNT(RESULT) AS RES
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT LIKE 'SUNK'
GROUP BY CLASS

--6
SELECT T1.CLASS, T1.RES
FROM (
SELECT CLASS, COUNT(RESULT) AS RES
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT LIKE 'SUNK'
GROUP BY CLASS
) T1 JOIN (
SELECT CLASS, COUNT(RESULT) AS RES
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
GROUP BY CLASS
HAVING COUNT(SHIP) >= 2
) T2 ON T1.CLASS = T2.CLASS

SELECT CLASS, COUNT(RESULT) AS RES
FROM SHIPS JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT LIKE 'SUNK'
GROUP BY CLASS
HAVING COUNT(RESULT) >= 2

SELECT COUNTRY, AVG(BORE) AS AVGBORE
FROM CLASSES
GROUP BY COUNTRY
