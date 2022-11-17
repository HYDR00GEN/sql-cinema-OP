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

/** 5 -  titolo film dello stesso regista di casablanca (sostituito con "Memento") **/

select titolo, regista
from film
where regista = (
    select regista
    from film
    where titolo like '%ement%'
)

/** 6 - titolo e genere proiettati  a natale 2004**/ 

select distinct titolo, genere
from proiezioni as p join film as f on p.codfilm = f.codfilm
where dataproiezione = '#2004-12-25#'

/** 7 -    titolo e genere proiettati a napoli a natale 2004 **/

select f.titolo, f.genere
from proiezioni as p 
    join film as f on p.codfilm = f.codfilm
    join sale as s on s.codsala = p.codsala
where s.citta like '%apol%' and dataproiezione = '#2004-12-25#'

/** 8 - nomi di sale di napoli nel giorno di natale 2004 proiettato film con R.Williams  **/

select s.nome as Nomi_sale
from proiezioni as p 
    join film as f on p.codfilm = f.codfilm
    join sale as s on s.codsala = p.codsala
    join recita as r on p.codfilm = r.codfilm
    join attori as a on a.codattore = r.codattore
where s.citta like '%apol%' and p.dataproiezione = '#2004-12-25#' and a.nome like '%illiams%'

/** 9 -  titoli film recita mastroianni oppure s.loren   **/

select distinct f.titolo
from recita as r 
    join film as f on r.codfilm = f.codfilm
    join attori as a on a.codattore = r.codattore
where a.nome like any (array['%astroiann%', '%oren%'])

/** 10 -  titolo film recita  mastroianni e loren**/

-- select distinct f.titolo
-- from recita as r 
--     join film as f on r.codfilm = f.codfilm
--     join attori as a on a.codattore = r.codattore
-- where a.nome like '%astroia%' and a.nome like '%ore%'

/** 11 -  per ogni film in cui recita attore FR (sost. in Americana), il titolo film ed attore  **/

select f.titolo, a.nome
from recita as r 
    join film as f on r.codfilm = f.codfilm
    join attori as a on a.codattore = r.codattore
where a.nazionalita like '%merican%'
group by f.titolo, a.nome

/** 12 -  per ogni film proiettato a pisa nel gen 2005 (sost. milano apr 2019). titolo film e nome sala**/

select f.titolo, s.nome as nome_sala
from proiezioni as p 
    join film as f on p.codfilm = f.codfilm
    join sale as s on s.codsala = p.codsala
where s.citta like '%ilan%' and p.dataproiezione >= '#2019-04-01#' and  p.dataproiezione < '#2019-05-01#'
group by f.titolo, s.nome

/** 13 -  nr sale di pisa con piu di 60 posti **/

select count(*) as Sale_con_piu_60posti
from sale as s
where posti > 60 and s.citta = 'Pisa'

/** 14 -- totale posti nelle sale di pisa **/

select sum(posti) as Tot_posti_in_Pisa
from sale as s
where s.citta = 'Pisa'

/** 15 --  per ogni citta il numero di sale  **/

select s.citta, count(codsala)
from sale as s
group by s.citta