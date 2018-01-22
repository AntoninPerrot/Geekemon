
unit fichePerso;

interface

type
  Perso = class
    nomPerso      : String;
    argentPerso   : Integer;
    potionPerso   : Integer;
    potionAchete  : Integer;
    colorPerso    : Integer;
    fondPerso     : Integer;
    succes1       : Integer;
    succes2       : Integer;
    succes3       : Integer;
    succes4       : Integer;

  public
    constructor create(nomP: String;argentP,potionP,PotionA,colorP,fondP,succes1,succes2,succes3,succes4: Integer);
  end;

var
  pers:Perso;

implementation
uses Fonctions;

constructor Perso.create(nomP: String;argentP,potionP,PotionA,colorP,fondP, succes1,succes2,succes3,succes4: Integer);
begin
  nomPerso      := nomP;
  argentPerso   := argentP;
  potionPerso   := potionP;
  potionAchete  := potionA;
  colorPerso    := colorP;
  fondPerso     := fondP;
  succes1       := succes1;
  succes2       := succes2;
  succes3       := succes3;
  succes4       := succes4;

end;
begin
begin
  pers := Perso.create('', 100,2,0,15,0,0,0,0,0);

end;

end.
