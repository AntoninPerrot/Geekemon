unit DonneesLieuAvancee;

interface

type
  Lieu = class
    nomLieu    : string ;
    idLieu     : integer ;
    visiteLieu     : Integer ;

  public
    constructor create (nom : string ; id : integer; visite : Integer) ;
  end;

var
  l0, l1, l2, l3, l4, l5, l6, l7, l8 : lieu;

implementation
uses fonctions;

constructor Lieu.create(nom : string ; id : integer; visite : Integer) ;
  begin
  nomlieu    := nom ;
  idLieu     := id ;
  visiteLieu := visite ;
  end;

begin
  begin
    l0 := Lieu.create('Couloir',0,0);
    l1 := Lieu.create('Secrétariat',1,0);
    l2 := Lieu.create('Salle ETDDG',2,0);
    l3 := Lieu.create('Cafétariat',3,0);
    l4 := Lieu.create('Labo du professeur Ramp',4,0);
    l5 := Lieu.create('Salle A',5,0);
    l6 := Lieu.create('Salle B',6,0);
    l7 := Lieu.create('Salle C',7,0);
    l8 := Lieu.create('Salle D',8,0);
  end;
end.
