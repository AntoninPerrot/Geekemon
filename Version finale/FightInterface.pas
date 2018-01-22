unit FightInterface;

interface
  procedure habillageCombat;
  procedure affichageRencontre;
  procedure FightDisplay;
  procedure attaque;
  procedure defense;
  procedure Geekeball;
  procedure potionCombat;
  procedure riposte;
  procedure selection;
  procedure addG;
  procedure critStrike(n:integer);


implementation
uses
  Windows, Fonctions, randomi, Donnees, fichePerso, salleETDDG, FonctionsDeplacementAvancee;

var
  choix, choixSelection                     : String;
  conditionSortie1                          : Boolean = FALSE;
  conditionSortie2                          : Boolean = FALSE;
  probaGeekeball,
  compteur,           compteur2             : Integer;
  nomGAdversaire,     nomGeekemon,
  elementGAdversaire, elementGeekemon,
  attackGAdversaire,  attackGeekemon        : String;
  hpGAdversaire,      hpGeekemon,
  hpInitiauxADV,      hpInitiauxGeekemon,
  shieldGAdversaire,  shieldGeekemon,
  degatsGAdversaire,  degatsGeekemon,
  degatsTemp                                : Integer;
  GC : Integer;
  crits : boolean;
  degatsCombat : Integer;
const
  SORTIE                                    : Boolean = TRUE;


  procedure habillageCombat;
  begin
    cls;
    writeln(' ----------------------------------------------------------------------------------------------------------------------');
    writeln(' - - - - - - - - - - - - - - - - - - - - - -  Combat avec un Geekemon sauvage - - - - - - - - - - - - - - - - - - - - -');
    writeln(' ----------------------------------------------------------------------------------------------------------------------');
    writeln;
  end;

procedure affichageRencontre;
begin
  conditionSortie1                          := FALSE;
  conditionSortie2                          := FALSE;

 while ((choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4')) do
  begin
  habillageCombat;
  writeln('Quel Geekemon choisissez vous ?');
  if (GPossede1 <> p0) then ecrireDecalle2('1 - ', GPossede1.nomGeekemon);
  if (GPossede2 <> p0) then ecrireDecalle2('2 - ', GPossede2.nomGeekemon);
  if (GPossede3 <> p0) then ecrireDecalle2('3 - ', GPossede3.nomGeekemon);
  if (GPossede4 <> p0) then ecrireDecalle2('4 - ', GPossede4.nomGeekemon);
  choix := lireDecalle;
  if (choix='1') then
  begin
    if GPossede1.hpGeekemon<=0 then
    begin
      habillageCombat;
      writeln(GPossede1.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre;
    end
    else
    begin
    GActif := GPossede1;
    GC :=1;
    end;
  end;
  if (choix='2') then
 begin
    if GPossede2.hpGeekemon<=0 then
    begin
      habillageCombat;
      writeln(GPossede2.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre;
    end
    else
    begin
    GActif := GPossede2;
    GC :=2;
    end;
  end;
  if (choix='3') then
begin
    if GPossede3.hpGeekemon<=0 then
    begin
      habillageCombat;
      writeln(GPossede3.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre;
    end
    else
    begin
    GActif := GPossede3;
    GC :=3;
    end;
  end;
  if (choix='4') then
  begin
    if GPossede4.hpGeekemon<=0 then
    begin
      habillageCombat;
      writeln(GPossede4.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre;
    end
    else
    begin
    GActif := GPossede4;
    GC :=4;
    end;
  end;
 end;

  Rencontre;
  nomGeekemon := GActif.nomGeekemon;
  attackGeekemon := GActif.nomAttackGeekemon;
  hpGeekemon := GActif.hpGeekemon;
  hpInitiauxGeekemon := GActif.hpMaxGeekemon;
  degatsGeekemon := GActif.degatsGeekemon;

  nomGAdversaire := GAdversaire.nomGeekemon;
  attackGAdversaire := GAdversaire.nomAttackGeekemon;
  hpInitiauxADV := GAdversaire.hpMaxGeekemon;
  hpGAdversaire := GAdversaire.hpMaxGeekemon;
  degatsGAdversaire := GAdversaire.degatsGeekemon;


  write('Le Geekemon sauvage : ');
  write(nomGAdversaire);
  writeln(' se prépare au combat. ');
  writeln;
  write('Votre Geekemon : ');
  write(nomGeekemon);
  writeln(' se prépare au combat. ');
  FightDisplay;
end;

procedure FightDisplay;
begin
  while conditionSortie1 = FALSE do
  begin
    cls;
    habillageCombat;
    writeln;
    writeln(nomGeekemon, ' : ', hpGeekemon, 'PV, ', degatsGeekemon, ' Dégats d''attaque ', '(Bouclier de ', shieldGeekemon, ')');
    writeln;
    writeln(nomGAdversaire, ' : ', hpGAdversaire, 'PV, ', degatsGAdversaire, ' Dégats d''attaque ', '(Bouclier de ', shieldGAdversaire, ')');
    writeln;
    write('C''est à ');
    write(nomGeekemon);
    writeln(' d''agir, que souhaitez vous faire ?');
    writeln;
    ecrireDecalle('1 - Attaquer');
    ecrireDecalle('2 - Défendre');
    ecrireDecalle('3 - Lancer une Geekeball');
    writeln('           4 - Utiliser une potion (',pers.potionPerso,' potions restantes)');
    ecrireDecalle('5 - Selectionner un autre Geekemon');
    ecrireDecalle('6 - Fuire le combat');
    writeln;
    choix := lireDecalle;
    if choix = '1' then attaque;
    if choix = '2' then defense;
    if choix = '3' then Geekeball;
    if choix = '4' then potionCombat;
    if choix = '5' then selection;
    if choix = '6' then conditionSortie1 := SORTIE;
  end;
  if (GC =1) then
  begin
  GPossede1.nomGeekemon:=nomGeekemon;
  GPossede1.nomAttackGeekemon:=attackGeekemon;
  GPossede1.hpGeekemon:=hpGeekemon;
  GPossede1.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede1.degatsGeekemon:=degatsGeekemon;
  end;

  if (GC =2) then
  begin
  GPossede2.nomGeekemon:=nomGeekemon;
  GPossede2.nomAttackGeekemon:=attackGeekemon;
  GPossede2.hpGeekemon:=hpGeekemon;
  GPossede2.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede2.degatsGeekemon:=degatsGeekemon;
  end;
  if (GC =3) then
  begin
  GPossede3.nomGeekemon:=nomGeekemon;
  GPossede3.nomAttackGeekemon:=attackGeekemon;
  GPossede3.hpGeekemon:=hpGeekemon;
  GPossede3.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede3.degatsGeekemon:=degatsGeekemon;
  end;
  if (GC =4) then
  begin
  GPossede4.nomGeekemon:=nomGeekemon;
  GPossede4.nomAttackGeekemon:=attackGeekemon;
  GPossede4.hpGeekemon:=hpGeekemon;
  GPossede4.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede4.degatsGeekemon:=degatsGeekemon;
  end;
  cls;
  déplacement;
end;

procedure attaque;
begin
  cls;
  crits:=false;
  critStrike(degatsGeekemon);
  hpGAdversaire := hpGAdversaire - degatsCombat;
  habillageCombat;
  writeln(nomGeekemon, ' utilise ', attackGeekemon, ' !');
  if (crits = true)then writeln('COUP CRITIQUE !');
  writeln(nomGAdversaire, ' perd ', degatsCombat, ' PV !');
  writeln;
  if (hpGeekemon <= 0) OR (hpGAdversaire <= 0) then
  begin
    writeln('Le ', nomGadversaire, ' adverse est K.O. !');
    sleep(500);
    conditionSortie1 := SORTIE;
  end
  else
  begin
    riposte;
    FightDisplay;
  end;
end;

procedure defense;
begin
  cls;
  shieldGeekemon := 20;
  habillageCombat;
  writeln('Votre Geekemon se protège : +', shieldGeekemon, ' de bouclier !');
  writeln;
  sleep(1000);
  riposte;
  FightDisplay;
end;

procedure Geekeball;
begin
  habillageCombat;
  for compteur2 := 1 to 3 do
  begin
    habillageCombat;
    sleep(400);
    for compteur := 1 to 3 do
    begin
      write('.');
      sleep(400);
    end;

    writeln;
  end;
  if (hpGAdversaire>hpInitiauxADV/2) then
  begin
  randomize;
  ProbaGeekeball := random(4);
  end
  else
  if (hpGAdversaire<=hpInitiauxADV/2) AND (hpGAdversaire>hpInitiauxADV/4)  then
  begin
  randomize;
  ProbaGeekeball := random(2);
  end
  else
if (hpGAdversaire<=hpInitiauxADV/4)then ProbaGeekeball:= 0;
  if ProbaGeekeball<>0 then
  begin
    writeln('Echec !');
    riposte;
  end
  else
  begin
    writeln('Le Geekemon a été capturé !');
    readln;
    addG;
    sleep(500);
    conditionSortie1 := SORTIE;
  end;
  readln;
end;


procedure potionCombat;
var
n:Integer;
begin
  if pers.potionPerso>0 then
  begin
  n:=-1;
  potion(n);
  hpGeekemon := hpGeekemon + 50;
  if hpGeekemon > hpInitiauxGeekemon then
    begin
      habillageCombat;
      writeln(GActif.nomGeekemon,' regagne ',50-(hpGeekemon-hpInitiauxGeekemon),' PV.');
      hpGeekemon := hpInitiauxGeekemon;
      readln;
    end
  else
    begin
      habillageCombat;
      writeln(GActif.nomGeekemon,' regagne ',50,' PV.');
      readln;
    end;
  end
  else
  begin
  habillageCombat;
  writeln('Vous cherchez en vain une potion. Pendant ce temps ',GAdversaire.nomGeekemon,' en profite pour attaquer.');
  readln;
  end;
  habillageCombat;
  riposte;
end;

procedure riposte;
begin
  Sleep(500);
  //readln;
  crits:=false;
  critStrike(degatsGAdversaire);
  writeln(nomGAdversaire, ' utilise ', attackGAdversaire, ' !');
  Sleep(500);
  if (crits = true)then writeln('COUP CRITIQUE !');
  writeln(nomGeekemon, ' perd ', degatsCombat, ' PV !');
  degatsTemp := degatsCombat - shieldGeekemon;
  if (degatsTemp <= 0) then degatsTemp := 0;
  hpGeekemon := hpGeekemon - degatsTemp;
  shieldGeekemon := 0;
  readln;
  if (hpGeekemon <= 0) then
  begin
    writeln('Votre ', nomGeekemon, ' est K.O. !');
    sleep(500);
    selection;
  end;
end;

procedure selection;
begin
  if (GC =1) then
  begin
  GPossede1.nomGeekemon:=nomGeekemon;
  GPossede1.nomAttackGeekemon:=attackGeekemon;
  GPossede1.hpGeekemon:=hpGeekemon;
  GPossede1.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede1.degatsGeekemon:=degatsGeekemon;
  end;

  if (GC =2) then
  begin
  GPossede2.nomGeekemon:=nomGeekemon;
  GPossede2.nomAttackGeekemon:=attackGeekemon;
  GPossede2.hpGeekemon:=hpGeekemon;
  GPossede2.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede2.degatsGeekemon:=degatsGeekemon;
  end;
  if (GC =3) then
  begin
  GPossede3.nomGeekemon:=nomGeekemon;
  GPossede3.nomAttackGeekemon:=attackGeekemon;
  GPossede3.hpGeekemon:=hpGeekemon;
  GPossede3.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede3.degatsGeekemon:=degatsGeekemon;
  end;
  if (GC =4) then
  begin
  GPossede4.nomGeekemon:=nomGeekemon;
  GPossede4.nomAttackGeekemon:=attackGeekemon;
  GPossede4.hpGeekemon:=hpGeekemon;
  GPossede4.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede4.degatsGeekemon:=degatsGeekemon;
  end;
if (GPossede1.hpGeekemon<=0) and (GPossede2.hpGeekemon<=0) and (GPossede3.hpGeekemon<=0) and (GPossede4.hpGeekemon<=0) then
begin
  habillageCombat;
  writeln('Plus de Geekemon disponible !');
  writeln;
  writeln('Vous courez vers la salle ETDDG pour faire soigner vos Geekemon');
  readln;
  soinForcé;
end;
  habillageCombat;
  ecrireDecalle('Souhaitez vous selectioner un autre Geekemon ?');
  ecrireDecalle('1 - Oui');
  ecrireDecalle('2 - Non (ouais, pas très inventif.)');
  choixSelection := lireDecalle;
  if choixSelection = '2' then conditionSortie1 := SORTIE
  else
  begin
    habillageCombat;
    writeln('Quel Geekemon choisissez vous ?');
    ecrireDecalle2('1 - ', GPossede1.nomGeekemon);
    ecrireDecalle2('2 - ', GPossede2.nomGeekemon);
    ecrireDecalle2('3 - ', GPossede3.nomGeekemon);
    ecrireDecalle2('4 - ', GPossede4.nomGeekemon);
    choix := lireDecalle;
    while(conditionSortie2 = FALSE) do
    begin
      if (choix='1') then
      begin
        if (GPossede1.hpGeekemon > 0) then
        begin
          GActif := GPossede1;
          GC:=1;
          nomGeekemon := GActif.nomGeekemon;
          attackGeekemon := GActif.nomAttackGeekemon;
          hpGeekemon := GActif.hpGeekemon;
          hpInitiauxGeekemon := GActif.hpMaxGeekemon;
          degatsGeekemon := GActif.degatsGeekemon;
          FightDisplay;
        end
        else
        begin
          writeln('Ce Geekemon est K.O. ! Choisissez en un autre : ');
          readln;
          selection;
        end;
      end;

      if (choix='2') then
      begin
        if (GPossede2.hpGeekemon > 0) then
        begin
          GActif := GPossede2;
          GC:=2;
          nomGeekemon := GActif.nomGeekemon;
          attackGeekemon := GActif.nomAttackGeekemon;
          hpGeekemon := GActif.hpGeekemon;
          hpInitiauxGeekemon := GActif.hpMaxGeekemon;
          degatsGeekemon := GActif.degatsGeekemon;
          FightDisplay;
        end
        else
        begin
          writeln('Ce Geekemon est K.O. ! Choisissez en un autre : ');
          readln;
          selection;
        end;
      end;
      if (choix='3') then
      begin
        if (GPossede3.hpGeekemon > 0) then
        begin
          GActif := GPossede3;
          GC:=3;
          nomGeekemon := GActif.nomGeekemon;
          attackGeekemon := GActif.nomAttackGeekemon;
          hpGeekemon := GActif.hpGeekemon;
          hpInitiauxGeekemon := GActif.hpMaxGeekemon;
          degatsGeekemon := GActif.degatsGeekemon;
          FightDisplay;
        end
        else
        begin
          writeln('Ce Geekemon est K.O. ! Choisissez en un autre : ');
          readln;
          selection;
        end;
      end;
      if (choix='4') then
      begin
        if (GPossede4.hpGeekemon > 0) then
        begin
          GActif := GPossede4;
          GC:=4;
          nomGeekemon := GActif.nomGeekemon;
          attackGeekemon := GActif.nomAttackGeekemon;
          hpGeekemon := GActif.hpGeekemon;
          hpInitiauxGeekemon := GActif.hpMaxGeekemon;
          degatsGeekemon := GActif.degatsGeekemon;
          FightDisplay;
        end
        else
        begin
          writeln('Ce Geekemon est K.O. ! Choisissez en un autre : ');
          readln;
          selection;
        end;
      end;
    end;
  end;
end;

procedure addG;
begin
  if (GPossede1.nomGeekemon = p0.nomGeekemon) then GPossede1 := GAdversaire
  else
  if (GPossede2.nomGeekemon = p0.nomGeekemon) then GPossede2 := GAdversaire
  else
  if (GPossede3.nomGeekemon = p0.nomGeekemon) then GPossede3 := GAdversaire
  else
  if (GPossede4.nomGeekemon = p0.nomGeekemon) then GPossede4 := GAdversaire
  else
  if (GPossede4.nomGeekemon <> p0.nomGeekemon) then
  begin
    habillageCombat;
    if (GPC1 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC1 := GAdversaire
    end
    else
    if (GPC2 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC2 := GAdversaire
    end
    else
    if (GPC3 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC3 := GAdversaire
    end
    else
    if (GPC4 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC4 := GAdversaire
    end
    else
    if (GPC5 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC5 := GAdversaire
    end
    else
    if (GPC6 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC6 := GAdversaire
    end
    else
    if (GPC7 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC7 := GAdversaire
    end
    else
    if (GPC8 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC8 := GAdversaire
    end
    else
    if (GPC9 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC9 := GAdversaire
    end
    else
    if (GPC10 = p0) then
    begin
      writeln('Geekemon envoyé au PC !');
      GPC10 := GAdversaire
    end
    else
    if (GPC10 <> p0) then
    begin
      writeln('Quel Geekemon voulez-vous remplacer ?');
      if (GPossede1 <> p0) then writeln('1 - ', GPossede1.nomGeekemon);
      if (GPossede2 <> p0) then writeln('2 - ', GPossede2.nomGeekemon);
      if (GPossede3 <> p0) then writeln('3 - ', GPossede3.nomGeekemon);
      if (GPossede4 <> p0) then writeln('4 - ', GPossede4.nomGeekemon);
      writeln('5 - Relacher ', GAdversaire.nomGeekemon, ' dans la nature');
      choix := lireDecalle;
      if (choix = '1') then GPossede1 := GAdversaire;
      if (choix = '2') then GPossede2 := GAdversaire;
      if (choix = '3') then GPossede3 := GAdversaire;
      if (choix = '4') then GPossede4 := GAdversaire;
      if (choix = '5') then writeln('A plush');
    end;
  end;
    if (GC =1) then
  begin
  GPossede1.nomGeekemon:=nomGeekemon;
  GPossede1.nomAttackGeekemon:=attackGeekemon;
  GPossede1.hpGeekemon:=hpGeekemon;
  GPossede1.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede1.degatsGeekemon:=degatsGeekemon;
  end;

  if (GC =2) then
  begin
  GPossede2.nomGeekemon:=nomGeekemon;
  GPossede2.nomAttackGeekemon:=attackGeekemon;
  GPossede2.hpGeekemon:=hpGeekemon;
  GPossede2.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede2.degatsGeekemon:=degatsGeekemon;
  end;
  if (GC =3) then
  begin
  GPossede3.nomGeekemon:=nomGeekemon;
  GPossede3.nomAttackGeekemon:=attackGeekemon;
  GPossede3.hpGeekemon:=hpGeekemon;
  GPossede3.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede3.degatsGeekemon:=degatsGeekemon;
  end;
  if (GC =4) then
  begin
  GPossede4.nomGeekemon:=nomGeekemon;
  GPossede4.nomAttackGeekemon:=attackGeekemon;
  GPossede4.hpGeekemon:=hpGeekemon;
  GPossede4.hpMaxGeekemon:=hpInitiauxGeekemon;
  GPossede4.degatsGeekemon:=degatsGeekemon;
  end;
writeln('Vous quittez la salle');
readln;
cls;
déplacement;
end;

procedure critStrike(n:integer);
var
chance:integer;

begin
  randomize;
  chance:=random(10);
  if (chance=9) then
  begin
    degatsCombat:=n+n;
    crits:=true
  end
  else
    degatsCombat:=n;
end;
end.
