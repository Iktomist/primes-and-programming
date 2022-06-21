PROGRAM P2_2_1;
VAR
r,c,m,s,i,j:extended;
n,k:integer;
key:array[1..10000] of integer;
BEGIN
  writeln('what is the value of r (even)? '); readln(r);
  writeln('what is the value of n (<= 10000)'); readln(n);
  c := r + 2*n + 1;
  m := INT(SQRT(c));
  FOR k:= 1 TO n DO
    key[k] := 0;
  i := 3;
  WHILE i <= m DO
    BEGIN
      s := 2*INT((r+i)/(2*i)) + 1;
      IF s = 1 THEN s := 3;
      j := s;
      WHILE j <= INT(c/i) DO
        BEGIN
          k := TRUNC((i*j - r + 1)/2);
          key[k] := 1;
          j := j + 2;
        END;
      i := i + 2;
    END;
  FOR k:=1 to n DO
    BEGIN
      IF key[k] = 0 THEN
      write((r + 2*k - 1):0:0,',');
    END;
END.

