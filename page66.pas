PROGRAM P2_4_12;
VAR
b,k: integer;
y: real;
f: text;
p: array[1..100] of integer;
  FUNCTION phi(x:real; a:integer):integer;
  BEGIN
    IF a > 1 THEN
      phi := phi(x, a - 1) - phi(x/p[a], a - 1)
    ELSE
      phi := trunc((x+1/2));
  END;

BEGIN
  assign(f, 'PRIMES.DAT');
  reset(f);
  FOR k := 1 to 100 DO
    read(f, p[k]);
  close(f);

  writeln('type the value of x and a separated by a space ');
  readln(y,b);
  writeln(phi(y,b));
END.
