1. SELECT (idgry||' '||tytul) as gra 
FROM gra
where idgry < 3;

2. select nazwa
from developer
where nazwa like'____';

3.select tytul, platforma.nazwa, count from gra
join granaplatforme on gra.idgry=granaplatforme.gra_idgry
join developer on developer.iddev= granaplatforme.Developer_idDev
join platforma  on platforma.idPlatformy = granaplatforme.platforma_idplatformy
where developer.nazwa = 'DICE';

4. select imie, nazwisko 
from osobaspraw 
where ZespolSprawdzajacy_idZespolu = 2;

5. select kategoria_id_kategoria, kategoria.kategoria 
from osobaspraw
join kategoria on kategoria.id_kategoria = osobaspraw.kategoria_id_kategoria
where nazwisko = 'Alszer';

1. select imie, nazwisko 
from osobaspraw 
join kategoria on osobaspraw.kategoria_id_kategoria =  kategoria.id_kategoria 
where kategoria = 'PRZEMOC';

2. select tytul 
from gra
join werdykt on gra.idgry=werdykt.gra_idgry 
where idwerdykty = 2;

3.select nazwazespolu 
from zespolsprawdzajacy 
join osobaspraw on zespolsprawdzajacy.idzespolu = osobaspraw.ZespolSprawdzajacy_idZespolu 
where nazwisko = 'Todt';

4. select nazwazespolu, osobaspraw.nazwisko, osobaspraw.imie 
from zespolsprawdzajacy 
join osobaspraw on zespolsprawdzajacy.idzespolu = osobaspraw.ZespolSprawdzajacy_idZespolu 
order by nazwisko; 


5.select
u.tytul gra, n.nazwa platforma
from
Granaplatforme a
inner join gra u on u.idgry=a.gra_idgry  
inner join platforma n on n.idplatformy=a.platforma_idplatformy;


1. select nazwisko, count(nazwisko) 
from osobaspraw
group by nazwisko having count(nazwisko)>1;


2. select developer.nazwa, count(tytul) 
from developer
join granaplatforme on developer.iddev=granaplatforme.Developer_idDev
join gra on granaplatforme.gra_idgry=gra.idgry
group by developer.nazwa having count(tytul)>1;

3. select kategoria, count(kategoria) 
from kategoria
join osobaspraw on kategoria.id_kategoria=osobaspraw.kategoria_id_kategoria
group by kategoria;



