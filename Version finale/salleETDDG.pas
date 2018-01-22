unit salleETDDG;

interface procedure ETDDG;
          procedure pauvre;
          procedure affichageETDDG;
          procedure affichageSalle;
          function potion(n:integer):Integer;
          function argent(n:integer):Integer;
          procedure soin;
          procedure soinForcé;
          procedure PC;
          procedure sauvegarde;

implementation
uses Fonctions, fichePerso, Donnees,donneesLieuAvancee, FightInterface,FonctionsDeplacementAvancee, succes,SysUtils;

procedure ETDDG;

var
actionDDG:String;
n: integer;

begin
  while (actionDDG<>'6') do
    begin
    affichageETDDG;
    readln(actionDDG);
      if actionDDG='1' then
        begin
          affichageSalle;
          soin;
          affichageETDDG;
          readln(actionDDG);
        end;
      if (actionDDG='2') then
        begin
          if pers.argentPerso>=60 then
            begin
              n:=-60;
              argent(n);
              n:=1;
              potion(n);
            end
            else
              pauvre();
              affichageETDDG;
        end;
      if (actionDDG='3') then
        begin
        affichageSalle;
        PC;
        end;
      if (actionDDG='4') then
        begin
        affichageSalle;
        sauvegarde;
        end;
      if (actionDDG='5') then affichageCarte(l2.idlieu);
      if ((actionDDG<>'1') AND (actionDDG<>'2') AND (actionDDG<>'3') AND (actionDDG='4') AND (actionDDG='5')) then
        begin
          affichageSalle;
          writeln('"Je n''ai pas compris peux-tu répéter s''il te plait"');
          writeln;
          writeln('"Appuyez sur entrée pour continuer"');
          readln;
          affichageETDDG;
          readln(actionDDG);
        end;
    end;
  affichageSalle;
  writeln('"Au revoir et à bientôt"');
  readln;
  cls;
  déplacement;

end;

procedure pauvre;
begin
  affichageSalle;
  writeln('"Désolé, tu n''as pas assez de geekedollar"');
  writeln;
  writeln('"Appuyez sur entrée pour continuer"');
  readln;
end;

procedure affichageETDDG;
var
actionDDG:integer;

begin
  affichageSalle;
  writeln('Vous rentrez dans une salle ou de nombreux étudiants sont présents. Certains sont assis autour d''une table et dsicutent, d''autre sont assis dans un canapé et joue à un jeu vidéo. L''un d''entre eux, visiblement en deuxième année s''avance vers vous.');
  writeln;
  writeln('"Bonjour,je suis David G., président de l''ETDDG, association des étudiants du département DDG. Bienvenu à toi. Dans cette salle, tu peux te reposer un peu et soigner tes geekemons ou encore nous acheter des consoma...potions.');
  writeln ('Il y a également un PC où tu pourras stocker jusqu''à 10 Geekemon.');
  writeln;
  write('Vous avez ');
  write(pers.argentPerso);
  write(' geekedollars et ');
  write(pers.potionPerso);
  writeln(' potions');
  writeln;
  ecriredecalle('1 - Se reposer');
  ecriredecalle('2 - Acheter des potions (60 geekedollars)');
  ecriredecalle('3 - Acces au PC');
  ecriredecalle('4 - Sauvegarder');
  ecriredecalle('5 - Carte');
  ecriredecalle('6 - Sortir de la salle');
end;

procedure affichageSalle;
begin
  cls;
  writeln;
  write(' ');
  writeln('Lieu : Salle de l''ETDDG');
  writeln;
  writeln('------------------------------------------------------------------------------------------------------------------------');
  writeln;
end;

function potion(n:integer):Integer;

begin
  pers.potionPerso:=pers.potionPerso+n;
  pers.potionAchete:=pers.potionAchete+1; //on compte le nombre de potion achetées
  verifSucces;
end;

function argent(n:integer):Integer;
begin
  pers.argentPerso:=pers.argentPerso+n
end;

procedure soin;
begin
  GPossede1.hpGeekemon:=GPossede1.hpMaxGeekemon;
  GPossede2.hpGeekemon:=GPossede2.hpMaxGeekemon;
  GPossede3.hpGeekemon:=GPossede3.hpMaxGeekemon;
  GPossede4.hpGeekemon:=GPossede4.hpMaxGeekemon;
  writeln('Vos geekemons ont été soignés');
  writeln;
  writeln('"Appuyez sur entrée pour continuer"');
  readln;
end;

procedure soinForcé;
begin
  AffichageSalle;
  GPossede1.hpGeekemon:=GPossede1.hpMaxGeekemon;
  GPossede2.hpGeekemon:=GPossede2.hpMaxGeekemon;
  GPossede3.hpGeekemon:=GPossede3.hpMaxGeekemon;
  GPossede4.hpGeekemon:=GPossede4.hpMaxGeekemon;
  writeln('Vos geekemons ont été soignés');
  writeln;
  writeln('"Appuyez sur entrée pour continuer"');
  readln;
  ETDDG;
end;

procedure PC;
var
choixPC:Integer;
choixEquipe:Integer;

begin
  cls;
  affichageSalle;
  if (GPC1=p0) then
  begin
    writeln('Pas de Geekemon dans le PC');
    readln;
    ETDDG;
  end
  else
  begin
    writeln('Prendre quel Geekemon ?');
    if (GPC1<>p0) then writeln ('1 - ',GPC1.nomGeekemon);
    if (GPC2<>p0) then writeln ('2 - ',GPC2.nomGeekemon);
    if (GPC3<>p0) then writeln ('3 - ',GPC3.nomGeekemon);
    if (GPC4<>p0) then writeln ('4 - ',GPC4.nomGeekemon);
    if (GPC5<>p0) then writeln ('5 - ',GPC5.nomGeekemon);
    if (GPC6<>p0) then writeln ('6 - ',GPC6.nomGeekemon);
    if (GPC7<>p0) then writeln ('7 - ',GPC7.nomGeekemon);
    if (GPC8<>p0) then writeln ('8 - ',GPC8.nomGeekemon);
    if (GPC9<>p0) then writeln ('9 - ',GPC9.nomGeekemon);
    if (GPC10<>p0) then writeln ('10 - ',GPC10.nomGeekemon);
    writeln('11 - Quitter le PC');
  end;
  readln(choixPC);
  if (choixPC=1) AND (GPC1<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekemon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC1;
      GPC1:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC1;
      GPC1:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC1;
      GPC1:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC1;
      GPC1:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=2) AND (GPC2<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekemon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC2;
      GPC2:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC2;
      GPC2:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC2;
      GPC2:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC2;
      GPC2:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=3) AND (GPC3<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekemon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC3;
      GPC3:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC3;
      GPC3:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC3;
      GPC3:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC3;
      GPC3:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=4) AND (GPC4<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC4;
      GPC4:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC4;
      GPC4:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC4;
      GPC4:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC4;
      GPC4:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=5) AND (GPC5<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC5;
      GPC5:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC5;
      GPC5:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC5;
      GPC5:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC5;
      GPC5:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=6) AND (GPC6<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC6;
      GPC6:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC6;
      GPC6:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC6;
      GPC6:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC6;
      GPC6:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=7) AND (GPC1<>p7) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC7;
      GPC7:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC7;
      GPC7:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC7;
      GPC7:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC7;
      GPC7:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=8) AND (GPC8<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC8;
      GPC8:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC8;
      GPC8:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC8;
      GPC8:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC8;
      GPC8:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=9) AND (GPC9<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC9;
      GPC9:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC9;
      GPC9:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC9;
      GPC9:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC9;
      GPC9:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=10) AND (GPC10<>p0) then
  begin
    cls;
    affichageSalle;
    writeln('Remplacer quel Geekmon ?');
    writeln;
    writeln('1 - ',GPossede1.nomGeekemon);
    writeln('2 - ',GPossede2.nomGeekemon);
    writeln('3 - ',GPossede3.nomGeekemon);
    writeln('4 - ',GPossede4.nomGeekemon);
    writeln('5 - Ne pas remplacer');
    readln(choixEquipe);
    if (choixEquipe=1) then
    begin
      GInter:=GPossede1;
      GPossede1:=GPC10;
      GPC10:=GInter;
    end;
    if (choixEquipe=2) then
    begin
      GInter:=GPossede2;
      GPossede2:=GPC10;
      GPC10:=GInter;
    end;
    if (choixEquipe=3) then
    begin
      GInter:=GPossede3;
      GPossede3:=GPC10;
      GPC10:=GInter;
    end;
    if (choixEquipe=4) then
    begin
      GInter:=GPossede4;
      GPossede4:=GPC10;
      GPC10:=GInter;
    end;
    if (choixEquipe=5) then PC;
  end;
    if (choixPC=11) then ETDDG
  else
  begin
    cls;
    affichageSalle;
    writeln('Le PC à planté !');
    readln;
    ETDDG;
  end;
end;

procedure sauvegarde;
var
  choix : char;
  save1, save2, save3 : Text;                                        //Déclaration des liens des fichiers de sauvegarde
begin
while (choix<>'1') AND (choix<>'2') AND (choix<>'3') AND (choix<>'4') do
  begin
  affichageSalle;
  assign(save1, 'save1.txt');                                        //Assignation des liens vers les fichiers texte
  assign(save2, 'save2.txt');
  assign(save3, 'save3.txt');
  writeln('Dans quel slot veux tu sauvegarder ? Cela écrasera la partie enrgistrée dans le slot)');
  if (fileexists('save1.txt') = TRUE) then ecriredecalle('1 - Slot 1')     //test : le fichier de sauvegarde existe-t-il ?
  else ecriredecalle('1 - Slot 1 (VIDE)');
  if (fileexists('save2.txt') = TRUE) then ecriredecalle('2 - Slot 2')
  else ecriredecalle('2 - Slot 2 (VIDE)');
  if (fileexists('save3.txt') = TRUE) then ecriredecalle('3 - Slot 3')
  else ecriredecalle('3 - Slot 3 (VIDE)');
  writeln;
  ecriredecalle('4 - Annuler');
  readln(choix);
  cls;
  if (choix='4') then
  end;

  case choix of
  '1' :
    begin
      rewrite(save1);                                 //chargement du fichier de sauvegarde en écriture
      writeln(save1, Pers.nomPerso);                  //Ecriture du nom du personnage, puis saut de ligne
      writeln(save1, Pers.argentPerso);               //Ecriture de l'argent du personnage, puis saut de ligne
      writeln(save1, Pers.potionPerso);               //Ecriture du nombre de potions du personnage, puis saut de ligne
      writeln(save1, Pers.potionAchete);              //Ecriture du nombre de potions achetées pour le succès
      writeln(save1, Pers.colorPerso);                //Ecriture de la couleur de fond d'écrandu personnage, puis saut de ligne
      writeln(save1, Pers.fondPerso);                 //Ecriture de la couleur de police du personnage, puis saut de ligne
      writeln(save1, Pers.succes1);                   //Ecriture de la reussite ou non des succès
      writeln(save1, Pers.succes2);
      writeln(save1, Pers.succes3);
      writeln(save1, Pers.succes4);
      writeln(save1, '-------------');                //Transition
      writeln(save1, d1.VictoireDresseur);            //Ecriture de l'information si le dresseur a été battu ou non
      writeln(save1, d2.VictoireDresseur);
      writeln(save1, d3.VictoireDresseur);
      writeln(save1, d4.VictoireDresseur);
      writeln(save1, '-------------');
      writeln(save1, GPossede1.nomGeekemon);          //Ecriture du nom du Geekemon, puis saut de ligne
      writeln(save1, GPossede1.elementGeekemon);      //Ecriture de l'élément du Geekemon, puis saut de ligne
      writeln(save1, GPossede1.nomAttackGeekemon);    //Ecriture du nom de l'attaque du Geekemon, puis saut de ligne
      writeln(save1, GPossede1.hpGeekemon);           //Ecriture du nombre d'HP du Geekemon, puis saut de ligne
      writeln(save1, GPossede1.hpMaxGeekemon);        //Ecriture du nombre d'HPMax du Geekemon, puis saut de ligne
      writeln(save1, GPossede1.degatsGeekemon);       //Ecriture des dégats du Geekemon, puis saut de ligne
      writeln(save1, GPossede1.idGeekemon);           //Ecriture de l'ID du Geekemon, puis saut de ligne
      writeln(save1, '-------------');
      writeln(save1, GPossede2.nomGeekemon);
      writeln(save1, GPossede2.elementGeekemon);
      writeln(save1, GPossede2.nomAttackGeekemon);
      writeln(save1, GPossede2.hpGeekemon);
      writeln(save1, GPossede2.hpMaxGeekemon);
      writeln(save1, GPossede2.degatsGeekemon);
      writeln(save1, GPossede2.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPossede3.nomGeekemon);
      writeln(save1, GPossede3.elementGeekemon);
      writeln(save1, GPossede3.nomAttackGeekemon);
      writeln(save1, GPossede3.hpGeekemon);
      writeln(save1, GPossede3.hpMaxGeekemon);
      writeln(save1, GPossede3.degatsGeekemon);
      writeln(save1, GPossede3.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPossede4.nomGeekemon);
      writeln(save1, GPossede4.elementGeekemon);
      writeln(save1, GPossede4.nomAttackGeekemon);
      writeln(save1, GPossede4.hpGeekemon);
      writeln(save1, GPossede4.hpMaxGeekemon);
      writeln(save1, GPossede4.degatsGeekemon);
      writeln(save1, GPossede4.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC1.nomGeekemon);
      writeln(save1, GPC1.elementGeekemon);
      writeln(save1, GPC1.nomAttackGeekemon);
      writeln(save1, GPC1.hpGeekemon);
      writeln(save1, GPC1.hpMaxGeekemon);
      writeln(save1, GPC1.degatsGeekemon);
      writeln(save1, GPC1.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC2.nomGeekemon);
      writeln(save1, GPC2.elementGeekemon);
      writeln(save1, GPC2.nomAttackGeekemon);
      writeln(save1, GPC2.hpGeekemon);
      writeln(save1, GPC2.hpMaxGeekemon);
      writeln(save1, GPC2.degatsGeekemon);
      writeln(save1, GPC2.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC3.nomGeekemon);
      writeln(save1, GPC3.elementGeekemon);
      writeln(save1, GPC3.nomAttackGeekemon);
      writeln(save1, GPC3.hpGeekemon);
      writeln(save1, GPC3.hpMaxGeekemon);
      writeln(save1, GPC3.degatsGeekemon);
      writeln(save1, GPC3.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC4.nomGeekemon);
      writeln(save1, GPC4.elementGeekemon);
      writeln(save1, GPC4.nomAttackGeekemon);
      writeln(save1, GPC4.hpGeekemon);
      writeln(save1, GPC4.hpMaxGeekemon);
      writeln(save1, GPC4.degatsGeekemon);
      writeln(save1, GPC4.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC5.nomGeekemon);
      writeln(save1, GPC5.elementGeekemon);
      writeln(save1, GPC5.nomAttackGeekemon);
      writeln(save1, GPC5.hpGeekemon);
      writeln(save1, GPC5.hpMaxGeekemon);
      writeln(save1, GPC5.degatsGeekemon);
      writeln(save1, GPC5.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC6.nomGeekemon);
      writeln(save1, GPC6.elementGeekemon);
      writeln(save1, GPC6.nomAttackGeekemon);
      writeln(save1, GPC6.hpGeekemon);
      writeln(save1, GPC6.hpMaxGeekemon);
      writeln(save1, GPC6.degatsGeekemon);
      writeln(save1, GPC6.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC7.nomGeekemon);
      writeln(save1, GPC7.elementGeekemon);
      writeln(save1, GPC7.nomAttackGeekemon);
      writeln(save1, GPC7.hpGeekemon);
      writeln(save1, GPC7.hpMaxGeekemon);
      writeln(save1, GPC7.degatsGeekemon);
      writeln(save1, GPC7.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC8.nomGeekemon);
      writeln(save1, GPC8.elementGeekemon);
      writeln(save1, GPC8.nomAttackGeekemon);
      writeln(save1, GPC8.hpGeekemon);
      writeln(save1, GPC8.hpMaxGeekemon);
      writeln(save1, GPC8.degatsGeekemon);
      writeln(save1, GPC8.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC9.nomGeekemon);
      writeln(save1, GPC9.elementGeekemon);
      writeln(save1, GPC9.nomAttackGeekemon);
      writeln(save1, GPC9.hpGeekemon);
      writeln(save1, GPC9.hpMaxGeekemon);
      writeln(save1, GPC9.degatsGeekemon);
      writeln(save1, GPC9.idGeekemon);
      writeln(save1, '-------------');
      writeln(save1, GPC10.nomGeekemon);
      writeln(save1, GPC10.elementGeekemon);
      writeln(save1, GPC10.nomAttackGeekemon);
      writeln(save1, GPC10.hpGeekemon);
      writeln(save1, GPC10.hpMaxGeekemon);
      writeln(save1, GPC10.degatsGeekemon);
      writeln(save1, GPC10.idGeekemon);
      close(save1);                                   //Enregistrement des changements et fermeture du fichier
    end;

  '2' :
    begin
      rewrite(save2);                                 //chargement du fichier de sauvegarde en écriture
      writeln(save2, Pers.nomPerso);                  //Ecriture du nom du personnage, puis saut de ligne
      writeln(save2, Pers.argentPerso);               //Ecriture de l'argent du personnage, puis saut de ligne
      writeln(save2, Pers.potionPerso);               //Ecriture du nombre de potions du personnage, puis saut de ligne
      writeln(save2, Pers.potionAchete);              //Ecriture du nombre de potions achetées pour le succès
      writeln(save2, Pers.colorPerso);                //Ecriture de la couleur de fond d'écrandu personnage, puis saut de ligne
      writeln(save2, Pers.fondPerso);                 //Ecriture de la couleur de police du personnage, puis saut de ligne
      writeln(save2, Pers.succes1);                   //Ecriture de la reussite ou non des succès
      writeln(save2, Pers.succes2);
      writeln(save2, Pers.succes3);
      writeln(save2, Pers.succes4);
      writeln(save2, '-------------');                //Transition
      writeln(save2, d1.VictoireDresseur);            //Ecriture de l'information si le dresseur a été battu ou non
      writeln(save2, d2.VictoireDresseur);
      writeln(save2, d3.VictoireDresseur);
      writeln(save2, d4.VictoireDresseur);
      writeln(save2, '-------------');
      writeln(save2, GPossede1.nomGeekemon);          //Ecriture du nom du Geekemon, puis saut de ligne
      writeln(save2, GPossede1.elementGeekemon);      //Ecriture de l'élément du Geekemon, puis saut de ligne
      writeln(save2, GPossede1.nomAttackGeekemon);    //Ecriture du nom de l'attaque du Geekemon, puis saut de ligne
      writeln(save2, GPossede1.hpGeekemon);           //Ecriture du nombre d'HP du Geekemon, puis saut de ligne
      writeln(save2, GPossede1.hpMaxGeekemon);        //Ecriture du nombre d'HPMax du Geekemon, puis saut de ligne
      writeln(save2, GPossede1.degatsGeekemon);       //Ecriture des dégats du Geekemon, puis saut de ligne
      writeln(save2, GPossede1.idGeekemon);           //Ecriture de l'ID du Geekemon, puis saut de ligne
      writeln(save2, '-------------');
      writeln(save2, GPossede2.nomGeekemon);
      writeln(save2, GPossede2.elementGeekemon);
      writeln(save2, GPossede2.nomAttackGeekemon);
      writeln(save2, GPossede2.hpGeekemon);
      writeln(save2, GPossede2.hpMaxGeekemon);
      writeln(save2, GPossede2.degatsGeekemon);
      writeln(save2, GPossede2.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPossede3.nomGeekemon);
      writeln(save2, GPossede3.elementGeekemon);
      writeln(save2, GPossede3.nomAttackGeekemon);
      writeln(save2, GPossede3.hpGeekemon);
      writeln(save2, GPossede3.hpMaxGeekemon);
      writeln(save2, GPossede3.degatsGeekemon);
      writeln(save2, GPossede3.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPossede4.nomGeekemon);
      writeln(save2, GPossede4.elementGeekemon);
      writeln(save2, GPossede4.nomAttackGeekemon);
      writeln(save2, GPossede4.hpGeekemon);
      writeln(save2, GPossede4.hpMaxGeekemon);
      writeln(save2, GPossede4.degatsGeekemon);
      writeln(save2, GPossede4.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC1.nomGeekemon);
      writeln(save2, GPC1.elementGeekemon);
      writeln(save2, GPC1.nomAttackGeekemon);
      writeln(save2, GPC1.hpGeekemon);
      writeln(save2, GPC1.hpMaxGeekemon);
      writeln(save2, GPC1.degatsGeekemon);
      writeln(save2, GPC1.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC2.nomGeekemon);
      writeln(save2, GPC2.elementGeekemon);
      writeln(save2, GPC2.nomAttackGeekemon);
      writeln(save2, GPC2.hpGeekemon);
      writeln(save2, GPC2.hpMaxGeekemon);
      writeln(save2, GPC2.degatsGeekemon);
      writeln(save2, GPC2.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC3.nomGeekemon);
      writeln(save2, GPC3.elementGeekemon);
      writeln(save2, GPC3.nomAttackGeekemon);
      writeln(save2, GPC3.hpGeekemon);
      writeln(save2, GPC3.hpMaxGeekemon);
      writeln(save2, GPC3.degatsGeekemon);
      writeln(save2, GPC3.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC4.nomGeekemon);
      writeln(save2, GPC4.elementGeekemon);
      writeln(save2, GPC4.nomAttackGeekemon);
      writeln(save2, GPC4.hpGeekemon);
      writeln(save2, GPC4.hpMaxGeekemon);
      writeln(save2, GPC4.degatsGeekemon);
      writeln(save2, GPC4.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC5.nomGeekemon);
      writeln(save2, GPC5.elementGeekemon);
      writeln(save2, GPC5.nomAttackGeekemon);
      writeln(save2, GPC5.hpGeekemon);
      writeln(save2, GPC5.hpMaxGeekemon);
      writeln(save2, GPC5.degatsGeekemon);
      writeln(save2, GPC5.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC6.nomGeekemon);
      writeln(save2, GPC6.elementGeekemon);
      writeln(save2, GPC6.nomAttackGeekemon);
      writeln(save2, GPC6.hpGeekemon);
      writeln(save2, GPC6.hpMaxGeekemon);
      writeln(save2, GPC6.degatsGeekemon);
      writeln(save2, GPC6.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC7.nomGeekemon);
      writeln(save2, GPC7.elementGeekemon);
      writeln(save2, GPC7.nomAttackGeekemon);
      writeln(save2, GPC7.hpGeekemon);
      writeln(save2, GPC7.hpMaxGeekemon);
      writeln(save2, GPC7.degatsGeekemon);
      writeln(save2, GPC7.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC8.nomGeekemon);
      writeln(save2, GPC8.elementGeekemon);
      writeln(save2, GPC8.nomAttackGeekemon);
      writeln(save2, GPC8.hpGeekemon);
      writeln(save2, GPC8.hpMaxGeekemon);
      writeln(save2, GPC8.degatsGeekemon);
      writeln(save2, GPC8.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC9.nomGeekemon);
      writeln(save2, GPC9.elementGeekemon);
      writeln(save2, GPC9.nomAttackGeekemon);
      writeln(save2, GPC9.hpGeekemon);
      writeln(save2, GPC9.hpMaxGeekemon);
      writeln(save2, GPC9.degatsGeekemon);
      writeln(save2, GPC9.idGeekemon);
      writeln(save2, '-------------');
      writeln(save2, GPC10.nomGeekemon);
      writeln(save2, GPC10.elementGeekemon);
      writeln(save2, GPC10.nomAttackGeekemon);
      writeln(save2, GPC10.hpGeekemon);
      writeln(save2, GPC10.hpMaxGeekemon);
      writeln(save2, GPC10.degatsGeekemon);
      writeln(save2, GPC10.idGeekemon);
      close(save2);
    end;

  '3' :
    begin
      rewrite(save3);                                 //chargement du fichier de sauvegarde en écriture
      writeln(save3, Pers.nomPerso);                  //Ecriture du nom du personnage, puis saut de ligne
      writeln(save3, Pers.argentPerso);               //Ecriture de l'argent du personnage, puis saut de ligne
      writeln(save3, Pers.potionPerso);               //Ecriture du nombre de potions du personnage, puis saut de ligne
      writeln(save3, Pers.potionAchete);              //Ecriture du nombre de potions achetées pour le succès
      writeln(save3, Pers.colorPerso);                //Ecriture de la couleur de fond d'écrandu personnage, puis saut de ligne
      writeln(save3, Pers.fondPerso);                 //Ecriture de la couleur de police du personnage, puis saut de ligne
      writeln(save3, Pers.succes1);                   //Ecriture de la reussite ou non des succès
      writeln(save3, Pers.succes2);
      writeln(save3, Pers.succes3);
      writeln(save3, Pers.succes4);
      writeln(save3, '-------------');                //Transition
      writeln(save3, d1.VictoireDresseur);            //Ecriture de l'information si le dresseur a été battu ou non
      writeln(save3, d2.VictoireDresseur);
      writeln(save3, d3.VictoireDresseur);
      writeln(save3, d4.VictoireDresseur);
      writeln(save3, '-------------');
      writeln(save3, GPossede1.nomGeekemon);          //Ecriture du nom du Geekemon, puis saut de ligne
      writeln(save3, GPossede1.elementGeekemon);      //Ecriture de l'élément du Geekemon, puis saut de ligne
      writeln(save3, GPossede1.nomAttackGeekemon);    //Ecriture du nom de l'attaque du Geekemon, puis saut de ligne
      writeln(save3, GPossede1.hpGeekemon);           //Ecriture du nombre d'HP du Geekemon, puis saut de ligne
      writeln(save3, GPossede1.hpMaxGeekemon);        //Ecriture du nombre d'HPMax du Geekemon, puis saut de ligne
      writeln(save3, GPossede1.degatsGeekemon);       //Ecriture des dégats du Geekemon, puis saut de ligne
      writeln(save3, GPossede1.idGeekemon);           //Ecriture de l'ID du Geekemon, puis saut de ligne
      writeln(save3, '-------------');
      writeln(save3, GPossede2.nomGeekemon);
      writeln(save3, GPossede2.elementGeekemon);
      writeln(save3, GPossede2.nomAttackGeekemon);
      writeln(save3, GPossede2.hpGeekemon);
      writeln(save3, GPossede2.hpMaxGeekemon);
      writeln(save3, GPossede2.degatsGeekemon);
      writeln(save3, GPossede2.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPossede3.nomGeekemon);
      writeln(save3, GPossede3.elementGeekemon);
      writeln(save3, GPossede3.nomAttackGeekemon);
      writeln(save3, GPossede3.hpGeekemon);
      writeln(save3, GPossede3.hpMaxGeekemon);
      writeln(save3, GPossede3.degatsGeekemon);
      writeln(save3, GPossede3.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPossede4.nomGeekemon);
      writeln(save3, GPossede4.elementGeekemon);
      writeln(save3, GPossede4.nomAttackGeekemon);
      writeln(save3, GPossede4.hpGeekemon);
      writeln(save3, GPossede4.hpMaxGeekemon);
      writeln(save3, GPossede4.degatsGeekemon);
      writeln(save3, GPossede4.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC1.nomGeekemon);
      writeln(save3, GPC1.elementGeekemon);
      writeln(save3, GPC1.nomAttackGeekemon);
      writeln(save3, GPC1.hpGeekemon);
      writeln(save3, GPC1.hpMaxGeekemon);
      writeln(save3, GPC1.degatsGeekemon);
      writeln(save3, GPC1.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC2.nomGeekemon);
      writeln(save3, GPC2.elementGeekemon);
      writeln(save3, GPC2.nomAttackGeekemon);
      writeln(save3, GPC2.hpGeekemon);
      writeln(save3, GPC2.hpMaxGeekemon);
      writeln(save3, GPC2.degatsGeekemon);
      writeln(save3, GPC2.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC3.nomGeekemon);
      writeln(save3, GPC3.elementGeekemon);
      writeln(save3, GPC3.nomAttackGeekemon);
      writeln(save3, GPC3.hpGeekemon);
      writeln(save3, GPC3.hpMaxGeekemon);
      writeln(save3, GPC3.degatsGeekemon);
      writeln(save3, GPC3.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC4.nomGeekemon);
      writeln(save3, GPC4.elementGeekemon);
      writeln(save3, GPC4.nomAttackGeekemon);
      writeln(save3, GPC4.hpGeekemon);
      writeln(save3, GPC4.hpMaxGeekemon);
      writeln(save3, GPC4.degatsGeekemon);
      writeln(save3, GPC4.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC5.nomGeekemon);
      writeln(save3, GPC5.elementGeekemon);
      writeln(save3, GPC5.nomAttackGeekemon);
      writeln(save3, GPC5.hpGeekemon);
      writeln(save3, GPC5.hpMaxGeekemon);
      writeln(save3, GPC5.degatsGeekemon);
      writeln(save3, GPC5.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC6.nomGeekemon);
      writeln(save3, GPC6.elementGeekemon);
      writeln(save3, GPC6.nomAttackGeekemon);
      writeln(save3, GPC6.hpGeekemon);
      writeln(save3, GPC6.hpMaxGeekemon);
      writeln(save3, GPC6.degatsGeekemon);
      writeln(save3, GPC6.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC7.nomGeekemon);
      writeln(save3, GPC7.elementGeekemon);
      writeln(save3, GPC7.nomAttackGeekemon);
      writeln(save3, GPC7.hpGeekemon);
      writeln(save3, GPC7.hpMaxGeekemon);
      writeln(save3, GPC7.degatsGeekemon);
      writeln(save3, GPC7.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC8.nomGeekemon);
      writeln(save3, GPC8.elementGeekemon);
      writeln(save3, GPC8.nomAttackGeekemon);
      writeln(save3, GPC8.hpGeekemon);
      writeln(save3, GPC8.hpMaxGeekemon);
      writeln(save3, GPC8.degatsGeekemon);
      writeln(save3, GPC8.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC9.nomGeekemon);
      writeln(save3, GPC9.elementGeekemon);
      writeln(save3, GPC9.nomAttackGeekemon);
      writeln(save3, GPC9.hpGeekemon);
      writeln(save3, GPC9.hpMaxGeekemon);
      writeln(save3, GPC9.degatsGeekemon);
      writeln(save3, GPC9.idGeekemon);
      writeln(save3, '-------------');
      writeln(save3, GPC10.nomGeekemon);
      writeln(save3, GPC10.elementGeekemon);
      writeln(save3, GPC10.nomAttackGeekemon);
      writeln(save3, GPC10.hpGeekemon);
      writeln(save3, GPC10.hpMaxGeekemon);
      writeln(save3, GPC10.degatsGeekemon);
      writeln(save3, GPC10.idGeekemon);
      close(save3);
    end;
  end;
if ((choix='1') OR (choix='2') OR (choix='3')) then
  begin
  writeln('Partie Sauvegardée !');
  readln;
  end;
  ETDDG;
end;
end.


