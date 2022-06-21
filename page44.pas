PROGRAM P2_1_13;
VAR
f: text;
n, prime: extended;
BEGIN
writeln('what is the number to be factorized? ');
read(n);
assign(f,'PRIMES.DAT');
reset(f);
WHILE n > 1 DO
  BEGIN
  read(f,prime);
  WHILE (n/prime = INT(n/prime)) DO
    BEGIN
    write(prime:0:0,',');
    n:=n/prime;
    END;
  END;
close(f);
END.
