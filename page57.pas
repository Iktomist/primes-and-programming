PROGRAM P2_4_3;
CONST
n=1000;
VAR
p,q,i,j,k: longint;
a: array[1..n] of boolean;
BEGIN
  FOR j:=1 TO n DO
    a[j] := true;
  p := 3; q := 4; j := 1;
  WHILE j <= n DO
    BEGIN
      IF a[j] = true THEN
        BEGIN
          write(p, ',');
          k:=q;
          WHILE k <= n DO
            BEGIN
              a[k] := false;
              k := k+p;
            END;
        END;
    j := j+1; p:=p+2; q:=q+2*p- 2;
    END;
END.
