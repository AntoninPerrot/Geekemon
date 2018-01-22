unit cafet;

interface
  procedure selectionDresseur;
  procedure habillageAffrontement;
  procedure affichageRencontre2;
  procedure FightDisplay;
  procedure attaque;
  procedure defense;
  procedure potionCombat;
  procedure selection;
  procedure riposte;
  procedure changeG;

implementation
uses
  Fonctions, Donnees, donneesLieuAvancee,fonctionsdeplacementAvancee, fichePerso, salleETDDG, succes, Windows;

var
  choix, choixSelection : String;
  conditionSortie1, conditionSortie2,
  G1dead, G2dead, G3dead, G4dead            : Boolean;
  GeekemonSelectDresseur, GActif            : Geekemon;
  GC : Integer;
  nomGAdversaire,     nomGeekemon,
  elementGAdversaire, elementGeekemon,
  attackGAdversaire,  attackGeekemon        : String;
  hpGAdversaire,      hpGeekemon,
  hpInitiauxADV,      hpInitiauxGeekemon,
  shieldGAdversaire,  shieldGeekemon,
  degatsGAdversaire,  degatsGeekemon,
  degatsTemp                                : Integer;

const
  SORTIE                                    : Boolean = TRUE;

procedure selectionDresseur;
begin
  cls;
  verifSucces;
  G1dead := FALSE;
  G2dead := FALSE;
  G3dead := FALSE;
  G4dead := FALSE;
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln(' - - - - - - - - - - - - - - - - - - - - - - - Affrontement à la caféteriat - - - - - - - - - - - - - - - - - - - - - -');
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln;
  writeln('Quel Dresseur voulez vous affronter ?');
  writeln;
  ecrireDecalle2('1 - ', D1.nomDresseur);
  Decallage;
  writeln('Recompense : ', D1.recompenseDresseur);
  writeln;
  ecrireDecalle2('2 - ',D2.nomDresseur);
  Decallage;
  writeln('Recompense : ', D2.recompenseDresseur);
  writeln;
  ecrireDecalle2('3 - ',D3.nomDresseur);
  Decallage;
  writeln('Recompense : ', D3.recompenseDresseur);
  writeln;
  ecrireDecalle2('4 - ',D4.nomDresseur);
  Decallage;
  writeln('Recompense : ', D4.recompenseDresseur);
  writeln;
  ecriredecalle('5 - Carte');
  writeln;
  ecriredecalle('6 - Sortir');
  choix := lireDecalle;
  if (choix = '1') then DSelectionne := D1;
  if (choix = '2') then DSelectionne := D2;
  if (choix = '3') then DSelectionne := D3;
  if (choix = '4') then DSelectionne := D4;
  if (choix = '5') then affichageCarte(l3.idLieu);
  if (choix = '6') then déplacement;

  if ((choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') AND (choix<>'5') AND (choix<>'6')) then
    begin
    writeln('N''écrit pas n''importe quoi!');
    readln;
    selectionDresseur;
    end;
  if ((choix='1') OR (choix='2') OR (choix='3') OR (choix='4')) then
    begin
    if (l3.visiteLieu=0) then l3.visiteLieu := 1;   //le combat est lancé, on a donc combattu dans cette salle, ce qui est un pas vers le succès 1
    GeekemonSelectDresseur := DSelectionne.geekemonDresseur1;
    habillageAffrontement;
    affichageRencontre2;
    end;
  selectionDresseur;
end;

procedure affichageRencontre2;
begin
  conditionSortie1                          := FALSE;
  conditionSortie2                          := FALSE;
  habillageAffrontement;

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
      habillageAffrontement;
      writeln(GPossede1.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre2;
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
      habillageAffrontement;
      writeln(GPossede2.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre2;
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
      habillageAffrontement;
      writeln(GPossede3.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre2;
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
      habillageAffrontement;
      writeln(GPossede4.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre2;
    end
    else
    begin
    GActif := GPossede4;
    GC :=4;
    end;
  end;
  if (choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') then
  begin
    writeln('N''écrit pas n''importe quoi!');
    readln;
    affichageRencontre2;
  end;

  nomGeekemon := GActif.nomGeekemon;
  attackGeekemon := GActif.nomAttackGeekemon;
  hpGeekemon := GActif.hpGeekemon;
  hpInitiauxGeekemon := GActif.hpMaxGeekemon;
  degatsGeekemon := GActif.degatsGeekemon;

  nomGAdversaire := GeekemonSelectDresseur.nomGeekemon;
  attackGAdversaire := GeekemonSelectDresseur.nomAttackGeekemon;
  hpInitiauxADV := GeekemonSelectDresseur.hpMaxGeekemon;
  hpGAdversaire := GeekemonSelectDresseur.hpGeekemon;
  degatsGAdversaire := GeekemonSelectDresseur.degatsGeekemon;


  write('Le Geekemon sauvage : ');
  write(nomGAdversaire);
  writeln(' se prépare au combat. ');
  writeln;
  write('Votre Geekemon : ');
  write(nomGeekemon);
  writeln(' se prépare au combat. ');
  FightDisplay;
end;

procedure habillageAffrontement;
begin
  cls;
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln(' - - - - - - - - - - - - - - - - - - - - - -  Affrontement avec un dresseur - - - - - - - - - - - - - - - - - - - - - -');
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln;
  writeln(DSelectionne.citationDresseur);
  writeln;
  writeln(DSelectionne.nomDresseur, ' choisit ', DSelectionne.geekemonDresseur1.nomGeekemon);
  writeln;
end;

procedure habillageCombat;
begin
  cls;
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln(' - - - - - - - - - - - - - - - - - - - - - -  Affrontement avec un dresseur - - - - - - - - - - - - - - - - - - - - - -');
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
end;

procedure FightDisplay;
begin
  while conditionSortie1 = FALSE do
  begin
    cls;
    habillageCombat;
    writeln;
    writeln(nomGeekemon, ' : ', hpGeekemon, 'PV, ', degatsGeekemon, ' Dégats d''attaque. ');
    writeln;
    writeln(nomGAdversaire, ' : ', hpGAdversaire, 'PV, ', degatsGAdversaire, ' Dégats d''attaque. ');
    writeln;
    write('C''est à ');
    write(nomGeekemon);
    writeln(' d''agir, que souhaitez vous faire ?');
    writeln;
    ecrireDecalle('1 - Attaquer');
    ecrireDecalle('2 - Défendre');
    decallage;
    writeln('3 - Utiliser une potion (', pers.potionPerso,' potions restantes)');
    ecrireDecalle('4 - Selectionner un autre Geekemon');
    writeln;
    choix := lireDecalle;
    if choix = '1' then attaque;
    if choix = '2' then defense;
    if choix = '3' then potionCombat;
    if choix = '4' then selection;
  end;
  cls;
  writeln('Tu as gagné ',DSelectionne.recompenseDresseur,' Geekedollars !');
  Pers.argentPerso:=Pers.argentPerso+DSelectionne.recompenseDresseur;
  Dselectionne.VictoireDresseur := 1;
  readln;
  DSelectionne.geekemonDresseur1.hpGeekemon:=DSelectionne.geekemonDresseur1.hpMaxGeekemon;
  DSelectionne.geekemonDresseur2.hpGeekemon:=DSelectionne.geekemonDresseur2.hpMaxGeekemon;
  DSelectionne.geekemonDresseur3.hpGeekemon:=DSelectionne.geekemonDresseur3.hpMaxGeekemon;
  DSelectionne.geekemonDresseur4.hpGeekemon:=DSelectionne.geekemonDresseur4.hpMaxGeekemon;
  selectionDresseur;
end;

procedure attaque;
begin
  cls;
  hpGAdversaire := hpGAdversaire - degatsGeekemon;
  habillageCombat;
  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur1.idGeekemon)
    then Dselectionne.geekemonDresseur1.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur2.idGeekemon)
    then Dselectionne.geekemonDresseur2.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur3.idGeekemon)
    then Dselectionne.geekemonDresseur3.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur4.idGeekemon)
    then Dselectionne.geekemonDresseur4.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  writeln(nomGeekemon, ' utilise ', attackGeekemon, ' !');
  writeln(nomGAdversaire, ' perd ', degatsGeekemon, ' PV !');
  writeln;
  sleep(500);
  if (hpGAdversaire <= 0) then
  begin
    //G1Dead
    writeln('Le ', nomGadversaire, ' adverse est K.O. !');
    sleep(500);
    changeG;
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
  sleep(500);
  //readln;
  writeln(nomGAdversaire, ' utilise ', attackGAdversaire, ' !');
  Sleep(500);
  writeln(nomGeekemon, ' perd ', degatsGAdversaire, ' PV !');
  degatsTemp := degatsGAdversaire - shieldGeekemon;
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
  DSelectionne.geekemonDresseur1.hpGeekemon:=DSelectionne.geekemonDresseur1.hpMaxGeekemon;
  DSelectionne.geekemonDresseur2.hpGeekemon:=DSelectionne.geekemonDresseur2.hpMaxGeekemon;
  DSelectionne.geekemonDresseur3.hpGeekemon:=DSelectionne.geekemonDresseur3.hpMaxGeekemon;
  DSelectionne.geekemonDresseur4.hpGeekemon:=DSelectionne.geekemonDresseur4.hpMaxGeekemon;
  writeln('Plus de Geekemon disponible !');
  writeln;
  writeln('Vous courez vers la salle ETDDG pour faire soigner vos Geekemon');
  readln;
  soinForcé;
end;
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
      if (choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') then
      begin
        writeln('N''écrit pas n''importe quoi!');
        readln;
        selection;
      end;
    end;

end;

procedure changeG;
begin
if (GeekemonSelectDresseur = DSelectionne.geekemonDresseur1)
    then Dselectionne.geekemonDresseur1.hpGeekemon := hpGAdversaire;
if (GeekemonSelectDresseur = DSelectionne.geekemonDresseur2)
    then Dselectionne.geekemonDresseur2.hpGeekemon := hpGAdversaire;
if (GeekemonSelectDresseur = DSelectionne.geekemonDresseur3)
    then Dselectionne.geekemonDresseur3.hpGeekemon := hpGAdversaire;
if (GeekemonSelectDresseur = DSelectionne.geekemonDresseur4)
    then Dselectionne.geekemonDresseur4.hpGeekemon := hpGAdversaire;
  if DSelectionne.geekemonDresseur1.hpGeekemon <= 0 then
  begin
    if (DSelectionne.geekemonDresseur2.hpGeekemon > 0) then
    begin
    GeekemonSelectDresseur := DSelectionne.geekemonDresseur2;
    nomGAdversaire := GeekemonSelectDresseur.nomGeekemon;
    attackGAdversaire := GeekemonSelectDresseur.nomAttackGeekemon;
    hpInitiauxADV := GeekemonSelectDresseur.hpMaxGeekemon;
    hpGAdversaire := GeekemonSelectDresseur.hpGeekemon;
    degatsGAdversaire := GeekemonSelectDresseur.degatsGeekemon;
    end
    else
      if (DSelectionne.geekemonDresseur3.hpGeekemon > 0) then
      begin
      GeekemonSelectDresseur := DSelectionne.geekemonDresseur3;
      nomGAdversaire := GeekemonSelectDresseur.nomGeekemon;
      attackGAdversaire := GeekemonSelectDresseur.nomAttackGeekemon;
      hpInitiauxADV := GeekemonSelectDresseur.hpMaxGeekemon;
      hpGAdversaire := GeekemonSelectDresseur.hpGeekemon;
      degatsGAdversaire := GeekemonSelectDresseur.degatsGeekemon;
      end
      else
        if  (DSelectionne.geekemonDresseur4.hpGeekemon > 0) then
        begin
        GeekemonSelectDresseur := DSelectionne.geekemonDresseur4;
        nomGAdversaire := GeekemonSelectDresseur.nomGeekemon;
        attackGAdversaire := GeekemonSelectDresseur.nomAttackGeekemon;
        hpInitiauxADV := GeekemonSelectDresseur.hpMaxGeekemon;
        hpGAdversaire := GeekemonSelectDresseur.hpGeekemon;
        degatsGAdversaire := GeekemonSelectDresseur.degatsGeekemon;
        end
        else
        begin
          writeln('Vous avez gagné !');
          readln;
          conditionSortie1 := SORTIE;
        end;
  end;
  FightDisplay;
end;

end.
