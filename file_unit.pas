unit file_unit;

interface


  procedure open_file_for_read (var f:textfile);
  procedure open_file_for_write (var f:textfile);

implementation

uses
  SysUtils,
  Math,
  Windows;


procedure open_file_for_read (var f:textfile);
var name:string; ok:boolean;
begin
repeat
  //write ('имя входного: '); readln(name);
  name := 'input.txt';
  AssignFile (f, name);
  ok:=FileExists (name);
  if not ok then
    writeln ('файл не существует!');
 until ok;
 reset (f);
end;

procedure open_file_for_write (var f:textfile);
var name:string; ok:boolean; c:char;
begin
  repeat
    ok:=true;
    write ('Введите имя выходного файла: '); readln(name);
    AssignFile (f, name);
    if FileExists (name) then
      begin
        writeln ('Файл существует, перезаписать?: Y - ДА');
        readln (c);
        ok:=c in ['y','Y'];
      end;
  until ok;
  rewrite (f);
end;
end.
