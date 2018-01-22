unit FightInterface;

interface
  procedure habillageCombat;    //procedure pour afficher que l'on est en combat
  procedure affichageRencontre;  //procedure pour afficher la rencontre avec un Geekemon
  procedure FightDisplay;       //procedure pour choisir l'action en combat
  procedure attaque;          //procedure gerant l'attaque
  procedure Geekeball;       //procedure gerant les geekeballs
  procedure potionCombat;    //procedure gerant les potions
  procedure riposte;         //procedure gerant l'attaque adverse
  procedure selection;       //procedure gerant le changement de Geekemon
  procedure addG;          //procedure gerant l'ajout de geekemon.


implementation
uses
  Windows, Fonctions, randomi, Donnees, fichePerso, salleETDDG, fonctionsdéplacementminimale;

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
  if (GPossede1 <> p0) then ecrireDecalle2('1 - ', GPossede1.nomGeekemon); //permet d'afficher les Geekemons s'ils existent dans l'équipe
  if (GPossede2 <> p0) then ecrireDecalle2('2 - ', GPossede2.nomGeekemon);
  if (GPossede3 <> p0) then ecrireDecalle2('3 - ', GPossede3.nomGeekemon);
  if (GPossede4 <> p0) then ecrireDecalle2('4 - ', GPossede4.nomGeekemon);
  choix := lireDecalle;  //permet de choisir le Geekemon
  if (choix='1') then
  begin
    if GPossede1.hpGeekemon<=0 then  //verification si le Geekemon est K.O. ou non
    begin
      habillageCombat;
      writeln(GPossede1.nomGeekemon, ' est K.O. choisissez un autre geekemon');
      affichageRencontre;
    end
    else
    begin
    GActif := GPossede1;  //Enregistre le Geekemon choisi dans une variable
    GC :=1;  //Prend en compte le fait que ce soit tel Geekemon qui a été choisi
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
cls;
end;
end;

  Rencontre;   //Procedure qui choisit aléatoirement un Geekemon adverse
  nomGeekemon := GActif.nomGeekemon;       //Engeristrement de divers variable a propos du Geekemon choisi
  attackGeekemon := GActif.nomAttackGeekemon;
  hpGeekemon := GActif.hpGeekemon;
  hpInitiauxGeekemon := GActif.hpMaxGeekemon;
  degatsGeekemon := GActif.degatsGeekemon;

  nomGAdversaire := GAdversaire.nomGeekemon;   //Engeristrement de divers variable a propos du Geekemon adverse
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
  while conditionSortie1 = FALSE do  //condition qui devient vrai si l'on fuit ou met K.O. le Geekemon adverse
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
    ecrireDecalle('2 - Lancer une Geekeball');
    writeln('           3 - Utiliser une potion (',pers.potionPerso,' potions restantes)');
    ecrireDecalle('4 - Fuire le combat');
    writeln;
    choix := lireDecalle;  //choisi l'action a effectuer
    if choix = '1' then attaque;
    if choix = '2' then Geekeball;
    if choix = '3' then potionCombat;
    if choix = '4' then conditionSortie1 := SORTIE;
  end;
  //Si l'on met K.O. le geekemon adverse on sort du combat
  if (GC =1) then  //Met a jour les caractéristique du geekmon choisi apres le combat
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
  hpGAdversaire := hpGAdversaire - degatsGeekemon;  //baisse le PV adverse en fonction de notre attaque
  habillageCombat;
  writeln(nomGeekemon, ' attaque !');
  writeln(nomGAdversaire, ' perd ', degatsGeekemon, ' PV !');
  writeln;
  if (hpGeekemon <= 0) OR (hpGAdversaire <= 0) then //test de si le Geekemon adverse est K.O.
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

procedure Geekeball;
begin
  habillageCombat;
  randomize;
  ProbaGeekeball := random(2);  //selectionne un chiiffre entre 0 et 1
  if ProbaGeekeball = 0 then    //si le chiffre vaut 0 la capture echoue sinon elle reussi
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
  if pers.potionPerso>0 then  //verifie si l'on possede des potions
  begin
  n:=-1;
  potion(n);  //fonction qui gere le nombre de potion que l'on possede
  hpGeekemon := hpGeekemon + 50;
  if hpGeekemon > hpInitiauxGeekemon then  //verifie si le Geekemon possede plus de PV que ces PV de base apres avoir pris une potion
    begin                                  //si c'est le cas le Geekemon regagne le maximum de ses PV sinon il regagne 50 PV
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
  else     //Si l'on a pas de potion alors qu'on voulait en utiliser une le jeu nous punit en gachant notre tour
  begin
  habillageCombat;
  writeln('Vous cherchez en vain une potion. Pendant ce temps ',GAdversaire.nomGeekemon,' en profite pour attaquer.');
  readln;
  end;
  habillageCombat;
  riposte;
end;

procedure riposte;  //Un peu pres la meme procedure que pour la procedure attaque mais avec l'attaque du Geekemon adverse et nos PV
begin
  Sleep(500);
  //readln;
  writeln(nomGAdversaire, ' attaque !');
  Sleep(500);
  writeln(nomGeekemon, ' perd ', degatsGAdversaire, ' PV !');
  degatsTemp := degatsGAdversaire - shieldGeekemon;
  if (degatsTemp <= 0) then degatsTemp := 0;
  hpGeekemon := hpGeekemon - degatsTemp;
  shieldGeekemon := 0;
  readln;
  if (hpGeekemon <= 0) then  //vérifie si notre Geekemon est K.O.
  begin
    writeln('Votre ', nomGeekemon, ' est K.O. !');
    sleep(500);
    selection;
  end;
end;

procedure selection;
begin
  if (GC =1) then  //meme principe que plus haut
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
if (GPossede1.hpGeekemon<=0) and (GPossede2.hpGeekemon<=0) and (GPossede3.hpGeekemon<=0) and (GPossede4.hpGeekemon<=0) then  //si tout nos Geekemons sont K.O. le combat s'arrete et la procedure de soin s'enclenche
begin
  habillageCombat;
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
    choix := lireDecalle;   //choix du Geekemon a envoyer
    while(conditionSortie2 = FALSE) do
    begin
      if (choix='1') then
      begin
        if (GPossede1.hpGeekemon > 0) then   //verifie les PV du Geekemon, s'il est K.O. impossible dele choisir
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
      if (choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') then  //verifie que l'on entre une commande valide
      begin
        writeln('N''écrit pas n''importe quoi!');
        readln;
        selection;
      end;
    end;
end;

procedure addG;
begin
  if (GPossede1.nomGeekemon = p0.nomGeekemon) then GPossede1 := GAdversaire //verifie s'il reste de la place dans l'équipe
  else                                                                      //si c'est le cas il prend une des places restantes
  if (GPossede2.nomGeekemon = p0.nomGeekemon) then GPossede2 := GAdversaire
  else
  if (GPossede3.nomGeekemon = p0.nomGeekemon) then GPossede3 := GAdversaire
  else
  if (GPossede4.nomGeekemon = p0.nomGeekemon) then GPossede4 := GAdversaire
  else
  if (GPossede4.nomGeekemon <> p0.nomGeekemon) then
  begin      //s'il n'y a plus de place, choix de garder ou non le geekemon capturé
    habillageCombat;
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
    if (GC =1) then  //meme chose que plus haut
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
cls;
déplacement;
end;
end.
