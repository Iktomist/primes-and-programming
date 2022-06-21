PROGRAM P2_1_10;
VAR
n,q,max: extended;
qdividesn: boolean;
f: text;

BEGIN
assign(f, 'PRIMES.DAT');
rewrite(f);
write('max = ?');
readln(max);
n:=3;
writeln('prime numbers are ');
write('2,3');
write(f,2:7);
write(f,3:7);
WHILE n <= max DO
  BEGIN
  q:=3;
  REPEAT
    BEGIN
    qdividesn:=(n = q* INT(n/q));
    q := q+2;
    END;
  UNTIL (q > SQRT(n)) OR (qdividesn);
  IF NOT(qdividesn) THEN
    BEGIN
    write(',',n:0:0);
    write(f,n:7:0);
    END;
  n:=n+2;
  END;
close(f);
END.
