PROGRAM P1_3_16;
VAR
  a,b,a0,b0,q,r,s,s1,s2,t,t1,t2: extended;
BEGIN
  writeln ('type two positive numbers separated by a space');
  read (a,b);
  a0 := a; b0 := b;
  s2 := 1; s1 := 0; t2 := 0; t1 := 1;
  WHILE b > 0 DO
    BEGIN
      q := INT(a/b);
      r := a - b * q;
      s := s2 - q * s1;
      t := t2 - q * t1;
      a := b;
      b := r;
      s2 := s1; s1 := s;
      t2 := t1; t1 := t;
    END;
  writeln ('the gcd of ', a0:0:0, ' and ', b0:0:0, ' is ', a:0:0);
  writeln (a0:0:0, ' * ', s2:0:0, ' + ', b0:0:0, ' * ', t2:0:0, ' = ', a0:0:0);
END. 
