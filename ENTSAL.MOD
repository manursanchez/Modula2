IMPLEMENTATION MODULE ENTSAL;

(* MODULO ENTSAL
   Implementacion de las funciones basicas de entrada/salida especificas
   de la practica de Programacion II para el curso 2010/2011

   Este modulo NO DEBE ser modificado a la hora de realizar la practica
*)

FROM P2BIOS  IMPORT LeeNatural,LeeReal,
                    NATURAL,REAL;

(* Funcion: LeerPrueba
   Lee una prueba del juego de pruebas y chequea que sea correcta
   Devuelve un valor Booleano indicando si la lectura ha sido correcta o no
   Parametros de entrada/salida:
   -X:Valor donde aproximar el seno
   -K:Orden de aproximacion
*)
PROCEDURE LeerPrueba(VAR X:REAL;VAR K:NATURAL):BOOLEAN;

VAR RESULTADO:BOOLEAN;   (* Variable auxiliar para almacenar el resultado *)

BEGIN
  RESULTADO:=FALSE;
  IF LeeReal(X) THEN
     IF LeeNatural(K) THEN
        RESULTADO:=(K<=100) AND (X>=0.0) AND (X<=2.0*PI);
     END;
  END;
  RETURN ( RESULTADO );
END LeerPrueba;


END ENTSAL.
