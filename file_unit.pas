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
  //write ('��� ��������: '); readln(name);
  name := 'input.txt';
  AssignFile (f, name);
  ok:=FileExists (name);
  if not ok then
    writeln ('���� �� ����������!');
 until ok;
 reset (f);
end;

procedure open_file_for_write (var f:textfile);
var name:string; ok:boolean; c:char;
begin
  repeat
    ok:=true;
    write ('������� ��� ��������� �����: '); readln(name);
    AssignFile (f, name);
    if FileExists (name) then
      begin
        writeln ('���� ����������, ������������?: Y - ��');
        readln (c);
        ok:=c in ['y','Y'];
      end;
  until ok;
  rewrite (f);
end;
end.
