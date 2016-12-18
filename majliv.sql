-- Livraison des commandes et mise à jour des stocks
-- Création de la table TEMOIN
create table TEMOIN(nocde number(6), text char(60));

-- Bloc PL/SQL de mise à jour
DECLARE
  cursor ccde is select c.nocde, refart, qtecde
    from ligcdes l, commandes c
    where c.nocde=l.nocde
      and c.etatcde='EC'
    order by c.nocde;
  vcde ccde%rowtype;
  vqtestk articles.qtestk%type;
  vnvqte vqtestk%type;
  vtexte temoin.texte%type;
  verr boolean;
  vcderef commandes.nocde%type;
BEGIN
  open ccde; -- Exécution du curseur
  fetch ccde into vcde; -- Lecture de la 1re ligne
  <<Bcde>>
  while ccde%found loop
    vcderef:=vcde.nocde; -- Début de la commande
    verr:=false;
    vtexte:='Problème sur article(s): ';
    commit;
    <<Blig>>
    while ccde%found and vcde.nocde=vcderef loop
      select qtestk into vqtestk
        from articles
        where refart=vcde.refart;
      vnvqte:=vqtestk-vcde.qtecde;
      if (vnvqte>=0) then --stock OK
        update articles set qtestk=vnvqte
          where refart=vcde.refart;
      else
        verr:=true;
        vtexte:=rtrim(vtexte)||rtrim(vcde.refart);
      end if;
      fetch ccde into vcde; -- lecture ligne suivante
    end loop Blig;
    if verr then
      rollback;
    else
      update commandes set etatcde='LI'
        where nocde=vcderef;
      vtexte:='Commande livre';
    end if;
    insert into temoin values (vcde.nocde,vtexte);
    commit;
  end loop Bcde;
  close ccde;
END;

/
-- consultation de la table témoin
select * from temoin;
drop table temoin;
