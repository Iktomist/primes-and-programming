PROGRAM P2_1_11;
VAR
f: text;
i,m: integer;
prime: extended;
BEGIN
assign(f, 'PRIMES.DAT');
reset(f);
writeln('how many primes? ');
read(m);
FOR i:=1 TO m DO
  BEGIN
  read(f,prime);
  write(prime:0:0,',');
  END;
close(f);
END.
