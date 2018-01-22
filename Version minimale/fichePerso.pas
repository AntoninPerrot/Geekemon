
unit fichePerso;

interface

type
  Perso = class                   //classe créée pour ranger les informations sur le personnage
    nomPerso      : String;       //on enregistre son nom
    argentPerso   : Integer;      //On enregistre l'argent sur nous
    potionPerso   : Integer;      //On enregistre le nombre de potion sur nous

  public
    constructor create(nomP: String;argentP,potionP : Integer);
  end;

var
  pers:Perso;

implementation
uses Fonctions;

constructor Perso.create(nomP: String;argentP,potionP : Integer);
begin
  nomPerso      := nomP;
  argentPerso   := argentP;
  potionPerso   := potionP;

end;
begin
begin
  pers := Perso.create('', 100,2); //on affecte les infos aux classes qui leur correspondent

end;
end.
