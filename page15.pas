PROGRAM P1_3_5;
VAR
  a,b,r: extended;
BEGIN
  writeln ('type two positive numbers separated by a space');
  read (a,b);
  writeln ('the GCD of ', a:0:0, ' and ', b:0:0, ' is ');
  WHILE b > 0 DO
    BEGIN
      r := a - b * INT (a/b);
      a := b;
      b := r;
    END;
  writeln (a:0:0);
END.
