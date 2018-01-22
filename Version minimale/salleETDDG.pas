unit salleETDDG;

interface procedure ETDDG;  //Programme principal pour l'ETDDG
          procedure pauvre; //si on a pas assez d'argent pour acheter une potion
          procedure affichageETDDG; //affichage de l'ETDDG et des choix possibles
          function potion(n:integer):Integer; //On augmente le nombre de potions par 1 à chaque achat
          function argent(n:integer):Integer; //On retire le coût d'une potion à chaque achat
          procedure soin;                     //soin intentionel pour soigner ses Geekemon manuellement
          procedure soinForcé;                //soin forcé lorsque les Geekemon sont KO et qu'un combat est donc perdu

implementation
uses Fonctions, fichePerso, Donnees, FightInterface,fonctionsdéplacementminimale;

procedure ETDDG; //Programme principal pour l'ETDDG

var
actionDDG : String;
n : integer;

begin
  affichageETDDG;  //on affiche le menu ETDDG
  readln(actionDDG);  //On lit le choix
  while actionDDG<>'3' do //tant qu'on choisit de ne pas sortir
    begin
      if actionDDG='1' then   //on soigne les Geekemon
        begin
          soin;
          cls;
          affichageETDDG;
          readln(actionDDG);
        end;
      if actionDDG='2' then   //on achète les potions
        begin
          if pers.argentPerso>=60 then   //si on a assez d'argent
            begin
              n:=-60;
              argent(n);
              n:=1;
              potion(n);
              cls;
            end
            else                        //si on a pas assez d'argent
              pauvre();
              affichageETDDG;
              readln(actionDDG);
              cls;
        end;
      if (actionDDG<>'1') AND (actionDDG<>'2') AND (actionDDG<>'3') then //si on appuie sur autre chose que les choix proposés
        begin
          cls;
          writeln('"Je n''ai pas compris, peux-tu répéter s''il te plait ?"');
          writeln;
          writeln('"Appuyez sur entrée pour continuer"');
          readln;
          cls;
          affichageETDDG;
          readln(actionDDG);
        end;
    end;
  cls;
  writeln('"Au revoir et à bientôt !"');
  readln;
  cls;
  déplacement;

end;

procedure pauvre; //si on a pas assez d'argent pour acheter une potion
begin
  writeln('"Désolé, tu n''as pas assez de geekedollar ..."');
  writeln;
  writeln('"Appuyez sur entrée pour continuer"');
  readln;
  cls;
end;

procedure affichageETDDG; //affichage de l'ETDDG et des choix possibles
var
actionDDG:integer;

begin
  writeln('Vous rentrez dans une salle ou de nombreux étudiants sont présents. Certains sont assis autour d''une table et discutent, d''autres sont assis dans un canapé et jouent à un jeu vidéo. L''un d''entre eux, visiblement en deuxième année s''avance vers vous.');
  writeln;
  writeln('"Bonjour, je suis David G., président de l''ETDDG, association des étudiants du département DDG. Bienvenue à toi. Dans cette salle, tu peux te reposer un peu et soigner tes geekemons ou encore nous acheter des consoma...potions."');
  writeln;
  write('Vous avez ');
  write(pers.argentPerso);
  write(' geekedollars et ');
  write(pers.potionPerso);
  writeln(' potions');
  writeln;
  writeln('     '+'1 - Se reposer');
  writeln('     '+'2 - Acheter des potions (60 geekedollars)');
  writeln('     '+'3 - Sortir de la salle');
end;

function potion(n:integer):Integer;  //On augmente le nombre de potions par 1 à chaque achat

begin
  pers.potionPerso:=pers.potionPerso+n;
end;

function argent(n:integer):Integer;  //On retire le coût d'une potion à chaque achat
begin
  pers.argentPerso:=pers.argentPerso+n
end;

procedure soin; //soin intentionel pour soigner ses Geekemon manuellement
begin
  cls;
  GPossede1.hpGeekemon:=GPossede1.hpMaxGeekemon;  //on réaffecte leur vie max aux Geekemon
  GPossede2.hpGeekemon:=GPossede2.hpMaxGeekemon;
  GPossede3.hpGeekemon:=GPossede3.hpMaxGeekemon;
  GPossede4.hpGeekemon:=GPossede4.hpMaxGeekemon;
  writeln('Vos geekemons ont été soignés');
  writeln;
  writeln('"Appuyez sur entrée pour continuer"');
  readln;
end;

procedure soinForcé; //soin forcé lorsque les Geekemon sont KO et qu'un combat est donc perdu
begin
  cls;
  GPossede1.hpGeekemon:=GPossede1.hpMaxGeekemon; //on réaffecte leur vie max aux Geekemon
  GPossede2.hpGeekemon:=GPossede2.hpMaxGeekemon;
  GPossede3.hpGeekemon:=GPossede3.hpMaxGeekemon;
  GPossede4.hpGeekemon:=GPossede4.hpMaxGeekemon;
  writeln('Vos geekemons ont été soignés');
  writeln;
  writeln('"Appuyez sur entrée pour continuer"');
  readln;
  ETDDG;
end;
end.


