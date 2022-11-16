/** 1 - tutte sale di pisa **/

select *
from sale
where citta = 'Pisa'

/** 2 - film fellini prodotti dolo il 1960 **/

select *
from film
where film.regista like '%Fellini%' and annoproduzione > 1960

/** 3 - titolo durata(non c'è) film fantascienza giapp o fr dopo il 1990**/

select titolo, genere, nazionalita, annoproduzione
from film
where (genere like '%antascienza%' and nazionalita = 'Giapponese') or (nazionalita = 'Francese' and annoproduzione > 1990)


/** 4 -  titolo film fantascienza giapp prod dopo il 1990 o franc  **/

select titolo, genere, annoproduzione, nazionalita
from film
where (genere like '%ommed%' and annoproduzione > 2016) or nazionalita like '%pagno%'

