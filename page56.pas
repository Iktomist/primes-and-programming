PROGRAM P2_4_1;
CONST
f: array[0..12] of integer = (3,5,7,11,13,17,19,23,29,31,37,41,43);
VAR
i,j,prime: integer;
key: array[1..2000] of boolean;
BEGIN
  FOR i:= 1 TO 2000 DO
    key[i] := TRUE;
  j := 0;
  REPEAT
    BEGIN
      prime := f[j];
      i := prime*prime;
      WHILE i <= 2000 DO
        BEGIN
          key[i] := FALSE;
          i := i+2*prime;
        END;
      j := j+1;
    END;
  UNTIL (prime = 43);
  writeln('primes less than 2000 are:- 2');
  i:=3;
  WHILE i <= 2000 DO
    BEGIN
      IF key[i] THEN
        write(',',i);
      i := i + 2;
    END;
END.
