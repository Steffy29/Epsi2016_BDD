insert into CLIENTS(NOCLI, NOMCLI)
values (37, ‘Ets LAROCHE’);

insert into ARTICLES
values ('AB22', 'Tapis Persan', 1250.1, 2, 'IMPORT', 5);
insert into ARTICLES
values ('CD50', 'Chaine HiFi', 735.4, 2, 'IMPORT', 7);
insert into ARTICLES
values ('ZZZZ', 'Article bidon', null, null, 'DIVERS', 25);
insert into ARTICLES
values ('AA00', 'Cadeau', 0, null, 'DIVERS', 8);
insert into ARTICLES
values ('AB03', 'Carpettes', 150, 2, 'SOLDES', 116);
insert into ARTICLES
values ('AB', 'Tapis', null, 2, 'DIVERS', 2);
insert into ARTICLES
values ('ZZ01', 'Lot de tapis', 500, 2, 'DIVERS', 0);
insert into ARTICLES
values ('AB10', 'Tapis de Chine', 1500, 2, 'IMPORT', 10);

insert into LIGCDES
values (&NumCde, 1, 'AB10', 2+6);

insert into CLIENTS(NOCLI, NOMCLI, ADRCLI, CODE_POSTAL, VILLE)
values (601, 'Albert', 'rue des Alpes', DEFAULT, DEFAULT);

create table CLI44(
nocli number(6));

insert into CLI44 
select NOCLI from CLIENTS where VILLE='NANTES';

commit;
