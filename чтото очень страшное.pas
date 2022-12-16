uses crt, system;
var input: file of char; output: text; r: array [1..10000] of char;
nach, nach1, kon, kon1, n: integer; s: string;

function wer: integer;
var i, j: integer; a: char;
begin
  for i := 1 to n - 1 do
  for j := 1 to n - i do
  if r[j] > r[j + 1] then begin
     a := r[j];
     r[j] := r[j + 1];
     r[j + 1] := a
     end;
end;

function pus: integer;
var a: char;
begin
  for var i := 1 to n - 1 do
  for var j := 1 to n - i do
  if r[j] < r[j + 1] then begin
    a := r[j];
    r[j] := r[j + 1];
    r[j + 1] := a
    end;
end;

procedure gf(a, c: integer);
var z: array[1..1000] of char;
begin
    if c <= a then 
        exit 
    else 
    begin
     var x := (a + c) div 2;
      gf(a, x);
      gf(x + 1, c);
      var n1 := a;
      var n2 := x + 1;
        for var i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (r[n1] < r[n2])) then
            begin
                z[i] := r[n1];
                inc(n1);
            end 
            else 
            begin
            z[i] := r[n2];
            inc(n2);
            end;
        end;
        for var j := a to c do
            r[j] := z[j];
    end; 
end;

procedure sad(a, c: integer);
var e: array[1..1000] of char;
begin
    if c <= a then 
        exit 
    else 
    begin
     var x := (a + c) div 2;
     sad(a, x);
     sad(x + 1, c);
     var n1 := a;
     var n2 := x + 1;
        for var i := a to c do 
        begin
            if (n1 < x + 1) and ((n2 > c) or (r[n1] > r[n2])) then
            begin
                e[i] := r[n1];
                inc(n1);
            end 
            else 
            begin
                e[i] := r[n2];
                inc(n2);
            end;
        end;
        for var j := a to c do
            r[j] := e[j];
    end; 
end;

begin
  assign(input, 'C:\Users\Home\OneDrive\Документы\kollege\2 курс\ОАиП\Дщмашняя кр ОАиП\5 кр\mm.txt'); assign(output, 'C:\Users\Home\OneDrive\Документы\kollege\2 курс\ОАиП\Дщмашняя кр ОАиП\5 кр\tt.txt');
  rewrite(input); rewrite(output);
  writeln('Введите длинну массива');
  readln(n);
  writeln('Введите массив');
  for var i := 1 to n do
  begin
    readln(r[i]);
    write(input, r[i]);
  end;
  var st: integer;
  st := 1;
  while st <> 0 do
  begin
    clrscr;
    writeln('Выберите сортировку');
    writeln('Сортировка пузырьком по возрастанию - 1');
    writeln('Сортировка слиянием по возрастанию - 2');
    writeln('Сортировка пузырьком по убыванию - 3');
    writeln('Сортировка слиянием по убыванию - 4');
    writeln('Выход из программы - 0');
    readln(st);
    nach := DateTime.Now.Second;
    nach1 := DateTime.Now.MilliSecond;
    case st of
      1: wer;
      2: gf(1, n);
      3: pus;
      4: sad(1, n);
      0: exit;
    end;
    for var i := 1 to n do
      print(output, r[i]);
    kon := DateTime.Now.Second;
    kon1 := DateTime.Now.MilliSecond;
    close(output);
    reset(output);
    read(output, s);
    close(output);
    rewrite(output);
    write(s);
    writeln;
    writeln('Время выполнения: ', kon - nach, ' секнуд, ', abs(kon1 - nach1), ' милисекунд');
    writeln('Для продолжения дважды нажмите enter');
    readln;
    readln;
  end;
end.

