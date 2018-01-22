unit DonneesLieuMinimale;

interface

type
  Lieu = class               //on cr�� une classe pour cr�er et classer les lieux
    nomLieu    : string ;  //son nom
    idLieu     : integer ; //son id

  public
    constructor create (nom : string ; id : integer) ;
  end;

var
  l0, l1, l2, l3, l4, l5, l6,l7 : lieu;

implementation
uses fonctions;

constructor Lieu.create(nom : string ; id : integer) ;
begin
  nomlieu := nom ;
  idLieu  := id ;
end;

begin
  begin                               //Liste des diff�rents lieux utilis�s pour le d�placement
    l0 := Lieu.create('Couloir',0);
    l1 := Lieu.create('Secr�tariat',1);
    l2 := Lieu.create('Salle ETDDG',2);
    l3 := Lieu.create('Caf�tariat',3);
    l4 := Lieu.create('Labo du professeur Ramp',4);
    l5 := Lieu.create('Salle A',5);
    l6 := Lieu.create('Salle B',6);
    l7 := Lieu.create('Salle C',7);
  end;
end.
