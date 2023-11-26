unit UQueueList;

interface
  type
  TElem = char;
  TPtr = ^TNode;
  TNode = record
    inf : TElem;
    next : TPtr;
  end;
  TStack = TPtr;

   procedure Init (var S : TStack);                         //init!
   procedure Push (var S : TStack; el : TElem);             //Vstavit v stack
   function TryPush (var S : TStack; el : TElem) : boolean; //Dostat iz stack
   function Pop (var S : TStack) : TElem;
   function TryPop (var S : TStack; var el : TElem) : boolean;
   function IsEmpty (var S : TStack) : boolean;
   function Peek(var stack : TStack): TElem;                 //Prosmotr verxnego elem


implementation
uses SysUtils;

procedure Init (var S : TStack);
begin
  S:=nil;
end;

function IsEmpty (var S : TStack) : boolean;
begin
  Result:=(S = nil);
end;

function TryPop (var S : TStack; var el : TElem) : boolean;
var
  z : TPtr;
begin
  Result:=S<>nil;
  if Result then
    begin
      z:=S;
      el:=z^.inf;
      S:=z^.next;
      dispose(z);
    end;
end;
function TryPush (var S : TStack; el : TElem) : boolean;
var
  z : TPtr;
begin
  Result:=true;
  try
    new(z);
    z^.inf:=el;
    z^.next:=S;
    S:=z;
  except
    Result:=false;
  end;
end;

procedure Push (var S : TStack; el : TElem);
begin
  if not TryPush(S, el) then
    raise Exception.Create('Error');
end;

function Pop (var S : TStack) : TElem;
begin
  if not TryPop(S, Result) then
    raise Exception.Create('errro');
end;

function Peek(var stack : TStack): TElem;
var
  topElement: TElem;
begin
  if IsEmpty(stack) then
    raise Exception.Create('error!!!')
  else
  begin
    topElement := Pop(stack);
    Push(stack, topElement);
    Result := topElement;
  end;
end;

end.

