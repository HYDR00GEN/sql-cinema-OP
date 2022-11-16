/** 1 - tutte sale di pisa **/

select *
from sale
where citta = 'Pisa'

/** 2 - film fellini prodotti dolo il 1960 **/

select *
from film
where film.regista like '%Fellini%' and annoproduzione > 1960
