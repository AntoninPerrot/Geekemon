
unit Donnees;

interface

type
  Geekemon = class
    nomGeekemon         : String;
    elementGeekemon     : String;
    nomAttackGeekemon   : String;
    hpGeekemon          : Integer;
    hpMaxGeekemon       : Integer;
    degatsGeekemon      : Integer;
    idGeekemon          : Integer;

  public
    constructor create(nom, element, nomAttack : String; hp, hpMax, degats, id : Integer);
  end;

    Dresseur = class
    nomDresseur         : String;
    citationDresseur    : String;
    recompenseDresseur  : Integer;
    geekemonDresseur1   : Geekemon;
    geekemonDresseur2   : Geekemon;
    geekemonDresseur3   : Geekemon;
    geekemonDresseur4   : Geekemon;
    VictoireDresseur    : Integer;   //si un Dresseur adverse a été battu par le dresseur ou non pour le succès 2

  public
    constructor create(nom, citation : String; recompense : Integer; G1, G2, G3, G4 : Geekemon; victoireD : Integer);
  end;

var
  p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,
  GPossede1, GPossede2, GPossede3, GPossede4, GActif, GAdversaire,
  GPC1, GPC2, GPC3, GPC4, GPC5, GPC6, GPC7, GPC8, GPC9, GPC10, GInter        : Geekemon;
  d1, d2, d3, d4, DSelectionne                               : Dresseur;

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

constructor Dresseur.create(nom, citation : String; recompense : Integer; G1, G2, G3, G4 : Geekemon; victoireD : Integer);
begin
  nomDresseur        := nom;
  citationDresseur   := citation;
  recompenseDresseur := recompense;
  geekemonDresseur1  := G1;
  geekemonDresseur2  := G2;
  geekemonDresseur3  := G3;
  geekemonDresseur4  := G4;
  victoireDresseur   := victoireD;
end;

begin
  begin
    p0  := Geekemon.create('', '', '', 0, 0, 0, 0);

    p1  := Geekemon.create('Ichiya', 'Poison', 'Parfum', 120, 120, 25, 1);
    p2  := Geekemon.create('Dovahkiin', 'Dragon', 'Fus-Ro-Dah', 105, 105, 30, 2);
    p3  := Geekemon.create('V', 'Ténèbres', 'Anarchie', 90, 90, 35, 3);
    p4  := Geekemon.create('Inspecteur Gadget', 'Electrik', 'Gogo-gadgeto COUP DE POING AMERICAIN DANS TA GUEULE', 95, 95, 35, 4);
    p5  := Geekemon.create('Hamtaro', 'Normal',  'Tournesol',  135, 135, 20, 5);
    p6  := Geekemon.create('Finn&Jake', 'Combat', 'Adventure time', 110, 110, 25, 6);
    p7  := Geekemon.create('Gally', 'Acier', 'Rayon plasmique', 110, 110, 35, 7);
    p8  := Geekemon.create('Gurren Lagann', 'Acier', 'Giga Drill', 120, 120, 30, 8);
    p9  := Geekemon.create('Rahan', 'Plante', 'Vie Sauvage', 95, 95, 35, 9);
    p10 := Geekemon.create('Maitre Yoda', 'Psy', 'La Force', 80, 80, 40, 10);
    p11 := Geekemon.create('Yuno', 'Ténèbre', 'Pouvoir de la yandere', 100, 100, 35, 11);
    p12 := Geekemon.create('Frieza', 'Glace', '5 minutes', 90, 90, 30, 12);
    p13 := Geekemon.create('Ron Weasley', 'Psy', 'Leviosaaaaaa', 85, 85, 35, 13);
    p14 := Geekemon.create('Princess Luna', 'Spectre', 'Sabot lunaire', 105, 105, 30, 140);
    p15 := Geekemon.create('Nami', 'Eau', 'Climat-tact', 95, 95, 30, 15);
    p16 := Geekemon.create('Nounours', 'Normal', 'Bonne nuit', 105, 105, 25, 16);
    p17 := Geekemon.create('Rocket Raccoon', 'Electrik', 'Mega Fusil Laser', 90, 90, 35, 170);
    p18 := Geekemon.create('Kirby', 'Fée', 'Pouvoirs élémentaires', 115, 115, 25, 18);
    p19 := Geekemon.create('Kirche', 'Feu', 'Le feu ça brûle', 100, 100, 30, 19);
    p20 := Geekemon.create('Toruk', 'Vol', 'Annihilation', 120, 120, 30, 20);

    GPossede1 := p1;
    GPossede2 := p0;
    GPossede3 := p0;
    GPossede4 := p0;

    GPC1 := p0;
    GPC2 := p0;
    GPC3 := p0;
    GPC4 := p0;
    GPC5 := p0;
    GPC6 := p0;
    GPC7 := p0;
    GPC8 := p0;
    GPC9 := p0;
    GPC10 := p0;

    D1       := Dresseur.create('Saul Goodman','Un problème ? Des ennuis ? Un seul réflexe : contacter Saul Goodman !',100, p13, p4, p0, p0,0);
    D2       := Dresseur.create('Pablo','¿Plata o Plomo ?',300, p17, p6, p19, p0,0);
    D3       := Dresseur.create('Ragnar Lothbrok','Des histoires. Tout démarre et se termine par des histoires.',300, p15, p2, p8, p0,0);
    D4       := Dresseur.create('Rainbow','...',500, p8, p14, p7, p18,0);
  end;
end.
