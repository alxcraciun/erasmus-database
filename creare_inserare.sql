-- CREAREA TABELELOR  -------------------------------------------

create table tari(
    cod_tara number(10) primary key,
    nume varchar2(50) not null
);

create table agentii(
    cod_agentie number(10) primary key,
    cod_tara references tari
);

create table organizatii(
    cod_ong number(10) primary key,
    nume varchar2(50) not null,
    cod_agentie references agentii,
    data_inregistrare date not null
);

create table angajati(
    cod_angajat number(10) primary key,
    nume varchar2(50) not null,
    prenume varchar2(50) not null,
    telefon varchar2(15) not null,
    salariu number(5) not null
);

create table locatii(
    cod_locatie number(10) primary key,
    nume varchar2(50) not null
);

create table proiecte(
    cod_proiect number(10) primary key,
    nume varchar2(50) not null,
    cod_locatie references locatii,
    link_infopack varchar2(100),
    data_incepere date not null,
    data_finalizare date not null
);


create table cazare(
    cod_cazare number(10) primary key,
    cod_locatie references locatii,
    nume varchar2(50) not null
);

create table banci(
    cod_banca number(10) primary key,
    nume varchar2(50) not null
);

create table conturi_bancare(
    cont_bancar varchar2(34) primary key,
    valuta varchar2(50) not null,
    cod_banca references banci
);

create table participanti(
    cod_participant number(10) primary key,
    nume varchar2(50) not null,
    prenume varchar2(50) not null,
    telefon varchar2(15) not null,
    data_nasterii date not null,
    cont_bancar references conturi_bancare
);

create table lucreaza(
    cod_angajat references angajati,
    cod_ong references organizatii,
    data_angajare date not null,
    primary key(cod_angajat, cod_ong)
);

create table organizeaza(
    cod_ong references organizatii,
    cod_proiect references proiecte,
    tip_organizare varchar2(15) not null,
    primary key(cod_ong, cod_proiect)
);

create table inscriere(
    cod_proiect references proiecte,
    cod_participant references participanti,
    tip_inscriere varchar2(50) default 'participant',
    data_trimitere date default sysdate,
    link_aplicatie varchar2(50),
    primary key(cod_proiect, cod_participant)
);

create table se_afla(
    cod_locatie references locatii,
    cod_proiect references proiecte,
    primary key(cod_locatie, cod_proiect)
);


-- CREARE SEQUENCE PENTRU TABELA TARI -------------------------------------------
CREATE SEQUENCE seq_tari
INCREMENT BY 1
START WITH 1;


-- INSERARE IN TABELA "tari" -------------------------------------------
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Romania');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Franta');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Germania');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Spania');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Italia');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Marea Britanie');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Turcia');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Olanda');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Norvegia');
INSERT INTO tari (cod_tara, nume) VALUES (seq_tari.nextval, 'Portugalia');
commit;
select * from tari;


-- INSERARE IN TABELA "agentii" -------------------------------------------
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (1, 1);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (2, 2);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (3, 3);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (4, 4);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (5, 5);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (6, 6);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (7, 7);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (8, 8);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (9, 9);
INSERT INTO agentii (cod_agentie, cod_tara) VALUES (10, 10);
commit;
select * from agentii;


-- INSERARE IN TABELA "organizatii" -------------------------------------------
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (1, 'GEYC', 1, TO_DATE('2022-01-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (2, 'Consiliul Tineretului', 1, TO_DATE('2022-02-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (3, 'Tinerii de Maine Craiova', 1, TO_DATE('2022-03-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (4, 'Fundatia Comunitara Galati', 1, TO_DATE('2022-04-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (5, 'Academia lui Ed Galati', 1, TO_DATE('2022-05-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (6, 'Youth Programs Paris', 2, TO_DATE('2022-06-02', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (7, 'Youth Academy Berlin', 3, TO_DATE('2022-06-03', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (8, 'Youth Programs Madrid', 4, TO_DATE('2022-06-04', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (9, 'Youth Programs Napoli', 5, TO_DATE('2022-06-05', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (10, 'Youth Programs London', 6, TO_DATE('2022-06-06', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (11, 'EuroActive Turkey', 7, TO_DATE('2022-07-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (12, 'Global Shapers Izmir', 7, TO_DATE('2022-07-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (13, 'Young Power Holland', 8, TO_DATE('2022-08-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (14, 'Youth Programs Copenhagen', 9, TO_DATE('2022-09-01', 'YYYY-MM-DD'));
INSERT INTO organizatii (cod_ong, nume, cod_agentie, data_inregistrare) VALUES (15, 'Youth Academy Lisbon', 10, TO_DATE('2022-10-01', 'YYYY-MM-DD'));
commit;
select * from organizatii;


-- INSERARE IN TABELA "angajati" -------------------------------------------
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (101, 'Popescu', 'Ion', '0721123456', 5000);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (102, 'Ionescu', 'Maria', '0732111111', 4500);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (103, 'Constantin', 'Ana', '0723344556', 4800);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (104, 'Radu', 'Mihai', '0744223344', 5200);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (105, 'Dumitrescu', 'Elena', '0711222333', 5100);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (106, 'Stan', 'Andrei', '0722333444', 4900);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (107, 'Popa', 'Ioana', '0744555666', 5300);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (108, 'Munteanu', 'Alex', '0733444555', 4700);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (109, 'Dobre', 'Cristina', '0711112233', 5100);
INSERT INTO angajati (cod_angajat, nume, prenume, telefon, salariu) VALUES (110, 'Vasilescu', 'Dan', '0733222111', 4900);
commit;
select * from angajati;


-- INSERARE IN TABELA "locatii" -------------------------------------------
INSERT INTO locatii (cod_locatie, nume) VALUES (1, 'Galati');
INSERT INTO locatii (cod_locatie, nume) VALUES (2, 'Bucuresti');
INSERT INTO locatii (cod_locatie, nume) VALUES (3, 'Berlin');
INSERT INTO locatii (cod_locatie, nume) VALUES (4, 'Madrid');
INSERT INTO locatii (cod_locatie, nume) VALUES (5, 'Alicante');
INSERT INTO locatii (cod_locatie, nume) VALUES (6, 'Barcelona');
INSERT INTO locatii (cod_locatie, nume) VALUES (7, 'Izmir');
INSERT INTO locatii (cod_locatie, nume) VALUES (8, 'Grudziadz');
INSERT INTO locatii (cod_locatie, nume) VALUES (9, 'Porto');
INSERT INTO locatii (cod_locatie, nume) VALUES (10, 'Lisabona');
commit;
select * from locatii;


-- INSERARE IN TABELA "proiecte" -------------------------------------------
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (471, 'Youths in Action', 1, 'www.proiect1.ro', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (472, 'Violence to the Bench', 2, 'www.proiect2.ro', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2023-04-26', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (473, 'IntreVecini', 3, 'www.proiect3.ro', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-05-14', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (474, 'Young Leaders', 4, 'www.proiect4.ro', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-13', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (901, 'Climate Change for Real', 5, 'www.proiect5.ro', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2023-07-25', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (902, 'Youth 4 Impact', 6, 'www.proiect6.ro', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-25', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (903, 'Global Classroom', 7, 'www.proiect7.ro', TO_DATE('2023-09-01', 'YYYY-MM-DD'), TO_DATE('2023-09-27', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (904, 'Heading for the Future', 8, 'www.proiect8.ro', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2023-10-02', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (905, 'Future of Work in Agriculture', 9, 'www.proiect9.ro', TO_DATE('2023-11-01', 'YYYY-MM-DD'), TO_DATE('2023-11-23', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, link_infopack, data_incepere, data_finalizare) VALUES (906, 'Youth Traning Programme', 10, 'www.proiect10.ro', TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-13', 'YYYY-MM-DD'));
INSERT INTO proiecte (cod_proiect, nume, cod_locatie, data_incepere, data_finalizare) VALUES (907, 'Global Youth Summit', 10, TO_DATE('2025-01-23', 'YYYY-MM-DD'), TO_DATE('2025-01-26', 'YYYY-MM-DD'));
commit;
select * from proiecte;


-- INSERARE IN TABELA "cazare" -------------------------------------------
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (1, 1, 'Pensiunea Galati');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (2, 2, 'Hotel Bucuresti');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (3, 3, 'Hotel Berlin');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (4, 4, 'Hotel Madrid');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (5, 5, 'Hotel Alicante');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (6, 6, 'Hotel Barcelona');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (7, 7, 'Hotel Izmir');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (8, 8, 'Hotel Grudziadz');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (9, 9, 'Hotel Porto');
INSERT INTO cazare (cod_cazare, cod_locatie, nume) VALUES (10, 10, 'Hotel Lisabona');
commit;
select * from cazare;


-- INSERARE IN TABELA "banci" -------------------------------------------
INSERT INTO banci (cod_banca, nume) VALUES (1, 'Banca Transilvania');
INSERT INTO banci (cod_banca, nume) VALUES (2, 'BRD - Groupe Societe Generale');
INSERT INTO banci (cod_banca, nume) VALUES (3, 'Raiffeisen Bank');
INSERT INTO banci (cod_banca, nume) VALUES (4, 'BCR - Banca Comerciala Romana');
INSERT INTO banci (cod_banca, nume) VALUES (5, 'ING Bank Romania');
INSERT INTO banci (cod_banca, nume) VALUES (6, 'UniCredit Bank');
INSERT INTO banci (cod_banca, nume) VALUES (7, 'CEC Bank');
INSERT INTO banci (cod_banca, nume) VALUES (8, 'Alpha Bank Romania');
INSERT INTO banci (cod_banca, nume) VALUES (9, 'OTP Bank Romania');
INSERT INTO banci (cod_banca, nume) VALUES (10, 'Libra Internet Bank');
commit;
select * from banci;


-- INSERARE IN TABELA "conturi_bancare" -------------------------------------------
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO1234567890123456789012', 'RON', 1);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO2345678901234567890123', 'EUR', 2);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO3456789012345678901234', 'USD', 3);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO4567890123456789012345', 'RON', 4);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO5678901234567890123456', 'EUR', 5);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO6789012345678901234567', 'USD', 6);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO7890123456789012345678', 'RON', 7);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO8901234567890123456789', 'EUR', 8);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO9012345678901234567890', 'USD', 9);
INSERT INTO conturi_bancare (cont_bancar, valuta, cod_banca) VALUES ('RO0123456789012345678901', 'RON', 10);
commit;
select * from conturi_bancare;


-- INSERARE IN TABELA "participanti" -------------------------------------------
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (1, 'Popescu', 'Ion', '0721123456', TO_DATE('1985-03-15', 'YYYY-MM-DD'), 'RO1234567890123456789012');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (2, 'Ionescu', 'Maria', '0732111111', TO_DATE('1991-08-27', 'YYYY-MM-DD'), 'RO2345678901234567890123');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (3, 'Constantin', 'Ana', '0723344556', TO_DATE('1989-06-10', 'YYYY-MM-DD'), 'RO3456789012345678901234');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (4, 'Radu', 'Mihai', '0744223344', TO_DATE('1993-12-03', 'YYYY-MM-DD'), 'RO4567890123456789012345');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (5, 'Dumitrescu', 'Elena', '0711222333', TO_DATE('1990-02-18', 'YYYY-MM-DD'), 'RO5678901234567890123456');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (6, 'Stan', 'Andrei', '0722333444', TO_DATE('1987-11-29', 'YYYY-MM-DD'), 'RO6789012345678901234567');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (7, 'Munteanu', 'Cristina', '0733444555', TO_DATE('1992-04-07', 'YYYY-MM-DD'), 'RO7890123456789012345678');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (8, 'Gheorghe', 'Andreea', '0724555666', TO_DATE('1988-09-21', 'YYYY-MM-DD'), 'RO8901234567890123456789');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (9, 'Voinea', 'Adrian', '0735666777', TO_DATE('1995-07-12', 'YYYY-MM-DD'), 'RO9012345678901234567890');
INSERT INTO participanti (cod_participant, nume, prenume, telefon, data_nasterii, cont_bancar) VALUES (10, 'Stoica', 'Alexandra', '0726777888', TO_DATE('1994-10-06', 'YYYY-MM-DD'), 'RO0123456789012345678901');
commit;
select * from participanti;


-- INSERARE IN TABELA "lucreaza" -------------------------------------------
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (101, 1, TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (102, 2, TO_DATE('2022-02-27', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (103, 3, TO_DATE('2022-03-10', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (104, 4, TO_DATE('2022-04-03', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (105, 5, TO_DATE('2022-05-18', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (106, 6, TO_DATE('2022-06-29', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (107, 7, TO_DATE('2022-07-07', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (108, 8, TO_DATE('2022-08-21', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (109, 9, TO_DATE('2022-09-12', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (110, 10, TO_DATE('2022-10-06', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (110, 11, TO_DATE('2022-10-09', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (110, 12, TO_DATE('2022-11-10', 'YYYY-MM-DD'));
INSERT INTO lucreaza (cod_angajat, cod_ong, data_angajare) VALUES (110, 13, TO_DATE('2022-12-11', 'YYYY-MM-DD'));
commit;
select * from lucreaza;


-- INSERARE IN TABELA "organizeaza" -------------------------------------------
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (1, 471, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (2, 472, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (3, 473, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (4, 474, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (5, 901, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (6, 902, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (7, 903, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (8, 904, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (9, 905, 'organizator');
INSERT INTO organizeaza (cod_ong, cod_proiect, tip_organizare) VALUES (10, 906, 'organizator');
commit;
select * from organizeaza;


-- INSERARE IN TABELA "inscriere" -------------------------------------------
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (471, 1, 'participant', TO_DATE('2023-01-18', 'YYYY-MM-DD'), 'www.link1.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (472, 2, 'participant', TO_DATE('2023-02-27', 'YYYY-MM-DD'), 'www.link2.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (473, 3, 'participant', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'www.link3.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (474, 4, 'participant', TO_DATE('2023-04-03', 'YYYY-MM-DD'), 'www.link4.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (901, 5, 'participant', TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'www.link5.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (902, 6, 'participant', TO_DATE('2023-06-29', 'YYYY-MM-DD'), 'www.link6.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (903, 7, 'participant', TO_DATE('2023-07-07', 'YYYY-MM-DD'), 'www.link7.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (904, 8, 'participant', TO_DATE('2023-08-21', 'YYYY-MM-DD'), 'www.link8.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (905, 9, 'participant', TO_DATE('2023-09-12', 'YYYY-MM-DD'), 'www.link9.ro');
INSERT INTO inscriere (cod_proiect, cod_participant, tip_inscriere, data_trimitere, link_aplicatie) VALUES (906, 10, 'participant', TO_DATE('2023-10-06', 'YYYY-MM-DD'), 'www.link10.ro');
commit;
select * from inscriere;


-- INSERARE IN TABELA "se_afla" -------------------------------------------
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (1, 471);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (2, 472);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (3, 473);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (4, 474);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (5, 901);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (6, 902);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (7, 903);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (8, 904);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (9, 905);
INSERT INTO se_afla (cod_locatie, cod_proiect) VALUES (10, 906);
commit;
select * from se_afla;

create table lucreaza2(
    cod_ong references organizatii,
    cod_angajat references angajati,
    data_angajarii date,
    primary key(cod_ong, cod_angajat)
);

select *
from lucreaza2;

drop table lucreaza2;

insert into lucreaza2 (cod_ong, cod_angajat) VALUES (1, 101);

select * from organizatii;
select * from angajati;

