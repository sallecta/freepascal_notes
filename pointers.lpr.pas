program pointers;

{ Pointers quick notes. }
uses
  SysUtils,
  Variants;

const
  tab: char = #9;
  tab2: string = #9#9;
  nl: char = LineEnding;

var
  a: integer = 20;
  b: integer = 2540;

  {Pointer is a reference to variable (data)}

  {Typed Pointer can be de-referenced directly with Integer variables }
  ptr: ^integer;

  {Untyped Pointer is a simple data type that can hold the address of Any data type.
  Untyped Pointer needs further casting to target pointer type, ex. PInteger(ptrA)}
  //ptr: Pointer;

begin
  Writeln('');

  {Get address of "a" data.}   ptr := @a;
  {Same thing.}                ptr := addr(a);

  {Pointers CaN't take address of constant expressions.
  Error: Can't take the address of constant expressions}
  //ptr := addr(123);

  {Error: Can't read or write variables of this type
  Just de-referencing a Pointer variable is not sufficient.'

  To de-reference Pointer correctly you have to:
  - use appropriate type of pointer and data it points
  (for Integer data use PInteger or ^Integer Pointer);
  - or cast Pointer to appropriate type (for Integer data - PInteger(ptr)} ;
  Writeln('ptr^:', tab2 + tab, ptr^);

  {After cast, then de-reference: prints data value (20)}
  Writeln('PInteger(ptr)^:', tab2, PInteger(ptr)^);
  Writeln('');

  {We can change data the pointer referenced to, by passing other variable
  address to the pointer.} ptr := @b; {Now it contains address of "b" data.}


  {Invalid - will not compile.} //Writeln(ptr);
  {Error: Can't read or write variables of this type}
  {You have to use Format procedure to print the Pointer address}
  writeln(Format('Address of pointer: %p.', [@ptr]) + '');
  writeln(Format('Address of data: %p.', [ptr]) + '');
  writeln(Format('Content of data (dereferenced pointer): %d', [ptr^]) + '');

  Writeln('');
end.
