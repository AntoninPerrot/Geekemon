unit Fonctions;

interface
  uses SysUtils, Windows;
  procedure cls;  //procedure qui permet d'effacer l'�cran
  procedure decallage;   //permet de d�caller du texte pour les proc�dures suivantes
  procedure ecrireDecalle(chaine1: String); //permet d'�crire un �l�ment avec un d�calage
  procedure ecrireDecalle2(chaine1, chaine2: String); //permet d'�crire deux �l�ments avec un d�calage
  Function lireDecalle(): String;  //permet d'entrer son choix avec le curseur indent�

var Txt: String; Quit: Boolean;

implementation

  procedure cls;  //procedure qui permet d'effacer l'�cran
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

  procedure decallage;    //permet de d�caller du texte pour les proc�dures suivantes
  var
    i: Integer;
    max: Integer;
  begin
    max := 10;
    for i := 0 to max do write(' ');
  end;

  procedure ecrireDecalle(chaine1 : String);  //permet d'�crire un �l�ment avec un d�calage
  begin
    decallage;
    writeln(chaine1);
  end;

  procedure ecrireDecalle2(chaine1, chaine2 : String);  //permet d'�crire deux �l�ments avec un d�calage
  begin
    decallage;
    writeln(chaine1 + chaine2);
  end;

  Function lireDecalle(): string;    //permet d'entrer son choix avec le curseur indent�
  var lu: String;
  begin
    decallage;
    readln(lu);
    lireDecalle:= lu;
  end;

end.
