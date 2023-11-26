unit U_Testing;

interface

uses
  SysUtils,
  Windows;

procedure main_test(var check : boolean; str : string);
function IsOperator(ch: Char): Boolean;
function GetPrecedence(ch: Char): Integer;

implementation

function GetPrecedence(ch: Char): Integer;
begin
  case ch of
    '+', '-': Result := 1;
    '*', '/': Result := 2;
    else Result := 0;
  end;
end;


function IsOperator(ch: Char): Boolean;
begin
  Result := (ch = '+') or (ch = '-') or (ch = '*') or (ch = '/');
end;

function Test_In_str(str : string) : boolean;
var
  AuxiliarySet, Numbers, Lower_case,  Capital_letters, all_multitude : set of char;
  lg, i: integer;
  flag : boolean;
begin
  AuxiliarySet := ['(', ')', '+', '-', '/', '*'];
  Numbers := ['0'..'9'];
  Lower_case := ['a'..'z'];
  Capital_letters := ['A'..'Z'];

  all_multitude :=  AuxiliarySet + Numbers + Lower_case + Capital_letters;
  lg := Length(str);
  i := 1;
  flag := true;
  while (i <= lg) and flag do
    begin
      flag := (str[i] in all_multitude);
      i := i + 1;
    end;
  Test_In_str :=  flag;
end;

procedure main_test(var check : boolean; str : string);
begin
  if (Test_In_str(str)) then
    check := true
  else
    check := false;
end;

end.

