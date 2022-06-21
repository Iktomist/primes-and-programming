PROGRAM P2_1_17;
VAR
f:text;
r,s,x,y,p,xtemp,ytemp,ri,si:extended;
BEGIN
assign(f,'PRIMES.DAT');
reset(f);
writeln('input r and s');
readln(r,s);
x:=1;y:=1;
WHILE ((r>1) OR (s>1)) DO
  BEGIN
  read(f,p);
  xtemp:=1; ytemp:=1; ri:=0; si:=0;
  WHILE ((r/p) = INT(r/p)) DO
    BEGIN
    ri:=ri+1;
    r:=r/p;
    xtemp:=xtemp*p;
    END;
  WHILE ((s/p) = INT(s/p)) DO
    BEGIN
    si := si+1;
    s := s/p;
    ytemp := ytemp*p;
    END;
  IF (ri>=si) THEN
    y:=y*ytemp
  ELSE
    x:=x*xtemp;
  writeln('p=',p:0:0,' x=',x:0:0,' y=',y:0:0);
  END;
END.
