create table ARTICLES(
REFART        char(4) primary key,
DESIGNATION   varchar2(30),
PRIXHT        number(8,2),
TAUXTVA       number(4,2)
PRIXTTC       number(8,2)
AS ( PRIXHT + round(PRIXHT * TAUXTVA/100,2) ),
CATEGORIE     char(10),
QTESTK        number(5)
);

create table CLIENTS(
NOCLI         number(4)
              constraint CLIENTS_PK primary key
              constraint CLIENTS_NOCLI_CK check (NOCLI>0),
NOMCLI        varchar2(30)
              constraint CLIENTS_NOMCLI_NN not null,
ADRCLI        varchar2(60),
CODE_POSTAL   number(5)
              constraint CLIENTS_CODE_POSTAL_CK
              check(CODE_POSTAL between 1000 and 99999),
VILLE         char(30)
);

create table COMMANDES(
NOCDE         number(6),
NOCLI         number(4),
DATECDE       date,
ETATCDE       char(2),
constraint PK_COMMANDES primary key (NOCDE),
constraint FK_COMMANDES_CLIENTS foreign key(NOCLI)
  references CLIENTS(NOCLI),
constraint CK_COMMANDES_ETAT check(ETATCDE in ('EC','LI','SO'))
);

create table LIGCDES(
NOCDE         number(6)
              constraint FK_LIGCDES_COMMANDES
              references COMMANDES(NOCDE),
NOLIG         number(2)
              constraint CK_LIGCDES_NOLIG check (NOLIG>0),
REFART        char(4)
              constraint FK_LIGCDES_ARTICLES
              references ARTICLES(REFART),
QTCDE         number(5),
constraint PK_LIGCDES primary key(NOCDE,NOLIG)
);

create table CATEGORIES(
NOCAT        number(3) generated as identity,
DESIGNATION  varchar2(30),
RESPONSABLE  varchar2(30) invisible
);

create table DEPOTS(CODE char(2) primary key, ADRESSE varchar2(60));

create table EMPLOYES(
  NUMERO number(3),
  NOM    varchar2(30),
  AGE      number(3),
  SALAIRE  number(10)
);
