unit Menus;

interface
  procedure menuPrincipal; //Proc�dure qui invite � lancer une partie ou quitter le jeu
  procedure creationPerso; //proc�dure qui permet de nommer son personnage au secr�tariat
  procedure choixgeekemon; //proc�dure qui permet de choisir son premier Geekemon dans le labo de Ramp

implementation
uses Fonctions, fichePerso,fonctionsd�placementMinimale,Donnees, gestionEcran, donneeslieuMinimale;

procedure menuPrincipal;    //menu principal du jeu
var
  choix: String;

begin
  cls;
  writeln;
  Writeln('Bienvenue dans GEEKEMON - soumettez les tous !');
  writeln;
  ecrireDecalle('1 - Nouvelle Partie');
  ecrireDecalle('2 - Quitter');
  writeln;
  choix := lireDecalle;
  if (choix='1') then     //on lance le jeu
    begin
    creationPerso;        //on personnalise le perso
    d�placement;          //on peut bouger librement une fois son nom et son Geekemon choisi
    end;
  if (choix='2') then     //on ne fait rien et le programme se ferme

end;

procedure creationPerso; //Procedure permettant de donner son nom et de le m�moriser

var
  sortie, sortie2, nom : string ;
  i : integer;

begin
  cls;
  writeln('Timidement, sac � l''�paule, vous rentrez dans le secr�tariat. Derri�re un grand bureau blanc, une femme est pench�e sur son ordinateur. En vous entendant rentrer, elle se tourne vers vous.');
  writeln;
  writeln('" Oui bonjour, c''est pour quoi ? "');
  writeln;
  ecriredecalle('1- Bonjour, je suis bien au d�partement DDG ?');
  readln(sortie) ;
  cls;

  while (sortie <> '1') do  //si on appuye sur une autre touche que 1, on repropose les choix pr�c�dents
    Begin
    writeln('Je n''ai pas compris...');
    writeln;
    ecriredecalle('1- Bonjour, je suis bien au d�partement DDG ?');
    readln(sortie) ;
    cls;
    End ;

  writeln('La secr�taire vous sourit et r�pond :');
  writeln;
  writeln('" Oui. Ah ! Vous devez �tre le nouvel �tudiant. Th�r�se, je suis la secr�taire du d�partement. Vos parents nous ont appel� pour nous dire que vous ne pourriez pas �tre pr�sent � la journ�e de rentr�e. ');
  writeln('J''ai besoin que vous remplissiez quelques papier pour finir votre inscription. Vous pouvez me rappeler votre nom ? "');
  writeln;

//Partie du code pour donner son nom qui sera m�moris� tout au long du jeu
  while (SORTIE2<>'1') do
    begin
    Writeln('Quel est ton nom ?');
    Readln(pers.nomPerso);
    cls;
    Writeln(pers.nomPerso,', c''est bien �a ? ""');
    Writeln('');
    ecriredecalle('1- "Oui, c''est bien �a !"');
    ecriredecalle('2- "Non, je me suis tromp� !"');
    Readln(SORTIE2);
    cls;
    while (sortie2<>'1') AND (sortie2<>'2') do  //si on appuye sur une autre touche que 1 ou 2, on repropose les choix pr�c�dents
      Begin
      writeln('Je n''ai pas compris...') ;
      writeln('');
      ecriredecalle('1- "Oui, c''est bien �a !"');
      ecriredecalle('2- "Non, je me suis tromp� !"');
      Readln(Sortie2);
      cls;
      end;
    end;
//Fin de la partie d'enregistrement du nom

  Writeln('Bien ! Afin de t''aider dans ton aventure, tu iras voir le professeur afin de choisir ton premier Geekemon et pour qu''il t''apprennes � te battre.');
  Writeln('Si tu as besoin de te reposer, sache qu''il y a la salle de l''ETDDG o� tu pourras acheter des potions et des snacks ! Si tu es en manque d"amis ou de combat, la caf�taria est l� pour toi.');
  Writeln('Bien, je te laisse te rendre dans le labo du professeur Ramp. C''est � droite en sortant, en face de la salle de l"ETDDG.');
  Writeln('');
  ecriredecalle('1- Se diriger vers le couloir.');
  Readln(sortie);
  cls;
  while (sortie <> '1') do    //si on appuye sur une autre touche que 1, on repropose les choix pr�c�dents
    begin
    Writeln('Je ne peux pas faire �a !');
    Writeln('');
    ecriredecalle('1- Se diriger vers le couloir.');
    Readln(Sortie);
    cls;
    end;
  ecriredecalle2('1 -', l1.nomLieu); //Secr�tariat
  ecriredecalle2('2 -',l2.nomLieu); //ETDDG
  ecriredecalle2('3 -',l3.nomLieu); //Caf�t�riat
  ecriredecalle2('4 -',l4.nomLieu); //Labo du professeur Ramp
  ecriredecalle2('5 -',l5.nomLieu); //salle A
  ecriredecalle2('6 -',l6.nomLieu); //salle B
  ecriredecalle2('7 -',l7.nomLieu); //salle C
  Readln(Sortie) ;
  cls;
  while (sortie<>'4') do   //si on appuye sur une autre touche que 2, on repropose les choix pr�c�dents
    Begin
    Writeln('Pas tout de suite ...');
    Writeln;
    ecriredecalle2('1 -', l1.nomLieu); //Secr�tariat
    ecriredecalle2('2 -',l2.nomLieu); //ETDDG
    ecriredecalle2('3 -',l3.nomLieu); //Caf�t�riat
    ecriredecalle2('4 -',l4.nomLieu); //Labo du professeur Ramp
    ecriredecalle2('5 -',l5.nomLieu); //salle A
    ecriredecalle2('6 -',l6.nomLieu); //salle B
    ecriredecalle2('7 -',l7.nomLieu); //salle C
    Readln(Sortie) ;
    cls;
    End;
  Writeln('" Bienvenue dans le d�partement DDG : dressage de Geekemon. Ici, tu apprendras � devenir un dresseur de Geekemon. Mais attention, un grand nombre de ces cr�atures vivent � l''�tat sauvage dans ce b�timent.');
  writeln('Si tu veux pouvoir te promener en toute s�curit�, il te faut un premier Geekemon. Tu as de la chance, il m''en reste trois que j''ai captur� dans le b�timent auquel tu n''as pas acc�s. A toi de choisir."');
  writeln;
  choixGeekemon; //on lance la proc�dure pour choisir son starter
  end;

Procedure choixGeekemon ;  //Proc�dure qui permet de choisir son starter avec Ramp

var
  sortie, sortie2 : string;
  i : integer;

  begin
    while (sortie2<>'1') do   //on propose les 3 starters
      Begin
        if (i>0) then
        writeln;
        writeln('       ','1- Geekeball n�1 - ',p1.nomGeekemon,', de type ',p1.elementGeekemon);
        writeln('       ','2- Geekeball n�2 - ',p2.nomGeekemon,', de type ',p2.elementGeekemon);
        writeln('       ','3- Geekeball n�3 - ',p3.nomGeekemon,', de type ',p3.elementGeekemon);
        Writeln('');
        Writeln('Lequel de ces Geekemons d�sires-tu ?');
        Readln(Sortie) ;
        cls;

        while (sortie<>'1') AND (sortie<>'2') AND (sortie<>'3') do   //si on appuye sur une autre touche que 1,2 ou 3, on repropose les choix pr�c�dents
          begin
            Writeln('Je n''ai pas compris !');
            writeln('       ','1- Geekeball n�1 - ',p1.nomGeekemon,', de type ',p1.elementGeekemon);
            writeln('       ','2- Geekeball n�2 - ',p2.nomGeekemon,', de type ',p2.elementGeekemon);
            writeln('       ','3- Geekeball n�3 - ',p3.nomGeekemon,', de type ',p3.elementGeekemon);
            Writeln('');
            Writeln('Lequel de ces Geekemons d�sires-tu ?');
            Readln(Sortie) ;
            cls;
          end;
        i:=i+1;
        Writeln('Es-tu s�r ? Tu ne pourras plus changer d"avis !');  //on demande la confirmation pour ce starter
        Writeln('');
        ecriredecalle('1- "Oui, j''en suis s�r !"');
        Writeln('');
        ecriredecalle('2- "Non, je veux changer d''avis !"');
        Readln(sortie2);

            cls;

            while (sortie2<>'1') AND (sortie2<>'2') do  //si on appuye sur une autre touche que 1 ou 2, on redemande la confirmation
              Begin
                Writeln('Je n''ai rien compris !');
                Writeln('');
                ecriredecalle('1- "Oui, j''en suis s�r !"');
                Writeln('');
                ecriredecalle('2- "Non, je veux changer d''avis !"');
                Readln(sortie2);
                cls;
              End;
        if Sortie='1' then     //on affecte le premier starter au dresseur en fonction de son choix
        GPossede1:=p1;
        if Sortie='2' then
        GPossede1:=p2;
        if Sortie='3' then
        GPossede1:=p3;
      End;

    Writeln('Excellent choix ! Prends aussi ces quelques potions et ces cr�dits offerts par la maison, et va d�couvrir le b�timent ! Bonne chance, jeune dresseur !');
    writeln('');
    ecriredecalle('1- Sortir');
    Readln(sortie);
    cls;

    while (sortie<>'1') do   //si on appuye sur une autre touche que 1, on repropose les choix pr�c�dents
      Begin
        Writeln('Je n''ai pas compris !');
        Writeln('');
        ecriredecalle('1- Sortir');
        Readln(Sortie) ;
        cls;
      End;


  end;
end.
