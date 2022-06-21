PROGRAM P2_1_15;
VAR
f:text; n,prime:extended;
BEGIN
writeln('type n');
read(n);
assign(f,'PRIMES.DAT');
reset(f);
prime:=1;
WHILE ((n>1) AND (NOT(EOF(f))) AND (prime*prime <=n)) DO
  BEGIN
  read(f,prime);
  WHILE ((n/prime = INT(n/prime))
  AND (prime*prime <=n)) DO
    BEGIN
    write(prime:0:0,',');
    n:=n/prime;
    END;
  END;
IF n>1 THEN write(n:0:0);
close(f);
END.

