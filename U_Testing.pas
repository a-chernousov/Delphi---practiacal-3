unit U_Testing;

interface

uses
  SysUtils,
  Windows;

procedure main_test(var check : boolean; str : string);
function IsOperator(ch: Char): Boolean;


implementation

//Type
  //TAuxiliarySet = set of ('(', ')', '+', '-', '/', '*');
  //TNumbers = set of '0'..'9';
  //TLower_case = set of 'a'..'z';
  //TCapital_letters= set of 'A'..'Z';

function IsOperator(ch: Char): Boolean;
begin
  Result := (ch = '+') or (ch = '-') or (ch = '*') or (ch = '/');
end;

function Test_In_str(str : string) : boolean;
var
  AuxiliarySet, Numbers, Lower_case,  Capital_letters, all_multitude : set of char;
  //Numbers : TNumbers;
  //Lower_case : TLower_case;
  //Capital_letters : TCapital_letters;
  //all_multitude : set of char;

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
  while (i <= lg) and (flag) do
    begin
      //flag := ((str[i] in Numbers) or (str[i] in AuxiliarySet) or (str[i] in Lower_case) or (str[i] in Capital_letters));
      //writeln(str[i]);
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





