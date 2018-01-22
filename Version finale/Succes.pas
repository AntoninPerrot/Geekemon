unit Succes;

interface
  procedure verifSucces; //procedure qui vérifie si des succès ont eu lieu
  procedure menuSucces ; //procedure d'affichage des succès dans le menu

implementation
uses donneesLieuAvancee,donnees, fichePerso, fonctions, menus;

procedure affichageSucces;  //affichage lors de la réussite d'un succès
begin
cls;
writeln;
ecriredecalle('███████╗███████╗██╗     ██╗ ██████╗██╗████████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗    ██╗');
ecriredecalle('██╔════╝██╔════╝██║     ██║██╔════╝██║╚══██╔══╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ██║');
ecriredecalle('█████╗  █████╗  ██║     ██║██║     ██║   ██║   ███████║   ██║   ██║██║   ██║██╔██╗ ██║    ██║');
ecriredecalle('██╔══╝  ██╔══╝  ██║     ██║██║     ██║   ██║   ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ╚═╝');
ecriredecalle('██║     ███████╗███████╗██║╚██████╗██║   ██║   ██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ██╗');
ecriredecalle('╚═╝     ╚══════╝╚══════╝╚═╝ ╚═════╝╚═╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═╝');
writeln;
writeln('------------------------------------------------------------------------------------------------------------------------');
writeln;
end;

procedure verifSucces;   //procedure qui vérifie si des succès ont eu lieu
begin
if ((l5.visiteLieu=1) AND (l6.visiteLieu=1) AND (l7.visiteLieu=1) AND (l8.visiteLieu=1) AND (l3.visiteLieu=1) AND (pers.succes1=0)) then
  begin
  affichageSucces;
  writeln('Félicitation ! Tu as combattu dans toutes les salles sauvages ainsi que dans la cafétériat ! Quel combattant !');
  writeln;
  writeln('Succès obtenu : Des batailles partout');
  pers.succes1 := 1;
  readln;
  cls;
  end;

if ((D1.victoireDresseur=1) AND (D2.VictoireDresseur=1) AND (D3.VictoireDresseur=1) AND (D4.VictoireDresseur=1) AND (pers.succes2=0)) then
  begin
  affichageSucces;
  writeln('Bravo, tu as battu tous les dresseurs de la cafétériat !! Quel homme !');
  writeln;
  writeln('Succès obtenu : Combattant avéré');
  pers.succes2 := 1;
  readln;
  cls;
  end;

if ((pers.potionAchete=20) AND (pers.succes3=0)) then
  begin
  affichageSucces;
  Writeln('Bravo ! Tu as acheté 20 potions depuis le début de ton aventure !! Quel homme !');
  writeln;
  writeln('Succès obtenu : Des potions à foison');
  pers.succes3:=1;
  readln;
  cls;
  end;

if ((pers.succes4=0) AND (Gpossede1<>p0) AND (Gpossede2<>p0) AND (Gpossede3<>p0) AND (Gpossede4<>p0)) then
  begin
  affichageSucces;
  Writeln('Bravo ! Tu as réussi à te constituer une équipe de 4 Geekemon !! Tu apprends vite, dis donc !');
  writeln;
  writeln('Succès obtenu : Une équipe de qualitEY');
  pers.succes4:=1;
  readln;
  cls;
  end;
end;

procedure menuSucces ; //procedure d'affichage des succès dans le menu

var
  choix : String;

begin
while (choix<>'1') do
  begin
  cls;
  writeln('Liste des succèes :');
  writeln;
  writeln;

  ecriredecalle('Des batailles partout :');
  if pers.succes1=1 then writeln('Obtenu')
  else writeln('Non obtenu');
  writeln;

  ecriredecalle('Combattant avéré :');
  if pers.succes2=1 then writeln('Obtenu')
  else writeln('Non obtenu');
  writeln;

  ecriredecalle('Des potions à foison :');
  if pers.succes3=1 then writeln('Obtenu')
  else writeln('Non obtenu');
  writeln;

  ecriredecalle('Une équipe de qualitEY :');
  if pers.succes4=1 then writeln('Obtenu')
  else writeln('Non obtenu');
  writeln;
  writeln;

  ecriredecalle('1 - Menu principal');
  readln(choix);
  end;
MenuPrincipal;

end;
end.
