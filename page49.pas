PROGRAM P2_1_21;
VAR
x,y,n:extended;
ydividesx:boolean;
f:file of extended;
BEGIN
  assign(f,'smallprimes');
  rewrite(f);
  writeln('n = ?');
  readln(n);
  writeln('prime numbers are ');
  x := 2;
  write(f,x);
  write(2,',');
  x:= 3;
  write(f,x);
  write(3);
  WHILE x <= n DO
    BEGIN
      y := 3;
      REPEAT
        BEGIN
          ydividesx := (x = y * INT(x/y));
          y := y+2;
        END;
      UNTIL (y > SQRT(x)) OR (ydividesx);
      IF NOT (ydividesx) THEN
        BEGIN
          write(f,x);
          write(',',x:0:0);
        END;
      x := x+2;
    END;
  close(f);
END.
