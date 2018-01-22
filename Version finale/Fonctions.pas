unit Fonctions;

interface
  uses SysUtils, Windows;
  procedure cls;
  procedure decallage;
  procedure ecrireDecalle(chaine1: String);
  procedure ecrireDecalle2(chaine1, chaine2: String);
  Function lireDecalle(): String;

var Txt: String; Quit: Boolean;

implementation
  procedure cls;
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

  procedure decallage;
  var
    i: Integer;
    max: Integer;
  begin
    max := 10;
    for i := 0 to max do write(' ');
  end;

  procedure ecrireDecalle(chaine1 : String);
  begin
    decallage;
    writeln(chaine1);
  end;

  procedure ecrireDecalle2(chaine1, chaine2 : String);
  begin
    decallage;
    writeln(chaine1 + chaine2);
  end;

  Function lireDecalle(): string;
  var lu: String;
  begin
    decallage;
    readln(lu);
    lireDecalle:= lu;
  end;

end.
