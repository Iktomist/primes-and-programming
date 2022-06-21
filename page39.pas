PROGRAM P2_1_4;
CONST
size = 1000;
VAR
n: extended;
i,j,no_primes: integer;
p: array[1..size] of extended;
pass: boolean;

BEGIN
write ('number of primes = ? ');
readln (no_primes);
p[1] := 2;
p[2] := 3;
writeln(2,',',3); n:=3;
FOR i:= 3 TO no_primes DO
  BEGIN
  pass := false;
  WHILE NOT(pass) DO
    BEGIN
    n := n+2;
    j := 2;
    pass := true;
    WHILE (pass AND (j < i) AND (p[j]*p[j]<=n)) DO
      BEGIN
      pass := NOT(n = p[j]*INT(n/p[j]));
      j := j+1;
      END;
    IF pass THEN
      BEGIN
      p[i] := n;
      write(',',n:0:0);
      END;
    END;
  END;
END.
