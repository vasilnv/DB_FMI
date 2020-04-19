use movies

SELECT MOVIESTAR.NAME
FROM MOVIESTAR
WHERE MOVIESTAR.GENDER LIKE 'F' AND MOVIESTAR.NAME IN (SELECT NAME FROM MOVIEEXEC WHERE NETWORTH > 10000000)

SELECT MOVIESTAR.NAME
FROM MOVIESTAR
WHERE MOVIESTAR.NAME NOT IN (SELECT NAME FROM MOVIEEXEC)

SELECT MOVIE.TITLE
FROM MOVIE
WHERE MOVIE.LENGTH > (SELECT MOVIE.LENGTH
						FROM MOVIE
						WHERE MOVIE.TITLE LIKE 'Star Wars')

SELECT MOVIEEXEC.NAME, MOVIE.TITLE
FROM MOVIE, MOVIEEXEC
WHERE MOVIE.PRODUCERC# = MOVIEEXEC.CERT# AND MOVIEEXEC.NETWORTH > (SELECT MOVIEEXEC.NETWORTH
																	FROM MOVIEEXEC 
																	WHERE MOVIEEXEC.NAME LIKE 'Merv Griffin')

USE pc
select distinct product.maker
from product, pc
where pc.model = product.model and pc.speed > 500

select printer.code, printer.model, printer.price
from printer
where printer.price >= all (select price
							from printer) 

select *
from laptop
where laptop.speed < all (select speed
							from pc)

select product.maker
from product
where product.type like 'printer' and product.model in (select printer.model 
														from printer 
														where printer.color = 'y' and printer.price <= all (select printer.price 
																											from printer 
																											where printer.color = 'y'))


select maker
from product p, (select pc.model, pc.speed, pc.ram from pc) t
where p.model = t.model and t.ram <= all (select ram from pc)
and t.speed >= all (select speed from pc where ram = t.ram)

use ships
SELECT DISTINCT COUNTRY
FROM CLASSES 
WHERE NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES)

SELECT DISTINCT CLASS
FROM SHIPS 
WHERE NAME IN (SELECT SHIP FROM OUTCOMES WHERE RESULT LIKE 'Sunk')

SELECT NAME, SHIPS.CLASS
FROM SHIPS , CLASSES
WHERE SHIPS.CLASS = CLASSES.CLASS AND CLASSES.BORE = 16

SELECT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME FROM SHIPS WHERE CLASS = 'Kongo')

SELECT SHIPS.CLASS, NAME
FROM SHIPS, (SELECT NUMGUNS, CLASS, BORE FROM CLASSES) T
WHERE T.CLASS = SHIPS.CLASS AND T.NUMGUNS >= ALL(SELECT NUMGUNS FROM CLASSES WHERE BORE = T.BORE)
ORDER BY SHIPS.CLASS

