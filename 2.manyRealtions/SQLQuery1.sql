USE pc
--2.1
SELECT PRODUCT.maker, laptop.speed
FROM PRODUCT, LAPTOP
WHERE HD >= 9 AND LAPTOP.model = product.model
--2.2
SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, LAPTOP
WHERE PRODUCT.MAKER LIKE 'B' AND PRODUCT.MODEL = LAPTOP.MODEL
UNION 
SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, pc
WHERE PRODUCT.MAKER LIKE 'B' AND PRODUCT.MODEL = PC.MODEL
UNION 
SELECT PRODUCT.MODEL, PRICE
FROM PRODUCT, PRINTER
WHERE PRODUCT.MAKER LIKE 'B' AND PRODUCT.MODEL = PRINTER.MODEL

--2.3
SELECT MAKER
FROM PRODUCT
WHERE PRODUCT.type LIKE 'laptop'
except
SELECT MAKER
FROM PRODUCT
WHERE PRODUCT.type LIKE 'pc'

--2.4
SELECT distinct a.HD
FROM PC a, pc b
where a.code != b.code AND a.hd = b.hd 

--2.5
select distinct a.model, b.model
from pc a, pc b
where a.ram = b.ram and a.speed = b.speed and a.code < b.code and a.model != b.model

--2.6
select distinct maker
from product, pc a, pc b
where a.speed >= 400 and b.speed > 400 and a.code != b.code and a.model = product.model and b.model = product.model

use ships
--3.1
select NAME 
from SHIPS, CLASSES
where CLASSES.DISPLACEMENT >= 50000 and CLASSES.CLASS = SHIPS.CLASS

--3.2
select distinct ships.name, DISPLACEMENT, numguns
from ships, classes, outcomes, BATTLES
where outcomes.BATTLE = 'Guadalcanal' and ships.name = OUTCOMES.SHIP and CLASSES.class = ships.CLASS

--3.3
SELECT A.COUNTRY 
FROM CLASSES A, CLASSES B
WHERE A.COUNTRY = B.COUNTRY AND A.TYPE = 'BC' AND B.TYPE = 'BB'

--3.4
SELECT O2.SHIP
FROM OUTCOMES O1, OUTCOMES O2, BATTLES B1, BATTLES B2
WHERE O1.BATTLE = B1.NAME AND O1.RESULT LIKE 'damaged' AND O2.BATTLE = B2.NAME  AND B1.DATE < B2.DATE AND O1.SHIP = O2.SHIP
