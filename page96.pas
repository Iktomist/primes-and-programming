PROGRAM P4_3_4;
VAR a,asaved,n,nsaved,r,m,capT,t:extended;

PROCEDURE MultiplyModM (x,y,modulus: extended; VAR prod: extended);
VAR a,b,c,d,z,e,f,v,v1,g,h,j,j1,k: extended;
BEGIN
  a := INT(x/capT); b:= x-a*capT;
  c := INT(y/capT); d:= y-c*capT;
  z := a*d+b*c; z:= z-modulus*INT(z/modulus);
  e := INT(a*c/capT); f:= a*c-e*capT;
  v := z+e*t;
  v1 := v/modulus;
  IF (v>0) OR (v1=INT(v1)) THEN v:= v - modulus *INT(v1)
    ELSE v:= v-modulus*(INT(v1) - 1);
    g := INT(v/capT); h:= v-g * capT;
    j := (f+g) * t;
    j1 := j/modulus;
    IF (j>0) OR (j1=INT(j1)) THEN j:=j-modulus*INT(j1)
    ELSE j:= j-modulus*(INT(j1)-1);
  k := j+b*d; k:= k-modulus*INT(k/modulus);
  prod := h*capT+k; prod := prod-modulus*INT(prod/modulus);
END;

PROCEDURE PowerRule (base,power,modulus: extended; VAR res: extended);
VAR d: extended;
BEGIN
  res := 1;
  WHILE power > 0 DO
    BEGIN
      d := power-2*INT(power/2);
      IF d = 1 THEN
        MultiplyModM(base,res,modulus,res);
      MultiplyModM(base,base,modulus,base);
      power := (power-d)/2;
    END;
END;

BEGIN
  writeln;
  writeln ('type the values of a, n, and m separated by space');
  readln (asaved,nsaved,m);
  capT := INT(SQRT(m)+0.5);
  t := capT*capT-m;
  n := nsaved;
  a := asaved;
  writeln;
  PowerRule(a,n,m,r);
  writeln;
  writeln ('the value of ',asaved:0:0,' to the power ',nsaved:0:0,' mod ',m:0:0,' is ',r:0:0);
END.
