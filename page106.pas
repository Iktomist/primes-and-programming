PROGRAM P5_1_5;
VAR n,b,n1,r: extended;
PROCEDURE PowerRule (base,power,modulus: extended; VAR res: extended);
VAR d: extended;
BEGIN
  res := 1;
  WHILE power > 0 DO
    BEGIN
      d := power-2*INT(power/2);
      IF d = 1 THEN
        BEGIN
          res := base*res;
          res := res-modulus*INT(res/modulus);
        END;
      base := base*base;
      base := base-modulus*INT(base/modulus);
      power := (power-d)/2;
    END;
END;

BEGIN
  writeln('type the values of n and b');
  readln(n,b);
  n1 := n - 1;
  r := 1;
  WHILE (n1 = INT(n1)) AND (r = 1) DO
    BEGIN
      PowerRule(b, n1, n, r);
      n1 := n1/2;
      writeln('residue is ',r:0:0);
    END;
  IF (r = 1) OR (r = n - 1) THEN
    writeln(n:0:0, ' has passed millers test to base ',b:0:0)
  ELSE
    writeln(n:0:0, ' has failed millers test to base ',b:0:0);
END.

