unit UQueueList;

interface

type
  TElem = char;
  TPtr = ^TNode;
  TNode = record
    inf : TElem;
    next : TPtr;
  end;
  TQueue = record
    Head, Tail : TPtr;
  end;

  procedure Init (var Q : TQueue);
  function IsEmpty (var Q : TQueue) : boolean;
  function IsFull (var Q : TQueue) : boolean;
  function TryPush (var Q : TQueue; el : TElem) : boolean;
  procedure Push (var Q : TQueue; el : TElem);                 //Достать из стека
  function TryPop (var Q : TQueue; var el : TElem) : boolean;  //Вставить в стек
  function Pop (var Q : TQueue) : TElem;
  function Peek(var stack : TQueue): char;
  
implementation
uses SysUtils;

procedure Init (var Q : TQueue);
begin
  Q.Head:=nil;
  Q.Tail:=nil;
end;

function IsEmpty (var Q : TQueue) : boolean;
begin
  Result:=(Q.Head = nil);
end;

function IsFull (var Q : TQueue) : boolean;
var
  z : TPtr;
begin
  try
    new(z);
    dispose(z);
    Result:=false;
  except
    Result:=true;
  end;
end;

function TryPush (var Q : TQueue; el : TElem) : boolean;
var
  z : TPtr;
begin
  Result:=true;
  try
    new(z);
    z^.inf:=el;
    z^.next:=nil;
    if Q.Head = nil then
      Q.Head:=z
    else
      Q.Tail^.next:=z;
    Q.Tail:=z;
  except
    Result:=false;
  end;
end;


function TryPop (var Q : TQueue; var el : TElem) : boolean;
var
  z : TPtr;
begin
  Result:=Q.Head<>nil;
  if Result then
    begin
      z:=Q.Head;
      el:=z^.inf;
      Q.Head:=z^.next;
      dispose(z);
    end;
end;

procedure Push (var Q : TQueue; el : TElem);
begin
  if not TryPush(Q, el) then
    raise Exception.Create('Переполнение очереди');
end;

function Pop (var Q : TQueue) : TElem;
begin
  if not TryPop(Q, Result) then
    raise Exception.Create('Ошибка!');
end;



function Peek(var stack : TQueue): char;
var
  topElement: char;
begin
  if IsEmpty(stack) then
    raise Exception.Create('Ошибка!!!')
  else
  begin
    topElement := Pop(stack);
    Push(stack, topElement);
    Result := topElement;
  end;
end;

end.

