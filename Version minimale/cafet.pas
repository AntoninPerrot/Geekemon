unit cafet;

interface              //la plupart des procedure sont les meme que pour l'unité fightInterface
  procedure selectionDresseur;    //procedure permettant de selectionner un dresseur
  procedure habillageAffrontement;   //procedure pour afficher que l'on est en combat contre un dresseur
  procedure affichageRencontre2;     //meme chose que la procedure affichageRencontre mais avec un dresseur
  procedure FightDisplay;
  procedure attaque;
  procedure potionCombat;
  procedure selection;
  procedure riposte;
  procedure changeG;    //procedure pour faire changer le Geekemon adverse

implementation
uses
  Fonctions, Donnees,fonctionsdéplacementMinimale, fichePerso, salleETDDG, Windows;

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
  G1dead := FALSE;
  G2dead := FALSE;
  G3dead := FALSE;
  G4dead := FALSE;
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln(' - - - - - - - - - - - - - - - - - - - - - - - Affrontement à la caféteriat - - - - - - - - - - - - - - - - - - - - - -');
  writeln(' ----------------------------------------------------------------------------------------------------------------------');
  writeln;
  writeln('Quel dresseur voulez-vous affronter ?');
  writeln;
  ecrireDecalle2('1 - ', D1.nomDresseur);
  writeln;
  ecrireDecalle2('2 - ',D2.nomDresseur);
  writeln;
  ecrireDecalle2('3 - ',D3.nomDresseur);
  writeln;
  ecrireDecalle2('4 - ',D4.nomDresseur);
  writeln;
  ecriredecalle('5 - Sortir');
  choix := lireDecalle; //choix du dresseur a affronter ou sortie de la cafetéria
  if (choix = '1') then DSelectionne := D1;
  if (choix = '2') then DSelectionne := D2;
  if (choix = '3') then DSelectionne := D3;
  if (choix = '4') then DSelectionne := D4;
  if (choix = '5') then déplacement;

  if (choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') AND (choix<>'5') then
  begin
    writeln('N''écrit pas n''importe quoi !');
    readln;
    selectionDresseur;
  end;
  GeekemonSelectDresseur := DSelectionne.geekemonDresseur1;
  habillageAffrontement;
  affichageRencontre2;
end;

procedure affichageRencontre2;
begin
  conditionSortie1                          := FALSE;
  conditionSortie2                          := FALSE;
  habillageAffrontement;

  writeln('Quel Geekemon choisissez-vous ?');
  if (GPossede1 <> p0) then ecrireDecalle2('1 - ', GPossede1.nomGeekemon); //permet d'afficher les Geekemons s'ils existent dans l'équipe
  if (GPossede2 <> p0) then ecrireDecalle2('2 - ', GPossede2.nomGeekemon);
  if (GPossede3 <> p0) then ecrireDecalle2('3 - ', GPossede3.nomGeekemon);
  if (GPossede4 <> p0) then ecrireDecalle2('4 - ', GPossede4.nomGeekemon);
  choix := lireDecalle; //permet de choisir le Geekemon
  if (choix='1') then
  begin
    if GPossede1.hpGeekemon<=0 then  //verification si le Geekemon est K.O. ou non
    begin
      habillageAffrontement;
      writeln(GPossede1.nomGeekemon, ' est K.O. Choisissez un autre Geekemon');
      affichageRencontre2;
    end
    else
    begin
    GActif := GPossede1;  //Enregistre le Geekemon choisi dans une variable
    GC :=1;  //Prend en compte le fait que ce soit telle Geekemon qui a été choisi
    end;
  end;
  if (choix='2') then
  begin
    if GPossede2.hpGeekemon<=0 then
    begin
      habillageAffrontement;
      writeln(GPossede2.nomGeekemon, ' est K.O. Choisissez un autre Geekemon');
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
      writeln(GPossede3.nomGeekemon, ' est K.O. Choisissez un autre Geekemon');
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
      writeln(GPossede4.nomGeekemon, ' est K.O. Choisissez un autre Geekemon');
      affichageRencontre2;
    end
    else
    begin
    GActif := GPossede4;
    GC :=4;
    end;
  end;
  if (choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') then  //verifie que l'on ecrit pas n'importe quoi
  begin
    writeln('N''écrit pas n''importe quoi !');
    readln;
    affichageRencontre2;
  end;

  nomGeekemon := GActif.nomGeekemon;     //Engeristrement de divers variable a propos du Geekemon choisi
  attackGeekemon := GActif.nomAttackGeekemon;
  hpGeekemon := GActif.hpGeekemon;
  hpInitiauxGeekemon := GActif.hpMaxGeekemon;
  degatsGeekemon := GActif.degatsGeekemon;

  nomGAdversaire := GeekemonSelectDresseur.nomGeekemon;    //Engeristrement de divers variable a propos du Geekemon du dresseur adverse
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

procedure FightDisplay;  //meme chose que pour le FightDisplay de l'unité fightInterface sans fuite
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
    decallage;
    writeln('2 - Utiliser une potion (', pers.potionPerso,' potions restantes)');
    ecrireDecalle('3 - Selectionner un autre Geekemon');
    writeln;
    choix := lireDecalle;
    if choix = '1' then attaque;
    if choix = '2' then potionCombat;
    if choix = '3' then selection;
  end;
  cls;
  writeln('Tu as gagné !');
  readln;
  DSelectionne.geekemonDresseur1.hpGeekemon:=DSelectionne.geekemonDresseur1.hpMaxGeekemon;  //soigne les Geekemon du dresseur adverse apres un combat
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
  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur1.idGeekemon)     //met a jour le PV du geekemon adverse
    then Dselectionne.geekemonDresseur1.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur2.idGeekemon)
    then Dselectionne.geekemonDresseur2.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur3.idGeekemon)
    then Dselectionne.geekemonDresseur3.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  if (GeekemonSelectDresseur.idGeekemon = DSelectionne.geekemonDresseur4.idGeekemon)
    then Dselectionne.geekemonDresseur4.hpGeekemon := GeekemonSelectDresseur.hpGeekemon;

  writeln(nomGeekemon, ' attaque !');
  writeln(nomGAdversaire, ' perd ', degatsGeekemon, ' PV !');
  writeln;
  sleep(500);
  if (hpGAdversaire <= 0) then   //verifie si le geekemon adverse est K.O.
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


procedure potionCombat;    //meme procedure que dans l'unité fightInterface
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

procedure riposte;  //meme procedure que dans l'unité fightInterface
begin
  sleep(500);
  //readln;
  writeln(nomGAdversaire, ' attaque !');
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

procedure selection;   //meme procedure que dans l'unité fightInterface
begin                //sauf que quand l'on perd face a un dresseur,ses geekemon sont soigné aussi
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
  DSelectionne.geekemonDresseur1.hpGeekemon:=DSelectionne.geekemonDresseur1.hpMaxGeekemon; //soin geekemon adverse
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
  if DSelectionne.geekemonDresseur1.hpGeekemon <= 0 then   //si le geekemon d'un dresseur est mis K.O. le dresseur en envoi un autre s'il en possede d'autre
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
