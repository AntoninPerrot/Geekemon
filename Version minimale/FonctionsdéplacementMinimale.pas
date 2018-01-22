unit Fonctionsd�placementMinimale;

interface
  procedure d�placement;  //proc�dure qui permet d'aller n'importe o� depuis le couloir

implementation
uses fonctions, DonneesLieuMinimale, salleETDDG,fightinterface, ficheperso, cafet;

procedure d�placement;
var
  dep : string ;
  localisation : integer ;

begin
localisation := l0.idLieu;
if (localisation=l0.idLieu) then  //permet de se d�placer depuis le couloir
  begin
  writeln;
  ecriredecalle2('1 -', l1.nomLieu); //Secr�tariat
  ecriredecalle2('2 -',l2.nomLieu); //ETDDG
  ecriredecalle2('3 -',l3.nomLieu); //Caf�t�riat
  ecriredecalle2('4 -',l4.nomLieu); //Labo du professeur Ramp
  ecriredecalle2('5 -',l5.nomLieu); //salle A
  ecriredecalle2('6 -',l6.nomLieu); //salle B
  ecriredecalle2('7 -',l7.nomLieu); //salle C
  readln(dep);
  cls;
  while (dep<>'1') AND (dep<>'2') AND (dep<>'3') AND (dep<>'4') AND (dep<>'5') AND (dep<>'6') AND (dep<>'7') do
    begin  //si une touche autre que celle qui doit �tre appuy�e l'est
    writeln('Je n''ai pas compris !');
    writeln;
    ecriredecalle2('1 -', l1.nomLieu); //Secr�tariat
    ecriredecalle2('2 -',l2.nomLieu); //ETDDG
    ecriredecalle2('3 -',l3.nomLieu); //Caf�t�riat
    ecriredecalle2('4 -',l4.nomLieu); //Labo du professeur Ramp
    ecriredecalle2('5 -',l5.nomLieu); //salle A
    ecriredecalle2('6 -',l6.nomLieu); //salle B
    ecriredecalle2('7 -',l7.nomLieu); //salle C
    readln(dep);
    cls;
    end;

  if (dep='1') then   //si on appuye sur "1", on se retrouve dans le secr�tariat.
    begin
    localisation := l1.idLieu;
    writeln('Bonjour, cette salle (le secr�tariat) ne sert � rien ! Bisou, ',pers.nomPerso,' <3');
    end;
  if (dep='2') then              //"2" on se retrouve dans la salle ETDDG
    begin
    localisation := l2.idLieu;
    ETDDG;                       //on lance la proc�dure de l'ETDDG
    end;
  if (dep='3') then              //"3" on se retrouve dans la caf�t�riat
    begin
    localisation := l3.idLieu;
    selectionDresseur;                //on la lance la proc�dure de la caf�t�riat (rencontre dresseurs, etc)
    end;
  if (dep='4') then            //labo du professeur Ramp
    begin
    localisation := l4.idLieu;
    writeln('Apr�s ton passage, le professeur s''est enferm� dans son labo... Il est inscrit sur la porte "Ne pas d�ranger".');
    writeln('En collant votre oreille � la porte, vous entendez des enfants pleurer... Vous d�cidez de partir.');
    end;
  if (dep='5') then
    begin
    localisation := l5.idLieu;   //Salle A
    affichageRencontre; //On lance le combat contre un Geekemon
    d�placement;  //on retourne au couloir
    end;
  if (dep='6') then
    begin
    localisation := l6.idLieu; //Salle B
    affichageRencontre;  //On lance le combat contre un Geekemon
    d�placement;   //on retourne au couloir
    end;
  if (dep='7') then
    begin
    localisation := l7.idLieu; //Salle C
    affichageRencontre; //On lance le combat contre un Geekemon
    d�placement;  //on retourne au couloir
    end
  end;
d�placement;  //on retourne au couloir
end;
end.
