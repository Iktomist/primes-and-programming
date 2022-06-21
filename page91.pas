PROGRAM P4_2_3;
VAR a, asaved, n, nsaved, r, m : extended;
  PROCEDURE PowerRule (base,power,modulus:extended; VAR res:extended);
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
  writeln;
  writeln ('type the values of a,n, and m, separated by spaces');
  readln(asaved,nsaved,m);
  n:=nsaved;
  a:=asaved;
  writeln;
  PowerRule(a,n,m,r);
  writeln;
  writeln(' the value of ',asaved:0:0, ' to the power ',nsaved:0:0,' mod ',m:0:0,' is ',r:0:0);
END.
