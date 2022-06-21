PROGRAM P2_4_8;
CONST
max=443;
VAR
f:text;
i,p:integer;
s0,s1,x,rootx,total,ans:extended;
primarr:array[1..max] of extended;
finish:boolean;

  FUNCTION sieve(no_terms:integer):extended;
  VAR
  cond,cond4,exid:boolean; prod,s:extended; i,j:integer;
  count:array[1..10] of integer;

  PROCEDURE test(VAR prod:extended; VAR cond, exid:boolean);
  VAR
  i:integer; cond1,cond2,cond3:boolean;
  BEGIN
    prod:=1;
    FOR i:=1 TO no_terms DO
      BEGIN
        prod := prod*primarr[count[i]];
        cond1 := prod > x;
        cond2 := primarr[count[no_terms]] > rootx;
        cond := cond1 OR cond2
      END;
    cond3 := count[no_terms]=count[1] + (no_terms - 1);
    IF cond AND cond3 THEN
      exid := TRUE
    END;

    BEGIN
      exid := FALSE; prod := 1; s := 0;
      FOR i := 1 TO no_terms DO
        count[i] := i;
      test(prod,cond,exid);
      WHILE NOT(exid) DO
        BEGIN
          WHILE cond AND NOT(exid) DO
            BEGIN
              j := 2;
              WHILE (j <= no_terms - 1) AND NOT(exid) DO
                BEGIN
                  cond4 := count[no_terms]=count[j] + (no_terms - j);
                  IF cond AND cond4 THEN
                    BEGIN
                      count[j - 1] := count[j - 1]+1;
                      FOR i:=j TO no_terms DO
                        count[i] := count[i - 1]+1;
                      test(prod,cond,exid);
                      j := no_terms
                    END
                  ELSE
                    j:=j+1;
                END;
            END;
          WHILE NOT(cond) DO
            BEGIN
              s:=s+INT(x/prod);
              test(prod,cond,exid);
              IF cond THEN
                BEGIN
                  count[no_terms - 1]:=count[no_terms - 1]+1;
                  count[no_terms]:=count[no_terms - 1]+1;
                  test(prod,cond,exid);
                END;
            END;
        END;
      sieve:=s;
    END;
  
BEGIN
  assign(f,'PRIMES.DAT');
  reset(f);
  writeln('program to compute the number of primes <= x=9,699,690');
  writeln('using the legendre sieve technique');
  write('x= ? '); readln(x);
  rootx:=sqrt(x);
  FOR i:= 1 TO max DO
    read(f,primarr[i]);
    total:=0; s0 := INT(x)-1; writeln('s0 =',s0:8:0);
    i := 1; s1 := 0;
    WHILE primarr[i] <= rootx DO
      BEGIN
        s1 := s1+INT(x/primarr[i]);
        i := i+1;
      END;
  writeln('s1= ',s1:8:0);
  total:=s0-s1;
  finish:=FALSE;
  WHILE NOT(finish) DO
    BEGIN
      i:=2;
      WHILE (i<=7) OR (NOT finish) DO
        BEGIN
          ans := sieve(i);
          IF ans = 0 THEN
            finish := TRUE
          ELSE
            BEGIN
              writeln('s',i:1,'= ',ans:8:0);
              IF ODD(i) THEN
                ans := -ans;
              total := total+ans;
            END;
          i := i+1;
        END;
    END;
  p:=0; i:=1;
  WHILE primarr[i] <= rootx DO
    BEGIN
      p:=p+1;
      i:=i+1;
    END;
    writeln(' number of primes up to rootx = ',p:8);
    write('the number of primes up to ',x:8:0);
    writeln(' is ', total+p:8:0);
    close(f);
END.
