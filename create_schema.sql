# Suppression des tables et des vues
drop view v_cdecli;
drop table ligcdes;
drop table commandes;
drop table clients;
drop table articles;

# création du schema
create schema authorization LIVRE
  create table clients(
    nocli number(4)
    constraint pk_clients primary key
    constraint ck_clients_nocli check (nocli>0),
    nomcli varchar2(30)
    constraint nn_clients_nomcli not null,
    adrcli varchar2(80),
    code_postal number(5)
    constraint ck_clients_code_postal check(code_postal between 1000 and 95999),
    ville char(30)
  )
  create table articles(
    nocde number(9),
    nocli number(4),
    datecde date,
    etatcde char(2),
    constraint pk_commandes primary key (nocde),
    constraint fk_commandes_clients foreing key(nocli) references clients(nocli),
    constraint ck_commandes_etat check (etatcde in ('EC','LI','SO'))
  )
  create table ligcdes(
    nocde number(6)
    constraint fk_ligcdes_commandes references commandes(nocde),
    nolig number(2)
    constraint ck_ligcdes_nolig check (nolig>0),
    refart char(4)
    constraint fk_ligcdes_articles reference articles(refart),
    qtecde number(5),
    constraint pk_ligcdes primary key(nocde,nolig)
  )
  create view v_cdecli (nocde,datecde,noclient,nomcli) as
    select nocde,datecde,commandes.nocli,nomcli
    from commandes,clients
    where commandes.nocli=clients.nocli
  grant select on article to public
;
