program BinomCoef;

{$APPTYPE CONSOLE}

{$R *.res}

const maxn = 60;

var a,b:word;
n:integer;


// Рекурсивная реализация подсчета биномиальных коэффициентов
function C(n,m:integer):int64;
begin
  if (m=0)or(m=n) then
    Result:=1
  else
    Result:=C(n-1,m)+C(n-1,m-1);
end;

// Вывод результата рекурсивной реализации подсчета биномиальных коэффициентов
function recursiveC(n: integer):integer;
var
  m:integer;
begin
  for m := 0 to n do
  begin
    Write( c(n,m), ' ');
  end;
end;

// Нерекурсивная реализация подсчета биномиальных коэффициентов
procedure noRecursiveС(const max:integer);
type TArr = array[0..maxN+1, 0..maxN+1] of int64;
var a,b:word;
  n,k:integer;
  c: TArr;
begin
  for n:=0 to max do
  begin
    C[n,n] := 1;
    C[n][0] := C[n][n];
    for k := 1 to n-1 do
      C[n][k] := C[n-1][k-1] + C[n-1][k];
  end;

  for k := 0 to max do
    write(C[max][k], ' ');
end;


begin
  repeat
    writeln('Please, enter binomial power. 0 <= n <= 60');
    write('n = ');
    readln(n);
  until (n in [0..60]);
  Writeln('No recursive realisation: ');
  noRecursiveС(n);
  writeln;
  Writeln('Recursive realisation: ');
  recursiveC(n);
  readln;
end.
