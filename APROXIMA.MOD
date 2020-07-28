IMPLEMENTATION MODULE APROXIMA;

FROM P2BIOS IMPORT NATURAL,REAL;

(*********************************)
(* FUNCIONES PUBLICAS DEL MODULO *)
(*********************************)

(* FUNCIONES YA IMPLEMENTADAS *)

(* Implementacion de la funcion fact *)
(* Se devuelve un REAL para solventar el problema del rango
   de la implementacion de los enteros en Modula-2 *)
PROCEDURE fact(K:NATURAL):REAL;
VAR i:NATURAL;
    f:REAL;
BEGIN
  i:=0;f:=1.0;
  WHILE i<K DO
    f:=f*LFLOAT(i+1);
    i:=i+1;
  END;
  RETURN (f);
END fact;

(* Implementacion de la funcion pot *)
PROCEDURE pot(X:REAL;K:NATURAL):REAL;
VAR i:NATURAL;
    p:REAL;
BEGIN
  i:=0;p:=1.0;
  WHILE i<K DO
    p:=p*X;
    i:=i+1;
  END;
  RETURN (p);
END pot;

(* Implementacion de la funcion tmno *)
PROCEDURE tmno(X:REAL;K:NATURAL):REAL;
BEGIN
  RETURN ( pot(X,K) / fact(K) );
END tmno;

(* FUNCIONES QUE HA DE IMPLEMENTAR EL ALUMNO *)

(* Implementacion de la funcion sink *)
PROCEDURE sink(X:REAL;K:NATURAL):REAL;
BEGIN
    IF K=0 THEN     (*Caso trivial*)
        RETURN(X);
    ELSE            (*Caso No Trivial*)
        RETURN(pot(-1.0,K)*tmno(X,2*K+1)+sink(X,K-1));(*Llamada recursiva*)
    END;
END sink;

(* Implementacion de la funcion isink *)
(* El parametro F es REAL (y no NATURAL como en el desarrollo teorico) para
   solventar el problema del rango de los enteros en Modula-2 *)
PROCEDURE isink(X:REAL;K:NATURAL;P,F:REAL):REAL;
VAR solucion,PRUEBA:REAL;
BEGIN
    IF (K=0) OR (X=0.0) THEN      (*Caso trivial*)
        RETURN(X);
    ELSE	(*Caso No trivial*)
	RETURN(P/F+isink(X,K-1,(P/(X*X)*(-1.0)),F/VAL(REAL,((LFLOAT(2)*VAL(LONGREAL,K))+1.0)*(2.0*VAL(LONGREAL,K)))));
	(*llamada recursiva con inmersion por eficiencia con los parametros P y F.Recursividad NO-FINAL*)
    END;
    RETURN(solucion)
END isink;

(* Implementacion de la funcion iisink *)
(* El parametro F es REAL (y no NATURAL como en el desarrollo teorico) para
   solventar el problema de la falta de precision de los enteros en Modula-2 *)
PROCEDURE iisink(X:REAL;K:NATURAL;P,F,S:REAL):REAL;
BEGIN
    IF (K=0) OR (X=0.0) THEN    (*Caso Trivial*)
        RETURN(S+X);
    ELSE           (*Caso no trivial*)
        RETURN(iisink(X,K-1,(P/(X*X))*(-1.0),F /VAL(REAL,((2.0*VAL(REAL,K))+1.0)*(2.0*VAL(REAL,K))),S+(P/F)));
	(*llamada recursiva con inmersion por eficiencia con los parametros P y F.Recursividad FINAL*)
    END;
END iisink;

(* Implementacion de la funcion sinkit *)

(*Declaramos las variables solución e i. solución *)
(*irá sumando los resultados de las sucesivas iteraciones hasta*)
(*dar la solucion final. i será el contador de bucle*)
PROCEDURE sinkit(X:REAL;K:NATURAL):REAL;
VAR solucion:REAL;i:NATURAL;
BEGIN
    (*Inicializamos a cero las dos variables locales*)
    i:=0; (*contador de iteraciones*)
    solucion:=0.0;(*Almacenamiento de la solución*)
    WHILE i<=K DO (*Protección del bucle*)
        solucion:=solucion+pot(-1.0,i)*tmno(X,2*i+1);(*Instrucción restablecer*)
        i:=i+1;(*Avanzar*)
    END;
    RETURN solucion;
END sinkit;

END APROXIMA.
