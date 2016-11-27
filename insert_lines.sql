insert into CLIENTS(NOCLI, NOMCLI)
values (37, ‘Ets LAROCHE’);

insert into ARTICLES
values ('AB03', 'Carpettes', 150, 2, 'IMPORT', 80);

insert into LIGCDES
values (&NumCde, 1, 'AB10', 2+6);

insert into CLIENTS(NOCLI, NOMCLI, ADRCLI, CODE_POSTAL, VILLE)
values (601, 'Albert', 'rue des Alpes', DEFAULT, DEFAULT);

create table CLI44(
nocli number(6));

insert into CLI44 
select NOCLI from CLIENTS where VILLE='NANTES';
