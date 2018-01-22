
unit Donnees;

interface

type
  Geekemon = class        //on créé une classe pour créer et classer les geekmon
    nomGeekemon         : String;   //leur nom
    elementGeekemon     : String;   //leur élément
    nomAttackGeekemon   : String;   //leur nom d'attaque(inutile en version minimal)
    hpGeekemon          : Integer;  //leur PV
    hpMaxGeekemon       : Integer;  //leur PV maximeum
    degatsGeekemon      : Integer;  //leur dégats
    idGeekemon          : Integer;  //leur id
  public
    constructor create(nom, element, nomAttack : String; hp, hpMax, degats, id : Integer);
  end;

  Dresseur = class     //on créé une classe pour créer et classer les dresseurs
    nomDresseur         : String;    //leur nom
    citationDresseur    : String;    //leur citation
    recompenseDresseur  : Integer;   //leur recompense(inutile en version minimal)
    geekemonDresseur1   : Geekemon;  //leurs geekemons
    geekemonDresseur2   : Geekemon;
    geekemonDresseur3   : Geekemon;
    geekemonDresseur4   : Geekemon;
  public
    constructor create(nom, citation : String; recompense : Integer; G1, G2, G3, G4 : Geekemon);
  end;

var
  p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,
  GPossede1, GPossede2, GPossede3, GPossede4, GActif, GAdversaire               : Geekemon;
  d1, d2, d3, d4, DSelectionne                                                  : Dresseur;

implementation
uses Fonctions;
constructor Geekemon.create(nom, element, nomAttack : String; hp, hpMax, degats, id : Integer);
begin
  nomGeekemon       := nom;
  elementGeekemon   := element;
  nomAttackGeekemon := nomAttack;
  hpGeekemon        := hp;
  hpMaxGeekemon     := hpMax;
  degatsGeekemon    := degats;
  idGeekemon        := id;
end;

constructor Dresseur.create(nom, citation : String; recompense : Integer; G1, G2, G3, G4 : Geekemon);
begin
  nomDresseur := nom;
  citationDresseur := citation;
  recompenseDresseur := recompense;
  geekemonDresseur1 := G1;
  geekemonDresseur2 := G2;
  geekemonDresseur3 := G3;
  geekemonDresseur4 := G4;
end;

begin
  p0  := Geekemon.create('', '', '', 0, 0, 0, 0); //Geekmon par defaut servant a gérer les vides dans les équipes

  p1  := Geekemon.create('Ichiya', 'Poison', 'Attaque', 120, 120, 25, 1); //liste des différents Geekemon du jeu
  p2  := Geekemon.create('Dovahkiin', 'Dragon', 'Attaque', 105, 105, 30, 2);
  p3  := Geekemon.create('Nami', 'Eau', 'Climat-tact', 95, 95, 30, 15);
  p4  := Geekemon.create('Inspecteur Gadget', 'Electrik', 'Attaque', 95, 95, 35, 4);
  p5  := Geekemon.create('Hamtaro', 'Normal',  'Attaque',  135, 135, 20, 5);
  p6  := Geekemon.create('Finn&Jake', 'Combat', 'Attaque', 110, 110, 25, 6);
  p7  := Geekemon.create('Gally', 'Acier', 'Attaque', 110, 110, 35, 7);
  p8  := Geekemon.create('Gurren Lagann', 'Acier', 'Attaque', 120, 120, 30, 8);
  p9  := Geekemon.create('Rahan', 'Plante', 'Attaque', 95, 95, 35, 9);
  p10 := Geekemon.create('Maitre Yoda', 'Psy', 'Attaque', 80, 80, 40, 10);
  p11 := Geekemon.create('Yuno', 'Ténèbre', 'Attaque', 100, 100, 35, 11);
  p12 := Geekemon.create('Frieza', 'Glace', 'Attaque', 90, 90, 30, 12);
  p13 := Geekemon.create('Ron Weasley', 'Psy', 'Attaque', 85, 85, 35, 13);
  p14 := Geekemon.create('Princess Luna', 'Spectre', '', 105, 105, 30, 14);
  p15 := Geekemon.create('V', 'Ténèbres', 'Attaque', 90, 90, 35, 3);
  p16 := Geekemon.create('Nounours', 'Normal', 'Attaque', 105, 105, 25, 16);
  p17 := Geekemon.create('Rocket Raccoon', 'Electrik', 'Attaque', 90, 90, 35, 17);
  p18 := Geekemon.create('Kirby', 'Fée', 'Attaque', 115, 115, 25, 18);
  p19 := Geekemon.create('Kirche', 'Feu', 'Attaque', 100, 100, 30, 19);
  p20 := Geekemon.create('Toruk', 'Vol', 'Attaque', 120, 120, 30, 20);
                 //liste des Geekemon de l'équipe se mettant a jour
  GPossede1 := p0;
  GPossede2 := p0;
  GPossede3 := p0;
  GPossede4 := p0;
                                //liste des dresseurs
  D1 := Dresseur.create('Saul Goodman','Un problème ? Des ennuis ? Un seul réflexe : contacter Saul Goodman !',100, p13, p4, p0, p0);
  D2 := Dresseur.create('Pablo','¿Plata o Plomo ?',300, p17, p6, p19, p0);
  D3 := Dresseur.create('Ragnar Lothbrok','Des histoires. Tout démarre et se termine par des histoires.',300, p15, p2, p8, p0);
  D4 := Dresseur.create('Rainbow','...',500, p8, p14, p7, p18);
end.
