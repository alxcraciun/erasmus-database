-- Stim ca o marire de salariu se face la fiecare 12 luni de activitate.
-- Atunci, sa se afiseze numele angajatilor, organizatiile la care lucreaza, de cat timp lucreaza acolo si daca au mai mult de 6 luni pana la o marire de salariu
-- Daca exista 2 angajati al caror nume incepe cu aceeasi litera, se va afisa cel care s-a angajat cel mai recent la o companie si doar compania respectiva.
-- Daca un angajat lucreaza la mai mult de 2 companii, se va afisa doar cea la care s-a angajat cel mai recent.
-- (aici am îndeplinit cerințele 1 și 5)
select
    a.nume as "Nume_Angajat", 
    o.nume as "Nume_Organizatie", 
    to_char(l.data_angajare, 'YYYY-MON') as "Data_Angajare",
    CASE 
        WHEN 12 - mod(floor(months_between(sysdate, l.data_angajare)), 12) > 6 THEN 'Mai mult de 6 luni'
        WHEN 12 - mod(floor(months_between(sysdate, l.data_angajare)), 12) = 6 THEN 'Exact 6 luni'
        ELSE 'Mai putin de 6 luni'
    END as "Cat mai este pana la marire?",
    12 - mod(floor(months_between(sysdate, l.data_angajare)), 12) as luni_marire
from 
    angajati a
        join lucreaza l on a.cod_angajat = l.cod_angajat
        join organizatii o on l.cod_ong = o.cod_ong
WHERE 
    l.data_angajare = 
    (
        select max(data_angajare)
        from 
            lucreaza l2
            join angajati a2 on l2.cod_angajat = a2.cod_angajat
            join organizatii o2 ON l2.cod_ong = o2.cod_ong
        WHERE lower(substr(a2.nume, 1, 1)) = lower(substr(a.nume, 1, 1))
    )
order by a.nume;
    


-- Sa se afiseze numele, prenumele, tara si salariul angajatului ce are salariul maxim 
-- dintre toti angajatii ce lucreaza la organizatii din tarile ale caror agentii gestioneaza mai mult de o organizatie.
-- (aici am îndeplinit cerințele 2 și 3)
select distinct
    ang.nume || ' ' || ang.prenume as "Nume",
    t.nume as "Denumire Tara",
    ang.salariu
from 
    angajati ang 
        join lucreaza l on ang.cod_angajat = l.cod_angajat
        join organizatii o on o.cod_ong = l.cod_ong
        join agentii a on a.cod_agentie= o.cod_agentie
        join tari t on t.cod_tara = a.cod_tara,
    (
        select 
            t0.cod_tara as tara, 
            max(ang0.salariu) as maximul
        from 
        tari t0
            join agentii a0 on t0.cod_tara = a0.cod_tara
            join organizatii o0 on a0.cod_agentie = o0.cod_agentie
            join lucreaza l0 on o0.cod_ong = l0.cod_ong
            join angajati ang0 on ang0.cod_angajat = l0.cod_angajat
        group by t0.cod_tara
    ) salarii_maxime
where 
    t.cod_tara in  (
        select t2.cod_tara
        from tari t2
            join agentii a2 on t2.cod_tara = a2.cod_tara
            join organizatii o2 on a2.cod_agentie = o2.cod_agentie
        group by (t2.cod_tara, t2.cod_tara)
        having count(o2.cod_ong) > 1
    ) 
    and t.cod_tara = salarii_maxime.tara 
    and ang.salariu = salarii_maxime.maximul;



-- Afiseaza numele, linkul de infopack, data de incepere si data de finalizare a proiectelor.
-- Pentru proiectele ce nu au un info-pack disponibil se va afisa "indisponibil" campul respectiv.
-- Se va afisa o prima coloana care sa ne atentioneze data un proiect incepe sau nu anul acesta
-- Se vor ordona proiectele in ordinea datei de incepere a acestora
-- (aici am indeplinit cerinta 4)
select 
    decode(to_char(sysdate, 'MM'), to_char(data_incepere, 'MM'), 'Anul Acesta!!!', 'In curand...') as "Status", 
    nume,
    NVL(link_infopack, 'indisponibil') as "link_infopack",
    data_incepere,
    data_finalizare
from proiecte
order by data_incepere;




-- Datele angajatilor ce au salariul maxim dintr-o singura sursa de venit.
-- (aici am indeplinit cerinta 6)
with 
salariu_max as (
    select max(salariu)
    from angajati
)
select *
from angajati
where salariu = (select * from salariu_max);



-- Selecteaza toate datele angajatilor ce s-au angajat undeva in luna curenta a oricarui an
-- aici am scris a 5-a cerere
select a.*
from 
    angajati a
    join lucreaza l on a.cod_angajat = l.cod_angajat
where to_char(l.data_angajare, 'MM')= to_char(sysdate, 'MM');


select *
from angajati;

--------- CERINTA 13


-- Creste salariul angajatilor cu 25%
update angajati 
set salariu = salariu * 1.04;


-- Creste salariul angajatilor numiti 'ion' cu 25%
update angajati
set salariu = salariu * 1.25
where lower(prenume) like 'ion';


-- Sterge cazarile din locatiile cu codul mai mare decat 7
delete 
from cazare
where cod_locatie > 7;

select *
from cazare;


update organizatii
set data_inregistrare = '09-Dec-22'
where cod_agentie in (
    select cod_agentie
    from organizatii
    group by cod_agentie
    having count(cod_agentie) > 2
)


delete 
from cazare
where length(nume) = (
    select max(length(nume))
    from cazare
)


/*
    mi-am data seama cand scriam cererile ca ar fi fost 
    "mai logic" sa mut proprietatea salariu pe tabela lucreaza
    dar din moment ce nu mai aveam timp sa modific, presupunem
    ca acela va fi salariul total castigat din toate activitatile
*/