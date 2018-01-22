unit FonctionsDeplacementAvancee;

interface
  procedure déplacement;
  procedure localiserNom(loc:integer; var nomLieu : String);
  procedure localiserId(dep:char; var loc:integer);
  procedure affichageCarte (loc:integer);
  procedure lieuCouloir ;

implementation
uses fonctions, DonneesLieuAvancee, salleETDDG,fightinterface, ficheperso, cafet, gestionEcran,succes;

procedure déplacement;
var
  dep : char ;
  localisation : integer ;

begin
cls;
verifSucces; //Procedure qui vérifie si un succès est accompli
localisation := l0.idLieu;
if (localisation=l0.idLieu) then  //permet de se déplacer depuis le couloir
  begin
  lieucouloir;
  ecriredecalle2('1 - ',l1.nomLieu); //Secrétariat
  ecriredecalle2('2 - ',l2.nomLieu); //ETDDG
  ecriredecalle2('3 - ',l3.nomLieu); //Cafétériat
  ecriredecalle2('4 - ',l4.nomLieu); //Labo du professeur Ramp
  ecriredecalle2('5 - ',l5.nomLieu); //salle A
  ecriredecalle2('6 - ',l6.nomLieu); //salle B
  ecriredecalle2('7 - ',l7.nomLieu); //salle C
  ecriredecalle2('8 - ',l8.nomLieu); //salle D
  ecriredecalle('9 - Carte');
  readln(dep);
  cls;
  while(dep<>'1') AND (dep<>'2') AND (dep<>'3') AND (dep<>'4') AND (dep<>'5') AND (dep<>'6') AND (dep<>'7') AND (dep<>'8') AND (dep<>'9') do
    begin  //si une touche autre que celle qui doit être appuyée l'est
    lieucouloir;
    writeln('Ca n''existe pas  !');
    writeln;
    ecriredecalle2('1 - ',l1.nomLieu); //Secrétariat
    ecriredecalle2('2 - ',l2.nomLieu); //ETDDG
    ecriredecalle2('3 - ',l3.nomLieu); //Cafétériat
    ecriredecalle2('4 - ',l4.nomLieu); //Labo du professeur Ramp
    ecriredecalle2('5 - ',l5.nomLieu); //salle A
    ecriredecalle2('6 - ',l6.nomLieu); //salle B
    ecriredecalle2('7 - ',l7.nomLieu); //salle C
    ecriredecalle2('8 - ',l8.nomLieu); //salle D
    ecriredecalle('9 - Carte');
    readln(dep);
    cls;
    end;
  localiserId(dep,localisation);
  if (dep='1') then                       //si on appuye sur "1", on se retrouve dans le secrétariat.
    begin
    writeln('Peu de temps après avoir quitter le secrétariat, vous avez vu un Geekemon qui semblait être un Inspecteur Gadget entrer et hurler "Gogo-gadgeto COUP DE POING AMERICAIN DANS TA GUEULE".');
    writeln('Après ce qui semble être un combat, ce fut le silence ... Vous décidez de partir');
    end;
  if (dep='2') then                       //"2" on se retrouve dans la salle ETDDG
    ETDDG;                                //on lance la procédure de l'ETDDG
  if (dep='3') then                       //"3" on se retrouve dans la cafétériat
    selectionDresseur;                    //on la lance la procédure de la cafétériat (rencontre dresseurs, etc)
  if (dep='4') then                       //labo du professeur Ramp
    begin
    writeln('Après ton passage, le professeur s''est enfermé dans son labo... Il est inscrit sur la porte "Ne pas déranger".');
    writeln('En collant votre oreille à la porte, vous entendez des enfants pleurer... Vous décidez de partir.');
    end;
  if (dep='5') then
    begin
    if (l5.visiteLieu=0) then l5.visiteLieu := 1;  //le combat est lancé, on a donc combattu dans cette salle, ce qui est un pas vers le succès 1
    affichageRencontre;                    //On lance le combat
    déplacement;                          //on retourne au couloir
    end;
  if (dep='6') then
    begin
    if (l6.visiteLieu=0) then l6.visiteLieu := 1;
    affichageRencontre;                   //On lance le combat
    déplacement;                          //on retourne au couloir
    end;
  if (dep='7') then
    begin
    if (l7.visiteLieu=0) then l7.visiteLieu := 1;  //le combat est lancé, on a donc combattu dans cette salle, ce qui est un pas vers le succès 1
    affichageRencontre;                 //On lance le combat
    déplacement;                        //on retourne au couloir
    end;
  if (dep='8') then
    begin
    if (l8.visiteLieu=0) then l8.visiteLieu := 1; //le combat est lancé, on a donc combattu dans cette salle, ce qui est un pas vers le succès 1
    affichageRencontre;                 //On lance le combat
    déplacement;                        //on retourne au couloir
    end;
  if (dep='9') then
    begin
    affichageCarte(localisation);       //On affiche la carte en fonction de notre lieu
    end;
  end;
déplacement;
end;

procedure localiserNom(loc:integer; var nomLieu : String); //procedure qui renvoie le nom en fonction de l'id du lieu

begin
  case loc of
    0 : nomLieu := l0.nomLieu;
    1 : nomLieu := l1.nomLieu;
    2 : nomLieu := l2.nomLieu;
    3 : nomLieu := l3.nomLieu;
    4 : nomLieu := l4.nomLieu;
    5 : nomLieu := l5.nomLieu;
    6 : nomLieu := l6.nomLieu;
    7 : nomLieu := l7.nomLieu;
    8 : nomLieu := l8.nomLieu;
  end;
end;

procedure localiserId(dep:char; var loc:integer);  //procedure qui donne l'id du lieu en fonction du déplacement effectué

begin
  case dep of
   '1' : loc := l1.idLieu;
   '2' : loc := l2.idLieu;
   '3' : loc := l3.idLieu;
   '4' : loc := l4.idLieu;
   '5' : loc := l5.idLieu;
   '6' : loc := l6.idLieu;
   '7' : loc := l7.idLieu;
   '8' : loc := l8.idLieu;
  end;
end;

procedure lieuCouloir ;      //on affiche en en-tête le lieu du couloir
begin
  cls;
  writeln;
  ecriredecalle('Lieu : Couloir');
  writeln;
  writeln('------------------------------------------------------------------------------------------------------------------------');
  writeln;
end;

procedure affichageCarte (loc:integer);

var
nomLieu : String;
position : coordonnees;
x,y : integer;
texte : String ;

begin
  effacerEtColorierEcran(0);
  writeln('Voici la carte :');
  dessinerCadreXY(0,0,100,25, double, 15, 0);      //salles au dessus du couloir
  dessinerCadreXY(0,10,100,15, double, 15, 0);
  dessinerCadreXY(0,0,20,10, simple, 15, 0);
  dessinerCadreXY(20,0,60,10, simple, 15, 0);
  dessinerCadreXY(60,0,80,10, simple, 15, 0);
  dessinerCadreXY(80,0,100,10, simple, 15, 0);

  dessinerCadreXY(0,15,20,25, simple, 15, 0);         //Salles en dessous du couloir
  dessinerCadreXY(20,15,40,25, simple, 15, 0);
  dessinerCadreXY(40,15,60,25, simple, 15, 0);
  dessinerCadreXY(60,15,100,25, simple, 15, 0);

  position.x:=75;                                    //Affichage du contenu des salles
  position.y:=20;
  texte:='Cafétériat';
  ecrireEnPosition(position,texte);
  position.x:=84;
  position.y:=5;
  texte:='Secrétariat';
  ecrireEnPosition(position,texte);
  position.x:=64;
  position.y:=5;
  texte:='Salle ETDDG';
  ecrireEnPosition(position,texte);
  position.x:=28;
  position.y:=5;
  texte:='Labo du Professeur Ramp';
  ecrireEnPosition(position,texte);
  position.x:=35;
  position.y:=12;
  texte:='Couloir';
  ecrireEnPosition(position,texte);
  position.x:=04;
  position.y:=20;
  texte:='Salle B';
  ecrireEnPosition(position,texte);
  position.x:=24;
  position.y:=20;
  texte:='Salle C';
  ecrireEnPosition(position,texte);
  position.x:=44;
  position.y:=20;
  texte:='Salle D';
  ecrireEnPosition(position,texte);
  position.x:=4;
  position.y:=5;
  texte:='Salle A';
  ecrireEnPosition(position,texte);

  position.x:=0;                             //affichage hors cadre
  position.y:=26;
  texte:='Vous êtes ici : ';
  ecrireEnPosition(position,texte);
  localiserNom(loc,nomLieu);                 //on affiche le nom du lieu
  writeln(nomLieu);
  writeln('Appuyez sur n''importe quelle touche pour ranger votre carte');
  readln;
  effacerEtColorierEcran(pers.fondPerso);
  couleurTexte(pers.colorPerso);
  cls;
end;
end.
