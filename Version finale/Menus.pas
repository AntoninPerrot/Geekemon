unit Menus;

interface
  procedure menuPrincipal;  //Menu principal qui contient l'�cran de titre et d'accueil
  procedure lieusecretariat ;
  procedure lieuRamp ;
  procedure ecranTitre;
  procedure parametre;
  procedure charger;
  procedure ecranAccueil;
  procedure creationPerso;
  procedure choixgeekemon;
  procedure tuto;
  procedure FightDisplayTuto;
  procedure attaqueTuto;
  procedure GeekeballTuto;
  procedure riposteTuto;


implementation
uses System.SysUtils,Windows,Fonctions, fichePerso, salleETDDG, succes, FonctionsDeplacementAvancee,Donnees,FightInterface, GestionEcran, donneesLieuAvancee;

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
  degatsGAdversaire,  degatsGeekemon, degatsTemp :Integer;

procedure menuPrincipal;    //menu principal du jeu
begin
  ecrantitre;
  cls;
  ecranAccueil;
end;

procedure lieusecretariat ;   //on affiche en en-t�te le lieu 'secr�tariat'
begin
  writeln;
  ecriredecalle('Lieu : Secretariat');
  writeln;
  writeln('------------------------------------------------------------------------------------------------------------------------');
  writeln;
end;

procedure lieuRamp ;      //on affiche en en-t�te le lieu du professeur Ramp
begin
  cls;
  writeln;
  ecriredecalle('Lieu : Labo du professeur Ramp');
  writeln;
  writeln('------------------------------------------------------------------------------------------------------------------------');
  writeln;
end;



procedure ecranTitre;  //ecran titre pr�c�dant le menu d'accueil
var
position : coordonnees;
x, y : Integer;
texte : String;
begin
  cls;
  ecriredecalle(' ______     ______     ______     __  __     ______     __    __     ______     __   __   ');
  ecriredecalle('/\  ___\   /\  ___\   /\  ___\   /\ \/ /    /\  ___\   /\ "-./  \   /\  __ \   /\ "-.\ \  ');
  ecriredecalle('\ \ \__ \  \ \  __\   \ \  __\   \ \  _"-.  \ \  __\   \ \ \-./\ \  \ \ \/\ \  \ \ \-.  \ ');
  ecriredecalle(' \ \_____\  \ \_____\  \ \_____\  \ \_\ \_\  \ \_____\  \ \_\ \ \_\  \ \_____\  \ \_\\"\_\');
  ecriredecalle('  \/_____/   \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_/  \/_/   \/_____/   \/_/ \/_/');
  writeln;
  ecriredecalle('       ______   ______     ______       __     ______     ______     ______ ');
  ecriredecalle('      /\  == \ /\  == \   /\  __ \     /\ \   /\  ___\   /\  ___\   /\__  _\');
  ecriredecalle('      \ \  _-/ \ \  __<   \ \ \/\ \   _\_\ \  \ \  __\   \ \ \____  \/_/\ \/');
  ecriredecalle('       \ \_\    \ \_\ \_\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\');
  ecriredecalle('        \/_/     \/_/ /_/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/');
  writeln;
  writeln('  ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`');
  writeln('  (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)');
  writeln(' (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)');
  writeln('--_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_--');
  writeln;
  writeln;
  writeln;
  writeln;
  writeln;

  position.x := 70;
  position.y := 25;
  texte := 'MERCIER Jordoan - SILAIRE Victor - PERROT Antonin' ;
  ecrireEnPosition(position, texte);
  position.x := 0;
  position.y := 20;
  texte := 'Pressez n''importe quelle touche pour d�buter ton aventure !' ;
  ecrireEnPosition(position, texte);
  writeln;
  readln;
  cls;
end;


procedure parametre;   //param�tres du menu qui permettent de changer les couleurs
var
  choix : String;
  fond, color : Integer;

begin

  while ((choix<>'1') AND (choix<>'2') AND (choix<>'3')) do   //tant qu'on ne choisit pas une des 3 options
    begin
    cls;
    color := 15;
    fond := 0;
    writeln;
    writeln('Vous pouvez changer la couleur de la police, ainsi que la couleur de fond :');
    writeln;
    ecriredecalle('1 - Couleur de police');
    writeln;
    ecriredecalle('2 - Couleur de fond');
    writeln;
    ecriredecalle('3 - Menu principal');
    readln(choix);
    cls;
    end;
  if (choix='1') then    //si on veut changer couleur de police
    begin
    cls;
    writeln;
    writeln('Choisissez la couleur que vous d�sirez : ');
    writeln;
    ecriredecalle('Black        = 0');     //on propose les choix de couleur
    ecriredecalle('Blue         = 1');
    ecriredecalle('Green        = 2');
    ecriredecalle('Cyan         = 3');
    ecriredecalle('Red          = 4');
    ecriredecalle('Magenta      = 5');
    ecriredecalle('Brown        = 6');
    ecriredecalle('LightGray    = 7');
    ecriredecalle('DarkGray     = 8');
    ecriredecalle('LightBlue    = 9');
    ecriredecalle('LightGreen   = 10');
    ecriredecalle('LightCyan    = 11');
    ecriredecalle('LightRed     = 12');
    ecriredecalle('LightMagenta = 13');
    ecriredecalle('Yellow       = 14');
    ecriredecalle('White        = 15');
    writeln;
    ecriredecalle('16 - Retour');
    writeln;
    readln(choix);
    cls;
    if (choix='16') then parametre  //pour retourner au menu parametre
    else
      begin
      pers.colorPerso := strToInt(choix);  //on garde en m�moire la couleur choisie
      couleurTexte(strToInt(choix)); //on modifie la couleur
      end;
    end;
  if (choix='2') then   //choix 2 pour le fond d'�cran
    begin
    cls;
    writeln;
    writeln('Choisissez la couleur que vous d�sirez : ');
    writeln;
    ecriredecalle('Black        = 0');
    ecriredecalle('Blue         = 1');
    ecriredecalle('Green        = 2');
    ecriredecalle('Cyan         = 3');
    ecriredecalle('Red          = 4');
    ecriredecalle('Magenta      = 5');
    ecriredecalle('Brown        = 6');
    ecriredecalle('LightGray    = 7');
    ecriredecalle('DarkGray     = 8');
    ecriredecalle('LightBlue    = 9');
    ecriredecalle('LightGreen   = 10');
    ecriredecalle('LightCyan    = 11');
    ecriredecalle('LightRed     = 12');
    ecriredecalle('LightMagenta = 13');
    ecriredecalle('Yellow       = 14');
    ecriredecalle('White        = 15');
    writeln;
    ecriredecalle('16 - Retour');
    writeln;
    readln(choix);
    cls;
    if (choix='16') then parametre    //pour retourner au menu parametre
    else
      begin
      pers.fondPerso := strToInt(choix);       //on m�morise le choix
      EffacerEtColorierEcran(strToInt(choix)); //on change la couleur
      end;
    end;
    if ((fond=color) OR ((fond=7) OR (color=7)) AND ((color=15) OR (fond=15))) then  //si la couleur de texte est la m�me que celle de l'�cran (gris clair et blanc sont quasiment identiques)
      begin
      effacerEtColorierEcran(0); //on remet les valeurs par d�faut (noir et blanc)
      couleurTexte(15);          //et on avertit l'utilisateur
      writeln;
      writeln('Vous ne pouvez pas mettre le fond et la couleur de police de la m�me couleur !');
      writeln('Les couleurs ont �t� r�initialis�.');
      readln;
      end;
  if (choix='3') then  //on retourne au menu principal
    begin
    cls;
    menuPrincipal;
    end;
  parametre;
end;

procedure charger;
var
  choix : char;
  save1, save2, save3 : TextFile;                       //D�claration des liens vers les fichiers de sauvegarde
begin
  writeln('Quel slot veux-tu charger ?');
  writeln;
  if (fileexists('save1.txt') = TRUE) then ecriredecalle('1 - Slot 1')     //test : le fichier de sauvegarde existe-t-il ?
  else ecriredecalle('1 - Slot 1 (VIDE)');
  if (fileexists('save2.txt') = TRUE) then ecriredecalle('2 - Slot 2')
  else ecriredecalle('2 - Slot 2 (VIDE)');
  if (fileexists('save3.txt') = TRUE) then ecriredecalle('3 - Slot 3')
  else ecriredecalle('3 - Slot 3 (VIDE)');
  writeln;
  ecriredecalle('4 - Menu principal');
  readln(choix);
  cls;
  assign(save1, 'save1.txt');                           //Assignation des liens vers les fichiers texte
  assign(save2, 'save2.txt');
  assign(save3, 'save3.txt');
  case choix of
  '1' :
    begin
      if (fileexists('save1.txt') = TRUE) then
      begin
      reset(save1);                                     //Chargement du fichier de sauvegarde en mode lecture
      readln(save1, Pers.nomPerso);                     //Lecture du nom du personnage puis saut de ligne
      readln(save1, Pers.argentPerso);                  //Lecture de l'argent du personnage puis saut de ligne
      readln(save1, Pers.potionPerso);                  //Lecture du nombre de potions du personnage puis saut de ligne
      readln(save1, Pers.potionAchete);                 //Lecture du nombre de potions achet�es pour le succ�s
      readln(save1, Pers.colorPerso);                   //Lecture de la couleur de police du personnage, puis saut de ligne
      readln(save1, Pers.fondPerso);                    //Lecture de la couleur de fond d'�cran du personnage, puis saut de ligne
      readln(save1, Pers.succes1);                      //Lecture de la reussite ou non des succ�s
      readln(save1, Pers.succes2);
      readln(save1, Pers.succes3);
      readln(save1, Pers.succes4);
      readln(save1);                                    //Saut de ligne
      Readln(save1, d1.VictoireDresseur);               //Lecture de l'information si le dresseur a �t� battu ou non
      readln(save1, d2.VictoireDresseur);
      readln(save1, d3.VictoireDresseur);
      readln(save1, d4.VictoireDresseur);
      readln(save1);
      readln(save1, GPossede1.nomGeekemon);             //Lecture du nom du Geekemon puis saut de ligne
      readln(save1, GPossede1.elementGeekemon);         //Lecture de l'�l�ment du Geekemon puis saut de ligne
      readln(save1, GPossede1.nomAttackGeekemon);       //Lecture du nom de l'attaque du Geekemon puis saut de ligne
      readln(save1, GPossede1.hpGeekemon);              //Lecture du nombre d'HP du Geekemon puis saut de ligne
      readln(save1, GPossede1.hpMaxGeekemon);           //Lecture du nombre d'HPMax du Geekemon puis saut de ligne
      readln(save1, GPossede1.degatsGeekemon);          //Lecture des d�gats du Geekemon puis saut de ligne
      readln(save1, GPossede1.idGeekemon);              //Lecture de l'ID du Geekemon puis saut de ligne
      readln(save1);
      readln(save1, GPossede2.nomGeekemon);
      readln(save1, GPossede2.elementGeekemon);
      readln(save1, GPossede2.nomAttackGeekemon);
      readln(save1, GPossede2.hpGeekemon);
      readln(save1, GPossede2.hpMaxGeekemon);
      readln(save1, GPossede2.degatsGeekemon);
      readln(save1, GPossede2.idGeekemon);
      readln(save1);
      readln(save1, GPossede3.nomGeekemon);
      readln(save1, GPossede3.elementGeekemon);
      readln(save1, GPossede3.nomAttackGeekemon);
      readln(save1, GPossede3.hpGeekemon);
      readln(save1, GPossede3.hpMaxGeekemon);
      readln(save1, GPossede3.degatsGeekemon);
      readln(save1, GPossede3.idGeekemon);
      readln(save1);
      readln(save1, GPossede4.nomGeekemon);
      readln(save1, GPossede4.elementGeekemon);
      readln(save1, GPossede4.nomAttackGeekemon);
      readln(save1, GPossede4.hpGeekemon);
      readln(save1, GPossede4.hpMaxGeekemon);
      readln(save1, GPossede4.degatsGeekemon);
      readln(save1, GPossede4.idGeekemon);
      readln(save1);
      readln(save1, GPC1.nomGeekemon);
      readln(save1, GPC1.elementGeekemon);
      readln(save1, GPC1.nomAttackGeekemon);
      readln(save1, GPC1.hpGeekemon);
      readln(save1, GPC1.hpMaxGeekemon);
      readln(save1, GPC1.degatsGeekemon);
      readln(save1, GPC1.idGeekemon);
      readln(save1);
      readln(save1, GPC2.nomGeekemon);
      readln(save1, GPC2.elementGeekemon);
      readln(save1, GPC2.nomAttackGeekemon);
      readln(save1, GPC2.hpGeekemon);
      readln(save1, GPC2.hpMaxGeekemon);
      readln(save1, GPC2.degatsGeekemon);
      readln(save1, GPC2.idGeekemon);
      readln(save1);
      readln(save1, GPC3.nomGeekemon);
      readln(save1, GPC3.elementGeekemon);
      readln(save1, GPC3.nomAttackGeekemon);
      readln(save1, GPC3.hpGeekemon);
      readln(save1, GPC3.hpMaxGeekemon);
      readln(save1, GPC3.degatsGeekemon);
      readln(save1, GPC3.idGeekemon);
      readln(save1);
      readln(save1, GPC4.nomGeekemon);
      readln(save1, GPC4.elementGeekemon);
      readln(save1, GPC4.nomAttackGeekemon);
      readln(save1, GPC4.hpGeekemon);
      readln(save1, GPC4.hpMaxGeekemon);
      readln(save1, GPC4.degatsGeekemon);
      readln(save1, GPC4.idGeekemon);
      readln(save1);
      readln(save1, GPC5.nomGeekemon);
      readln(save1, GPC5.elementGeekemon);
      readln(save1, GPC5.nomAttackGeekemon);
      readln(save1, GPC5.hpGeekemon);
      readln(save1, GPC5.hpMaxGeekemon);
      readln(save1, GPC5.degatsGeekemon);
      readln(save1, GPC5.idGeekemon);
      readln(save1);
      readln(save1, GPC6.nomGeekemon);
      readln(save1, GPC6.elementGeekemon);
      readln(save1, GPC6.nomAttackGeekemon);
      readln(save1, GPC6.hpGeekemon);
      readln(save1, GPC6.hpMaxGeekemon);
      readln(save1, GPC6.degatsGeekemon);
      readln(save1, GPC6.idGeekemon);
      readln(save1);
      readln(save1, GPC7.nomGeekemon);
      readln(save1, GPC7.elementGeekemon);
      readln(save1, GPC7.nomAttackGeekemon);
      readln(save1, GPC7.hpGeekemon);
      readln(save1, GPC7.hpMaxGeekemon);
      readln(save1, GPC7.degatsGeekemon);
      readln(save1, GPC7.idGeekemon);
      readln(save1);
      readln(save1, GPC8.nomGeekemon);
      readln(save1, GPC8.elementGeekemon);
      readln(save1, GPC8.nomAttackGeekemon);
      readln(save1, GPC8.hpGeekemon);
      readln(save1, GPC8.hpMaxGeekemon);
      readln(save1, GPC8.degatsGeekemon);
      readln(save1, GPC8.idGeekemon);
      readln(save1);
      readln(save1, GPC9.nomGeekemon);
      readln(save1, GPC9.elementGeekemon);
      readln(save1, GPC9.nomAttackGeekemon);
      readln(save1, GPC9.hpGeekemon);
      readln(save1, GPC9.hpMaxGeekemon);
      readln(save1, GPC9.degatsGeekemon);
      readln(save1, GPC9.idGeekemon);
      readln(save1);
      readln(save1, GPC10.nomGeekemon);
      readln(save1, GPC10.elementGeekemon);
      readln(save1, GPC10.nomAttackGeekemon);
      readln(save1, GPC10.hpGeekemon);
      readln(save1, GPC10.hpMaxGeekemon);
      readln(save1, GPC10.degatsGeekemon);
      readln(save1, GPC10.idGeekemon);
      close(save1);                              //Fermeture du fichier
      EffacerEtColorierEcran(Pers.fondPerso);    //On restaure les couleurs de police et de fond de l'utilisateur
      couleurTexte(Pers.colorPerso);
      ETDDG;
      end
      else
        begin
        writeln('Il n''existe pas de sauvegarde � cet emplacement.');
        readln;
        menuPrincipal;
        end;
    end;

  '2' :
    begin
    if (fileexists('save2.txt') = TRUE) then
      begin
      reset(save2);                                     //Chargement du fichier de sauvegarde en mode lecture
      readln(save2, Pers.nomPerso);                     //Lecture du nom du personnage puis saut de ligne
      readln(save2, Pers.argentPerso);                  //Lecture de l'argent du personnage puis saut de ligne
      readln(save2, Pers.potionPerso);                  //Lecture du nombre de potions du personnage puis saut de ligne
      readln(save2, Pers.potionAchete);                 //Lecture du nombre de potions achet�es pour le succ�s
      readln(save2, Pers.colorPerso);                   //Lecture de la couleur de police du personnage, puis saut de ligne
      readln(save2, Pers.fondPerso);                    //Lecture de la couleur de fond d'�cran du personnage, puis saut de ligne
      readln(save2, Pers.succes1);                      //Lecture de la reussite ou non des succ�s
      readln(save2, Pers.succes2);
      readln(save2, Pers.succes3);
      readln(save2, Pers.succes4);
      readln(save2);                                    //Saut de ligne
      readln(save2, d1.VictoireDresseur);               //Lecture de l'information si le dresseur a �t� battu ou non
      readln(save2, d2.VictoireDresseur);
      readln(save2, d3.VictoireDresseur);
      readln(save2, d4.VictoireDresseur);
      readln(save2);
      readln(save2, GPossede1.nomGeekemon);             //Lecture du nom du Geekemon puis saut de ligne
      readln(save2, GPossede1.elementGeekemon);         //Lecture de l'�l�ment du Geekemon puis saut de ligne
      readln(save2, GPossede1.nomAttackGeekemon);       //Lecture du nom de l'attaque du Geekemon puis saut de ligne
      readln(save2, GPossede1.hpGeekemon);              //Lecture du nombre d'HP du Geekemon puis saut de ligne
      readln(save2, GPossede1.hpMaxGeekemon);           //Lecture du nombre d'HPMax du Geekemon puis saut de ligne
      readln(save2, GPossede1.degatsGeekemon);          //Lecture des d�gats du Geekemon puis saut de ligne
      readln(save2, GPossede1.idGeekemon);              //Lecture de l'ID du Geekemon puis saut de ligne
      readln(save2);
      readln(save2, GPossede2.nomGeekemon);
      readln(save2, GPossede2.elementGeekemon);
      readln(save2, GPossede2.nomAttackGeekemon);
      readln(save2, GPossede2.hpGeekemon);
      readln(save2, GPossede2.hpMaxGeekemon);
      readln(save2, GPossede2.degatsGeekemon);
      readln(save2, GPossede2.idGeekemon);
      readln(save2);
      readln(save2, GPossede3.nomGeekemon);
      readln(save2, GPossede3.elementGeekemon);
      readln(save2, GPossede3.nomAttackGeekemon);
      readln(save2, GPossede3.hpGeekemon);
      readln(save2, GPossede3.hpMaxGeekemon);
      readln(save2, GPossede3.degatsGeekemon);
      readln(save2, GPossede3.idGeekemon);
      readln(save2);
      readln(save2, GPossede4.nomGeekemon);
      readln(save2, GPossede4.elementGeekemon);
      readln(save2, GPossede4.nomAttackGeekemon);
      readln(save2, GPossede4.hpGeekemon);
      readln(save2, GPossede4.hpMaxGeekemon);
      readln(save2, GPossede4.degatsGeekemon);
      readln(save2, GPossede4.idGeekemon);
      readln(save2);
      readln(save2, GPC1.nomGeekemon);
      readln(save2, GPC1.elementGeekemon);
      readln(save2, GPC1.nomAttackGeekemon);
      readln(save2, GPC1.hpGeekemon);
      readln(save2, GPC1.hpMaxGeekemon);
      readln(save2, GPC1.degatsGeekemon);
      readln(save2, GPC1.idGeekemon);
      readln(save2);
      readln(save2, GPC2.nomGeekemon);
      readln(save2, GPC2.elementGeekemon);
      readln(save2, GPC2.nomAttackGeekemon);
      readln(save2, GPC2.hpGeekemon);
      readln(save2, GPC2.hpMaxGeekemon);
      readln(save2, GPC2.degatsGeekemon);
      readln(save2, GPC2.idGeekemon);
      readln(save2);
      readln(save2, GPC3.nomGeekemon);
      readln(save2, GPC3.elementGeekemon);
      readln(save2, GPC3.nomAttackGeekemon);
      readln(save2, GPC3.hpGeekemon);
      readln(save2, GPC3.hpMaxGeekemon);
      readln(save2, GPC3.degatsGeekemon);
      readln(save2, GPC3.idGeekemon);
      readln(save2);
      readln(save2, GPC4.nomGeekemon);
      readln(save2, GPC4.elementGeekemon);
      readln(save2, GPC4.nomAttackGeekemon);
      readln(save2, GPC4.hpGeekemon);
      readln(save2, GPC4.hpMaxGeekemon);
      readln(save2, GPC4.degatsGeekemon);
      readln(save2, GPC4.idGeekemon);
      readln(save2);
      readln(save2, GPC5.nomGeekemon);
      readln(save2, GPC5.elementGeekemon);
      readln(save2, GPC5.nomAttackGeekemon);
      readln(save2, GPC5.hpGeekemon);
      readln(save2, GPC5.hpMaxGeekemon);
      readln(save2, GPC5.degatsGeekemon);
      readln(save2, GPC5.idGeekemon);
      readln(save2);
      readln(save2, GPC6.nomGeekemon);
      readln(save2, GPC6.elementGeekemon);
      readln(save2, GPC6.nomAttackGeekemon);
      readln(save2, GPC6.hpGeekemon);
      readln(save2, GPC6.hpMaxGeekemon);
      readln(save2, GPC6.degatsGeekemon);
      readln(save2, GPC6.idGeekemon);
      readln(save2);
      readln(save2, GPC7.nomGeekemon);
      readln(save2, GPC7.elementGeekemon);
      readln(save2, GPC7.nomAttackGeekemon);
      readln(save2, GPC7.hpGeekemon);
      readln(save2, GPC7.hpMaxGeekemon);
      readln(save2, GPC7.degatsGeekemon);
      readln(save2, GPC7.idGeekemon);
      readln(save2);
      readln(save2, GPC8.nomGeekemon);
      readln(save2, GPC8.elementGeekemon);
      readln(save2, GPC8.nomAttackGeekemon);
      readln(save2, GPC8.hpGeekemon);
      readln(save2, GPC8.hpMaxGeekemon);
      readln(save2, GPC8.degatsGeekemon);
      readln(save2, GPC8.idGeekemon);
      readln(save2);
      readln(save2, GPC9.nomGeekemon);
      readln(save2, GPC9.elementGeekemon);
      readln(save2, GPC9.nomAttackGeekemon);
      readln(save2, GPC9.hpGeekemon);
      readln(save2, GPC9.hpMaxGeekemon);
      readln(save2, GPC9.degatsGeekemon);
      readln(save2, GPC9.idGeekemon);
      readln(save2);
      readln(save2, GPC10.nomGeekemon);
      readln(save2, GPC10.elementGeekemon);
      readln(save2, GPC10.nomAttackGeekemon);
      readln(save2, GPC10.hpGeekemon);
      readln(save2, GPC10.hpMaxGeekemon);
      readln(save2, GPC10.degatsGeekemon);
      readln(save2, GPC10.idGeekemon);
      close(save2);                              //fermeture du fichier
      EffacerEtColorierEcran(Pers.fondPerso);   //On restaure les couleurs de police et de fond de l'utilisateur
      couleurTexte(Pers.colorPerso);
      ETDDG;
      end
      else
        begin
        writeln('Il n''existe pas de sauvegarde � cet emplacement.');
        readln;
        menuPrincipal;
        end;
    end;

  '3' :
    begin
      if (fileexists('save3.txt') = TRUE) then
      begin
      reset(save3);                                     //Chargement du fichier de sauvegarde en mode lecture
      readln(save3, Pers.nomPerso);                     //Lecture du nom du personnage puis saut de ligne
      readln(save3, Pers.argentPerso);                  //Lecture de l'argent du personnage puis saut de ligne
      readln(save3, Pers.potionPerso);                  //Lecture du nombre de potions du personnage puis saut de ligne
      readln(save3, Pers.potionAchete);                 //Lecture du nombre de potions achet�es pour le succ�s
      readln(save3, Pers.colorPerso);                   //Lecture de la couleur de police du personnage, puis saut de ligne
      readln(save3, Pers.fondPerso);                    //Lecture de la couleur de fond d'�cran du personnage, puis saut de ligne
      readln(save3, Pers.succes1);                      //Lecture de la reussite ou non des succ�s
      readln(save3, Pers.succes2);
      readln(save3, Pers.succes3);
      readln(save3, Pers.succes4);
      readln(save3);                                    //Saut de ligne
      readln(save3, d1.VictoireDresseur);               //Lecture de l'information si le dresseur a �t� battu ou non
      readln(save3, d2.VictoireDresseur);
      readln(save3, d3.VictoireDresseur);
      readln(save3, d4.VictoireDresseur);
      readln(save3);
      readln(save3, GPossede1.nomGeekemon);             //Lecture du nom du Geekemon puis saut de ligne
      readln(save3, GPossede1.elementGeekemon);         //Lecture de l'�l�ment du Geekemon puis saut de ligne
      readln(save3, GPossede1.nomAttackGeekemon);       //Lecture du nom de l'attaque du Geekemon puis saut de ligne
      readln(save3, GPossede1.hpGeekemon);              //Lecture du nombre d'HP du Geekemon puis saut de ligne
      readln(save3, GPossede1.hpMaxGeekemon);           //Lecture du nombre d'HPMax du Geekemon puis saut de ligne
      readln(save3, GPossede1.degatsGeekemon);          //Lecture des d�gats du Geekemon puis saut de ligne
      readln(save3, GPossede1.idGeekemon);              //Lecture de l'ID du Geekemon puis saut de ligne
      readln(save3);
      readln(save3, GPossede2.nomGeekemon);
      readln(save3, GPossede2.elementGeekemon);
      readln(save3, GPossede2.nomAttackGeekemon);
      readln(save3, GPossede2.hpGeekemon);
      readln(save3, GPossede2.hpMaxGeekemon);
      readln(save3, GPossede2.degatsGeekemon);
      readln(save3, GPossede2.idGeekemon);
      readln(save3);
      readln(save3, GPossede3.nomGeekemon);
      readln(save3, GPossede3.elementGeekemon);
      readln(save3, GPossede3.nomAttackGeekemon);
      readln(save3, GPossede3.hpGeekemon);
      readln(save3, GPossede3.hpMaxGeekemon);
      readln(save3, GPossede3.degatsGeekemon);
      readln(save3, GPossede3.idGeekemon);
      readln(save3);
      readln(save3, GPossede4.nomGeekemon);
      readln(save3, GPossede4.elementGeekemon);
      readln(save3, GPossede4.nomAttackGeekemon);
      readln(save3, GPossede4.hpGeekemon);
      readln(save3, GPossede4.hpMaxGeekemon);
      readln(save3, GPossede4.degatsGeekemon);
      readln(save3, GPossede4.idGeekemon);
      readln(save3);
      readln(save3, GPC1.nomGeekemon);
      readln(save3, GPC1.elementGeekemon);
      readln(save3, GPC1.nomAttackGeekemon);
      readln(save3, GPC1.hpGeekemon);
      readln(save3, GPC1.hpMaxGeekemon);
      readln(save3, GPC1.degatsGeekemon);
      readln(save3, GPC1.idGeekemon);
      readln(save3);
      readln(save3, GPC2.nomGeekemon);
      readln(save3, GPC2.elementGeekemon);
      readln(save3, GPC2.nomAttackGeekemon);
      readln(save3, GPC2.hpGeekemon);
      readln(save3, GPC2.hpMaxGeekemon);
      readln(save3, GPC2.degatsGeekemon);
      readln(save3, GPC2.idGeekemon);
      readln(save3);
      readln(save3, GPC3.nomGeekemon);
      readln(save3, GPC3.elementGeekemon);
      readln(save3, GPC3.nomAttackGeekemon);
      readln(save3, GPC3.hpGeekemon);
      readln(save3, GPC3.hpMaxGeekemon);
      readln(save3, GPC3.degatsGeekemon);
      readln(save3, GPC3.idGeekemon);
      readln(save3);
      readln(save3, GPC4.nomGeekemon);
      readln(save3, GPC4.elementGeekemon);
      readln(save3, GPC4.nomAttackGeekemon);
      readln(save3, GPC4.hpGeekemon);
      readln(save3, GPC4.hpMaxGeekemon);
      readln(save3, GPC4.degatsGeekemon);
      readln(save3, GPC4.idGeekemon);
      readln(save3);
      readln(save3, GPC5.nomGeekemon);
      readln(save3, GPC5.elementGeekemon);
      readln(save3, GPC5.nomAttackGeekemon);
      readln(save3, GPC5.hpGeekemon);
      readln(save3, GPC5.hpMaxGeekemon);
      readln(save3, GPC5.degatsGeekemon);
      readln(save3, GPC5.idGeekemon);
      readln(save3);
      readln(save3, GPC6.nomGeekemon);
      readln(save3, GPC6.elementGeekemon);
      readln(save3, GPC6.nomAttackGeekemon);
      readln(save3, GPC6.hpGeekemon);
      readln(save3, GPC6.hpMaxGeekemon);
      readln(save3, GPC6.degatsGeekemon);
      readln(save3, GPC6.idGeekemon);
      readln(save3);
      readln(save3, GPC7.nomGeekemon);
      readln(save3, GPC7.elementGeekemon);
      readln(save3, GPC7.nomAttackGeekemon);
      readln(save3, GPC7.hpGeekemon);
      readln(save3, GPC7.hpMaxGeekemon);
      readln(save3, GPC7.degatsGeekemon);
      readln(save3, GPC7.idGeekemon);
      readln(save3);
      readln(save3, GPC8.nomGeekemon);
      readln(save3, GPC8.elementGeekemon);
      readln(save3, GPC8.nomAttackGeekemon);
      readln(save3, GPC8.hpGeekemon);
      readln(save3, GPC8.hpMaxGeekemon);
      readln(save3, GPC8.degatsGeekemon);
      readln(save3, GPC8.idGeekemon);
      readln(save3);
      readln(save3, GPC9.nomGeekemon);
      readln(save3, GPC9.elementGeekemon);
      readln(save3, GPC9.nomAttackGeekemon);
      readln(save3, GPC9.hpGeekemon);
      readln(save3, GPC9.hpMaxGeekemon);
      readln(save3, GPC9.degatsGeekemon);
      readln(save3, GPC9.idGeekemon);
      readln(save3);
      readln(save3, GPC10.nomGeekemon);
      readln(save3, GPC10.elementGeekemon);
      readln(save3, GPC10.nomAttackGeekemon);
      readln(save3, GPC10.hpGeekemon);
      readln(save3, GPC10.hpMaxGeekemon);
      readln(save3, GPC10.degatsGeekemon);
      readln(save3, GPC10.idGeekemon);
      close(save3);                               //fermeture du fichier
      EffacerEtColorierEcran(Pers.fondPerso);    //On restaure les couleurs de police et de fond de l'utilisateur
      couleurTexte(Pers.colorPerso);
      ETDDG;
      end
      else
        begin
        writeln('Il n''existe pas de sauvegarde � cet emplacement.');
        readln;
        menuPrincipal;
        end;
    end;
  end;
  if (choix='4') then menuPrincipal

end;

procedure ecranAccueil ; //ecran d'accueil qui propose diff�rentes options

var
  choix: String;

begin
while ((choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') AND (choix<>'5')) do
  begin
  cls;
  ecriredecalle(' ______     ______     ______     __  __     ______     __    __     ______     __   __   ');
  ecriredecalle('/\  ___\   /\  ___\   /\  ___\   /\ \/ /    /\  ___\   /\ "-./  \   /\  __ \   /\ "-.\ \  ');
  ecriredecalle('\ \ \__ \  \ \  __\   \ \  __\   \ \  _"-.  \ \  __\   \ \ \-./\ \  \ \ \/\ \  \ \ \-.  \ ');
  ecriredecalle(' \ \_____\  \ \_____\  \ \_____\  \ \_\ \_\  \ \_____\  \ \_\ \ \_\  \ \_____\  \ \_\\"\_\');
  ecriredecalle('  \/_____/   \/_____/   \/_____/   \/_/\/_/   \/_____/   \/_/  \/_/   \/_____/   \/_/ \/_/');
  writeln;
  ecriredecalle('       ______   ______     ______       __     ______     ______     ______ ');
  ecriredecalle('      /\  == \ /\  == \   /\  __ \     /\ \   /\  ___\   /\  ___\   /\__  _\');
  ecriredecalle('      \ \  _-/ \ \  __<   \ \ \/\ \   _\_\ \  \ \  __\   \ \ \____  \/_/\ \/');
  ecriredecalle('       \ \_\    \ \_\ \_\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\');
  ecriredecalle('        \/_/     \/_/ /_/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/');
  writeln;
  writeln('  ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`    ''\/`');
  writeln('  (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)    (oo)');
  writeln(' (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)  (_`''_)');
  writeln('--_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_----_!!_--');
  writeln;
  Writeln('Bienvenue dans GEEKEMON - soumettez les tous !');
  writeln;
  ecrireDecalle('1 - Nouvelle Partie'); //on commence une nouvelle partie
  ecriredecalle('2 - Charger une partie');  //pour charger une partie si on a sauvegarder � l'ETDDG
  ecrireDecalle('3 - Param�tres');   //on change les param�tres
  ecrireDecalle('4 - Succ�s');
  ecrireDecalle('5 - Quitter');  //on quitte le jeu
  writeln;
  choix := lireDecalle;
  if (choix='1') then
    creationPerso;
  if (choix='2') then
    begin
    cls;
    if (fileexists('save1.txt')=TRUE) OR (fileexists('save2.txt')=TRUE) OR (fileexists('save3.txt')=TRUE) then
      charger
    else
      begin
      ecriredecalle('Il n''existe pas de partie sauvegard�e !');
      writeln;
      ecriredecalle('Pressez "Entr�e" pour continuer');
      readln;
      menuPrincipal;
      end;
    end;

  if (choix='3') then
    begin
    cls;
    parametre;
    end;
  if (choix='4') then MenuSucces ;
  if (choix='5') then
  end;
  end;

procedure creationPerso;

var
  sortie, sortie2, nom : string ;
  i : integer;

begin
  cls;
  lieusecretariat;
  writeln('Timidement, sac � l''�paule, vous rentrez dans le secr�tariat. Derri�re un grand bureau blanc, une femme est pench�e sur son ordinateur. En vous entendant rentrer, elle se tourne vers vous.');
  writeln;
  writeln('"Oui bonjour, c''est pour quoi ?"');
  writeln;
  ecriredecalle('1- "Bonjour, je suis bien au d�partement DDG ?"');
  readln(sortie) ;
  cls;

  while (sortie <> '1') do  //si on appuye sur une autre touche que 1, on repropose les choix pr�c�dents
    Begin
    lieusecretariat;
    writeln('Je n''ai pas compris...');
    writeln;
    ecriredecalle('1- Bonjour, je suis bien au d�partement DDG ?');
    readln(sortie) ;
    cls;
    End ;

  lieusecretariat;
  writeln('La secr�taire vous sourit et r�pond :');
  writeln;
  writeln('"Oui. Ah ! Vous devez �tre le nouvel �tudiant. Th�r�se, je suis la secr�taire du d�partement. Vos parents nous ont appel� pour nous dire que vous ne pourriez pas �tre pr�sent � la journ�e de rentr�e. ');
  writeln('J''ai besoin que vous remplissiez quelques papier pour finir votre inscription. Vous pouvez me rappeler votre nom ?"');
  writeln;

//Partie du code pour donner son nom qui sera m�moris� tout au long du jeu
  while (SORTIE2<>'1') do
    begin
    if (i>0) then
    lieusecretariat;
    Writeln('Quel est ton nom ?');
    Readln(pers.nomPerso);
    cls;
    lieusecretariat;
    Writeln('"',pers.nomPerso,', c''est bien �a ? "');
    Writeln('');
    ecriredecalle('1- Oui, c''est bien �a !');
    ecriredecalle('2- Non, je me suis tromp� !');
    Readln(SORTIE2);
    cls;
    while (sortie2<>'1') AND (sortie2<>'2') do  //si on appuye sur une autre touche que 1 ou 2, on repropose les choix pr�c�dents
      Begin
      lieusecretariat;
      writeln('Je n''ai pas compris...') ;
      writeln('');
      ecriredecalle('1- Oui, c"est bien �a !');
      ecriredecalle('2- Non, je me suis tromp� !');
      Readln(Sortie2);
      cls;
      i:=i+1;
      end;
    end;
//Fin de la partie d'enregistrement du nom

  lieusecretariat;
  Writeln('"Bien ! Afin de t''aider dans ton aventure, tu iras voir le professeur Ramp afin de choisir ton premier Geekemon et pour qu''il t''apprennes � te battre.');
  Writeln('Si tu as besoin de te reposer, sache qu''il y a la salle de l''ETDDG o� tu pourras acheter des potions et des snacks ! Si tu es en manque d''amis ou de combat, la caf�t�riat est l� pour toi.');
  Writeln('Bien, je te laisse te rendre dans la salle du professeur Ramp. C''est � droite en sortant, apr�s la salle de l''ETDDG."');
  Writeln('');
  ecriredecalle('1- Se diriger vers le couloir.');
  Readln(sortie);
  cls;
  while (sortie <> '1') do    //si on appuye sur une autre touche que 1, on repropose les choix pr�c�dents
    begin
    lieusecretariat;
    Writeln('Je ne peux pas faire �a !');
    Writeln('');
    ecriredecalle('1- Se diriger vers le couloir.');
    Readln(Sortie);
    cls;
    end;
  lieucouloir;
  ecriredecalle2('1-', l1.nomLieu); //Secr�tariat
  ecriredecalle2('2-',l2.nomLieu); //ETDDG
  ecriredecalle2('3-',l3.nomLieu); //Caf�t�riat
  ecriredecalle2('4-',l4.nomLieu); //Labo du professeur Ramp
  ecriredecalle2('5-',l5.nomLieu); //salle A
  ecriredecalle2('6-',l6.nomLieu); //salle B
  ecriredecalle2('7-',l7.nomLieu); //salle C
  ecriredecalle2('8-',l8.nomLieu); //salle D
  Readln(Sortie) ;
  cls;
  while (sortie<>'4') do   //si on appuye sur une autre touche que 2, on repropose les choix pr�c�dents
    Begin
    lieucouloir;
    Writeln('Pas tout de suite ...');
    Writeln('');
    ecriredecalle2('1-', l1.nomLieu); //Secr�tariat
    ecriredecalle2('2-',l2.nomLieu); //ETDDG
    ecriredecalle2('3-',l3.nomLieu); //Caf�t�riat
    ecriredecalle2('4-',l4.nomLieu); //Labo du professeur Ramp
    ecriredecalle2('5-',l5.nomLieu); //salle A
    ecriredecalle2('6-',l6.nomLieu); //salle B
    ecriredecalle2('7-',l7.nomLieu); //salle C
    ecriredecalle2('8-',l8.nomLieu); //salle D
    Readln(Sortie) ;
    cls;
    End;
  lieuRamp;
  Writeln('"Bienvenue dans le d�partement DDG : dressage de Geekemon. Ici, tu apprendras � devenir un dresseur de Geekemon. Mais attention, un grand nombre de ces cr�atures vivent � l''�tat sauvage dans ce b�timent.');
  writeln('Si tu veux pouvoir te promener en toute s�curit�, il te faut un premier Geekemon. Tu as de la chance, il m''en reste trois. A toi de choisir."');
  choixGeekemon; //on lance la proc�dure pour choisir son starter
  end;

Procedure choixGeekemon ;

var
  sortie, sortie2,choice : string;
  i : integer;

  begin
    while (sortie2<>'1') do
      Begin
        writeln;
        writeln('       ','1 - Geekeball n�1 - ',p1.nomGeekemon,', de type ',p1.elementGeekemon);
        writeln('       ','2 - Geekeball n�2 - ',p2.nomGeekemon,', de type ',p2.elementGeekemon);
        writeln('       ','3 - Geekeball n�3 - ',p3.nomGeekemon,', de type ',p3.elementGeekemon);
        Writeln('');
        Writeln('Lequel de ces Geekemons d�sires-tu ?');
        Readln(Sortie) ;
        cls;

        while (sortie<>'1') AND (sortie<>'2') AND (sortie<>'3') do   //si on appuye sur une autre touche que 1,2 ou 3, on repropose les choix pr�c�dents
          begin
            lieuramp;
            Writeln('Je n''ai pas compris !');
            writeln;
            writeln('       ','1 - Geekeball n�1 - ',p1.nomGeekemon,', de type ',p1.elementGeekemon);
            writeln('       ','2 - Geekeball n�2 - ',p2.nomGeekemon,', de type ',p2.elementGeekemon);
            writeln('       ','3 - Geekeball n�3 - ',p3.nomGeekemon,', de type ',p3.elementGeekemon);
            Writeln('');
            Writeln('Lequel de ces Geekemons d�sires-tu ?');
            Readln(Sortie) ;
            cls;
          end;
        lieuramp;
        Writeln('Es-tu s�r ? Tu ne pourras plus changer d''avis ! Ce Geekemon et toi serez li�s � jamais !');
        Writeln('');
        ecriredecalle('1- "Oui, j''en suis s�r !"');
        Writeln('');
        ecriredecalle('2- "Non, je veux changer d''avis !"');
        Readln(sortie2);

            cls;

            while (sortie2<>'1') AND (sortie2<>'2') do  //si on appuye sur une autre touche que 1 ou 2, on repropose les choix pr�c�dents
              Begin
                lieuramp;
                Writeln('Je n''ai rien compris !');
                Writeln('');
                ecriredecalle('1- "Oui, j''en suis s�r !"');
                Writeln('');
                ecriredecalle('2- "Non, je veux changer d''avis !"');
                Readln(sortie2);
                cls;
              End;
        if Sortie='1' then
        GPossede1:=p1;
        if Sortie='2' then
        GPossede1:=p2;
        if Sortie='3' then
        GPossede1:=p3;
      End;

    Lieuramp;
    Writeln('"Excellent choix ! Prends aussi ces quelques potions, cette carte du b�timent et ces cr�dits offerts par la maison, et va d�couvrir le b�timent ! Bonne chance, jeune dresseur !"');
    writeln;
    writeln('"Mais avant de partir veux-tu apprendre � capturer des Geekemons ?"');
    writeln;
    ecriredecalle('1 - Oui avec plaisir !');
    ecriredecalle('2 - Non merci');
    Readln(sortie);
    if (sortie='1') then tuto;
        if (sortie='2') then
        begin
        cls;
        d�placement;
        end;
    while (choice<>'1') AND (choice<>'2') do   //si on appuye sur une autre touche que 1 ou 2, on repropose les choix pr�c�dents
      Begin
        lieuRamp;
        Writeln('Je n''ai pas compris !');
        Writeln('');
        ecriredecalle('1 - Oui avec plaisir !');
        ecriredecalle('2 - Non merci');
        Readln(Sortie) ;
        if (sortie='1') then tuto;
        if (sortie='2') then
        begin
        cls;
        d�placement;
        end;          //on peut bouger librement une fois son nom et son Geekemon choisi
        cls;
      End;

  end;

procedure tuto;
var
sortie:String;
begin
Lieuramp;
writeln('Bien c''est avec grand plaisir que je vais t''apprendre � capturer les Geekemon ! (Au fond de lui le professeur Ramp esperait de tout coeur que vous partiez)');
writeln;
writeln('Si tu veux bien me suivre c''est par ici.');
writeln;
writeln('<Appuyer sur n''importe quelle touche pour continuer>');
readln;
Lieuramp;
writeln('Vous suivez le professeur Ramp dans une pi�ce situ�e juste � c�t� de son bureau.');
writeln;
writeln('Une �trange cr�ature se trouvait juste devant lui, c''est alors que le professeur Ramp appela une de ces cr�atures.');
writeln;
writeln('Observe moi bien car je ne te montrerais pas deux fois comment faire !');
writeln;
writeln('<Appuyer sur n''importe quelle touche pour continuer>');
readln;
habillageCombat;
  nomGeekemon := p17.nomGeekemon;
  attackGeekemon := p17.nomAttackGeekemon;
  hpGeekemon := p17.hpGeekemon;
  hpInitiauxGeekemon := p17.hpMaxGeekemon;
  degatsGeekemon := p17.degatsGeekemon;

  nomGAdversaire := p4.nomGeekemon;
  attackGAdversaire := p4.nomAttackGeekemon;
  hpInitiauxADV := p4.hpMaxGeekemon;
  hpGAdversaire := p4.hpMaxGeekemon;
  degatsGAdversaire := p4.degatsGeekemon;

  write('Le Geekemon sauvage : ');
  write(nomGAdversaire);
  writeln(' se pr�pare au combat. ');
  writeln;
  write('Votre Geekemon : ');
  write(nomGeekemon);
  writeln(' se pr�pare au combat. ');
  readln;
  FightDisplayTuto;
  LieuRamp;
  writeln('"Une fois un Geekemon captur�, il rejoint ton �quipe si tu as encore de la place ou rejoint le PC si tu n''en a pas !"');
  writeln;
  writeln('"Rappelle toi que tu n''as que 4 places dans ton �quipe. Maintenant, pars explorer le b�timent jeune dresseur !"');
  writeln;
  ecriredecalle('1 - Merci pour tout Professeur Ramp !');
  Readln(Sortie);
  while (Sortie<>'1') do
  begin
    LieuRamp;
    writeln('Je n''ai pas compris');
    writeln;
    ecriredecalle('1 - Merci pour tout Professeur Ramp !');
    readln(Sortie);
  end;
  cls;
d�placement;
end;

procedure FightDisplayTuto;
var
i:Integer;

begin
  for i:=0 to 2 do
  begin
    cls;
    habillageCombat;
    writeln;
    writeln(nomGeekemon, ' : ', hpGeekemon, 'PV, ', degatsGeekemon, ' D�gats d''attaque ', '(Bouclier de ', shieldGeekemon, ')');
    writeln;
    writeln(nomGAdversaire, ' : ', hpGAdversaire, 'PV, ', degatsGAdversaire, ' D�gats d''attaque ', '(Bouclier de ', shieldGAdversaire, ')');
    writeln;
    write('C''est � ');
    write(nomGeekemon);
    writeln(' d''agir, que souhaitez vous faire ?');
    writeln;
    ecrireDecalle('1 - Attaquer');
    ecrireDecalle('2 - D�fendre');
    ecrireDecalle('3 - Lancer une Geekeball');
    writeln('           4 - Utiliser une potion');
    ecrireDecalle('5 - Selectionner un autre Geekemon');
    ecrireDecalle('6 - Fuire le combat');
    if (i=0) then
    begin
    writeln;
    writeln('Il faut d''abord affaiblir le Geekemon adverse pour avoir plus de chance de le capturer !');
    choix := '1';
    readln;
    end
    else if (i=1) then
    begin
      writeln;
      writeln('Il n''est pas encore assez faible !');
      choix := '1';
      readln;
    end
    else if (i=2) then
    begin
      writeln;
      writeln('C''est le moment de lancer une Geekeball !');
      choix:= '3';
      readln;
    end;
    if choix = '1' then attaqueTuto;
    if choix = '2' then defense;
    if choix = '3' then GeekeballTuto;
    if choix = '4' then potionCombat;
    if choix = '5' then selection;
  end;
end;

procedure attaqueTuto;
begin
  cls;
  hpGAdversaire := hpGAdversaire - degatsGeekemon;
  habillageCombat;
  writeln(nomGeekemon, ' utilise ', attackGeekemon, ' !');
  writeln(nomGAdversaire, ' perd ', degatsGeekemon, ' PV !');
  writeln;
  if (hpGeekemon <= 0) OR (hpGAdversaire <= 0) then
  begin
    writeln('Le ', nomGadversaire, ' adverse est K.O. !');
  end
  else
  begin
    riposteTuto;
  end;
end;

procedure GeekeballTuto;
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
  ProbaGeekeball:= 0;
  if ProbaGeekeball<>0 then
  begin
    writeln('Echec !');
    riposte;
  end
  else
  begin
    writeln('Le Geekemon a �t� captur� !');
    readln;
  end;
end;

procedure riposteTuto;
begin
  Sleep(500);
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

end.

