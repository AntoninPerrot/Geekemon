unit Fonctions;

interface
  uses SysUtils, Windows;
  procedure cls;  //procedure qui permet d'effacer l'écran
  procedure decallage;   //permet de décaller du texte pour les procédures suivantes
  procedure ecrireDecalle(chaine1: String); //permet d'écrire un élément avec un décalage
  procedure ecrireDecalle2(chaine1, chaine2: String); //permet d'écrire deux éléments avec un décalage
  Function lireDecalle(): String;  //permet d'entrer son choix avec le curseur indenté

var Txt: String; Quit: Boolean;

implementation

  procedure cls;  //procedure qui permet d'effacer l'écran
  var C: TCoord;
  N,H,L: Cardinal;
  begin
    H:=GetStdHandle(STD_OUTPUT_HANDLE);
    C:=GetLargestConsoleWindowSize(H);
    L:=C.X*C.Y;
    C.X:=0;
    C.Y:=0;
    FillConsoleOutputCharacter(H,' ',L,C,N);
    SetConsoleCursorPosition(H,C)
  end;

  procedure decallage;    //permet de décaller du texte pour les procédures suivantes
  var
    i: Integer;
    max: Integer;
  begin
    max := 10;
    for i := 0 to max do write(' ');
  end;

  procedure ecrireDecalle(chaine1 : String);  //permet d'écrire un élément avec un décalage
  begin
    decallage;
    writeln(chaine1);
  end;

  procedure ecrireDecalle2(chaine1, chaine2 : String);  //permet d'écrire deux éléments avec un décalage
  begin
    decallage;
    writeln(chaine1 + chaine2);
  end;

  Function lireDecalle(): string;    //permet d'entrer son choix avec le curseur indenté
  var lu: String;
  begin
    decallage;
    readln(lu);
    lireDecalle:= lu;
  end;

end.
