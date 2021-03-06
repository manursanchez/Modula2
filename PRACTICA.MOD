MODULE PRACTICA;

(* Modulo principal de la practica de Programacion II 2010/2011 *)

(* Datos y funciones importados de otros modulos *)

FROM P2BIOS IMPORT NATURAL,REAL,
                   LeeNatural,
                   EscribeNatural,EscribeReal,
		   EscribeCadena,SaltoDeLinea,
		   TomaTiempo,DuracionIntervalo;
		
FROM ENTSAL IMPORT LeerPrueba;

FROM APROXIMA IMPORT fact,pot,tmno,
                     sink,isink,iisink,sinkit;

(* Constantes *)

CONST REPETICIONES=100000;  (* Numero de llamadas para la toma de tiempos *)
                             (* Este valor puede ser modificado por el alumno *)

(* Variables *)

VAR X:REAL;                     (* Parametro X *)
    K:NATURAL;                  (* Parametro K *)
    SALIDA:REAL;		(* Salida de la funcion *)

    NDP,PRUEBA:NATURAL;		(* Numero de pruebas y prueba en la que estamos *)
    CORRECTA:BOOLEAN;		(* Para saber si la lectura de la prueba fue correcta o no *)

    TiempoINICIAL:NATURAL;      (* Tiempo inicial para el estudio del coste *)
    TiempoFINAL:NATURAL;        (* Tiempo final para el estudio del coste *)
    Duracion:NATURAL;		(* Duracion temporal de las llamadas *)
    Vueltas:NATURAL;		(* Numero de vueltas del bucle de llamadas *)

BEGIN
  IF ( LeeNatural(NDP) AND (NDP >0) ) THEN
     EscribeCadena("Numero de pruebas a ejecutar: ");
     EscribeNatural(NDP);
     SaltoDeLinea;
     PRUEBA:=1;CORRECTA:=TRUE;
     WHILE ( CORRECTA AND ( PRUEBA <= NDP ) ) DO
           CORRECTA:=LeerPrueba(X,K);
           IF CORRECTA THEN
              EscribeCadena("Prueba numero ");
	      EscribeNatural(PRUEBA);
	      SaltoDeLinea;
	      EscribeCadena("Aproximacion de orden ");
	      EscribeNatural(K);
	      EscribeCadena(" del seno de ");
	      EscribeReal(X);
	      SaltoDeLinea;SaltoDeLinea;

	      (* Calculo emp�rico del coste de la funcion recursiva sink *)
	      TiempoINICIAL:=TomaTiempo();
	      Vueltas:=0;
	      WHILE ( Vueltas < REPETICIONES ) DO
	            SALIDA:=sink(X,K);
		    Vueltas:=Vueltas+1;
	      END;
	      TiempoFINAL:=TomaTiempo();
	      Duracion:=DuracionIntervalo(TiempoINICIAL,TiempoFINAL);
	      EscribeCadena("Resultado de la funcion sink: ");
	      EscribeReal(SALIDA);
	      SaltoDeLinea;
	      EscribeCadena("La funcion sink emplea ");
 	      EscribeNatural(Duracion);
	      EscribeCadena(" milisegundos.");
	      SaltoDeLinea;SaltoDeLinea;

	      (* Calculo empirico del coste de la funcion recursiva isink *)
	      TiempoINICIAL:=TomaTiempo();
	      Vueltas:=0;
	      WHILE ( Vueltas < REPETICIONES ) DO
                    (* MODIFICAR LA LLAMADA INICIAL A isink *)
	            SALIDA:=isink(X,K,pot(X,(2*K)+1)*(1.0-(2.0*LFLOAT(K MOD 2))),fact((2*K)+1));
                    (* MODIFICAR LA LLAMADA INICIAL A isink *)
	            Vueltas:=Vueltas+1;
	      END;
	      TiempoFINAL:=TomaTiempo();
	      Duracion:=DuracionIntervalo(TiempoINICIAL,TiempoFINAL);
	      EscribeCadena("Resultado de la funcion isink: ");
	      EscribeReal(SALIDA);
	      SaltoDeLinea;
	      EscribeCadena("La funcion isink emplea ");
 	      EscribeNatural(Duracion);
	      EscribeCadena(" milisegundos.");
	      SaltoDeLinea;SaltoDeLinea;

	      (* Calculo empirico del coste de la funcion recursiva iisink *)
	      TiempoINICIAL:=TomaTiempo();
	      Vueltas:=0;
	      WHILE ( Vueltas < REPETICIONES ) DO
                    (* MODIFICAR LA LLAMADA INICIAL A iisink *)
	            SALIDA:=iisink(X,K,pot(X,(2*K)+1)*(1.0-(2.0*VAL(REAL,K MOD 2))),fact((2*K)+1),0.0);
                    (* MODIFICAR LA LLAMADA INICIAL A iisink *)
	            Vueltas:=Vueltas+1;
	      END;
	      TiempoFINAL:=TomaTiempo();
	      Duracion:=DuracionIntervalo(TiempoINICIAL,TiempoFINAL);
	      EscribeCadena("Resultado de la funcion iisink: ");
	      EscribeReal(SALIDA);
	      SaltoDeLinea;
	      EscribeCadena("La funcion iisink emplea ");
 	      EscribeNatural(Duracion);
	      EscribeCadena(" milisegundos.");
	      SaltoDeLinea;SaltoDeLinea;

	      (* Calculo empirico del coste de la funcion sinkit *)
	      TiempoINICIAL:=TomaTiempo();
	      Vueltas:=0;
	      WHILE ( Vueltas < REPETICIONES ) DO
	            SALIDA:=sinkit(X,K);
		    Vueltas:=Vueltas+1;
	      END;
	      TiempoFINAL:=TomaTiempo();
	      Duracion:=DuracionIntervalo(TiempoINICIAL,TiempoFINAL);
	      EscribeCadena("Resultado de la funcion sinkit: ");
	      EscribeReal(SALIDA);
	      SaltoDeLinea;
	      EscribeCadena("La funcion sink_it emplea ");
 	      EscribeNatural(Duracion);
	      EscribeCadena(" milisegundos.");
	      SaltoDeLinea;SaltoDeLinea;

           ELSE EscribeCadena("Error: la prueba ");
                EscribeNatural(PRUEBA);
		EscribeCadena(" es incorrecta.");
		SaltoDeLinea;
	   END;
	   PRUEBA:=PRUEBA+1;
     END;
  ELSE EscribeCadena("Error: el numero de pruebas no es valido.");
       SaltoDeLinea;
  END;
END PRACTICA.
