unit randomi;

interface procedure rencontre;   //permet de gérer les rencontres aléatoires contre les Geekemon dans les salles

var
x,attack,vie,vieMax:integer;
nomG,nomAtt:String;

implementation
uses Donnees;
procedure rencontre;


begin
  randomize;
x:=random(17)+4;

if x=4  then GAdversaire := p4;    //En fonction du nombre trouvé, on affrontera le Geekemon associé
if x=5  then GAdversaire := p5;
if x=6  then GAdversaire := p6;
if x=7  then GAdversaire := p7;
if x=8  then GAdversaire := p8;
if x=9  then GAdversaire := p9;
if x=10 then GAdversaire := p10;
if x=11 then GAdversaire := p11;
if x=12 then GAdversaire := p12;
if x=13 then GAdversaire := p13;
if x=14 then GAdversaire := p14;
if x=15 then GAdversaire := p15;
if x=16 then GAdversaire := p16;
if x=17 then GAdversaire := p17;
if x=18 then GAdversaire := p18;
if x=19 then GAdversaire := p19;
if x=20 then GAdversaire := p20;
end;

end.
