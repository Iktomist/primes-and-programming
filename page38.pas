PROGRAM P2_1_3;
VAR
n,q,max:extended;
qdividesn:boolean;

BEGIN
write(' Max = ? ');
readln(max);
write('2');
n:=3;
WHILE n<=max DO
  BEGIN
  q := 3;
  qdividesn := false;
  WHILE (q*q<=n) AND NOT (qdividesn) DO
    BEGIN
    qdividesn:=(n=q*INT(n/q));
    q:=q+2;
    END;
  IF NOT (qdividesn) THEN write(',',n:0:0);
  n := n+2;
  END;
END.
