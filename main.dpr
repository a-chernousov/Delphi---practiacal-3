program main;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  UQueueList in 'UQueueList.pas',
  U_Testing in 'U_Testing.pas',
  file_unit in 'file_unit.pas';

var
  st_m : TStack;
  st : string;
  tf : textfile;

function InfixToPostfix(expression: string): string;
var
  postfix: string;
  stack: TStack;
  i: Integer;
  ch: Char;
begin
  init(stack);
  postfix := '';

  for i := 1 to Length(expression) do
  begin
    ch := expression[i];

    if IsOperator(ch) then
    begin
      while (not IsEmpty(stack)) and (GetPrecedence(Peek(stack)) >= GetPrecedence(ch)) do
      begin
        postfix := postfix + Pop(stack);
      end;
      Push(stack, ch);
    end
    else if ch = '(' then
    begin
      Push(stack,ch);
    end
    else if ch = ')' then
    begin
      while (not IsEmpty(stack)) and (Peek(stack) <> '(') do
      begin
        postfix := postfix + Pop(stack);
      end;
      Pop(stack);
    end
    else
    begin
      postfix := postfix + ch;
    end;
  end;

  while not IsEmpty(stack) do
  begin
    postfix := postfix + Pop(stack);
  end;

  Result := postfix;
end;

var
  expression, postfixExpression: string;
  check : boolean;
begin
  setConsoleCP(1251);
  setConsoleoutputCP(1251);

  Write('������� ��������� ����� ������: ');
  ReadLn(expression);
  Trim(expression);
  main_test(check, expression);

  if check then
    begin
      postfixExpression := InfixToPostfix(expression);
      Writeln('����������� ����� ������: : ', postfixExpression);
    end
    else
      Writeln('������ ����� ��������� ������!!!');
     
  ReadLn;
end.
