IMPLEMENTATION MODULE P2BIOS;

(* MODULO P2BIOS
   Implementacion de las funciones basicas de entrada/salida necesarias
   para la realizacion de la practica de Programacion II, curso 2010/11

   Este modulo NO DEBE ser modificado a la hora de realizar la practica
*)

(* Funciones importadas de otros modulos *)

FROM ConvTypes IMPORT ConvResults;
FROM STextIO   IMPORT ReadToken,SkipLine,WriteLn,WriteString;
FROM WholeStr  IMPORT CardToStr,StrToCard;
FROM LongStr   IMPORT RealToStr,StrToReal;
FROM TimeConv  IMPORT millisecs;

(************************)
(* Funciones del modulo *)
(************************)

(* Accion: LeeCadena
   Lee la siguiente cadena de la entrada
   Parametro de entrada/salida:
    -CADENA:TipoCADENA contendra la cadena leida
*)
PROCEDURE LeeCadena(VAR CADENA:TipoCADENA);

BEGIN
  ReadToken(CADENA); (* Leemos la siguiente cadena de la entrada *)
  SkipLine();        (* Saltamos el salto de linea *)
  (* Al llegar aqui o bien hemos leido la siguiente cadena o hemos llegado al
     final del fichero de entrada
  *)
END LeeCadena;

(* Accion: EscribeCadena
   Escribe en la salida la cadena que le pasemos como argumento
   Parametro de entrada:
    -CADENA:TipoCADENA cadena a ser escrita
*)
PROCEDURE EscribeCadena(CADENA:TipoCADENA);

BEGIN
  WriteString(CADENA); (* Escribimos la cadena directamente *)
END EscribeCadena;

(* Accion: SaltoDeLinea
   Escribe en la salida un salto de linea
*)
PROCEDURE SaltoDeLinea();

BEGIN
  WriteLn; (* Escribimos un salto de linea directamente *)
END SaltoDeLinea;

(* Funcion: LeeNatural
   Lee el siguiente Token de la entrada saltando espacios y saltos de linea
   Tras la lectura intenta realizar la conversion del Token a un Natural
   Devuelve un valor Booleano indicando si la lectura ha sido correcta o no
   Parametro de entrada/salida:
    -NUMERO:Natural si la funcion devuelve TRUE, contendra el natural leido
*)
PROCEDURE LeeNatural(VAR NUMERO:NATURAL):BOOLEAN;

VAR CADENA:TipoCADENA;   (* Variable auxiliar para leer una cadena *)
    CONVRES:ConvResults; (* Variable auxiliar para controlar la conversion *)

BEGIN
  LeeCadena(CADENA);
  StrToCard(CADENA,NUMERO,CONVRES); (* Lo convertimos en NATURAL *)
  RETURN (CONVRES = strAllRight);
END LeeNatural;

(* Accion: EscribeNatural
   Escribe en la salida el natural que le pasemos como argumento
   Parametro de entrada:
    -NUMERO:NATURAL numero natural a ser escrito
*)
PROCEDURE EscribeNatural(NUMERO:NATURAL);

VAR CADENA:TipoCADENA; (* Variable auxiliar para realizar la conversion *)

BEGIN
  CardToStr(NUMERO,CADENA); (* Convertimos el natural en cadena *)
  WriteString(CADENA);      (* Escribimos la cadena resultante *)
END EscribeNatural;

(* Funcion: LeeReal
   Lee el siguiente Token de la entrada saltando espacios y saltos de linea
   Tras la lectura intenta realizar la conversion del Token a un Real
   Devuelve un valor Booleano indicando si la lectura ha sido correcta o no
   Parametro de entrada/salida:
    -NUMERO:Real si la funcion devuelve TRUE, contendra el real leido
*)
PROCEDURE LeeReal(VAR NUMERO:REAL):BOOLEAN;

VAR CADENA:TipoCADENA;   (* Variable auxiliar para leer una cadena *)
    CONVRES:ConvResults; (* Variable auxiliar para controlar la conversion *)

BEGIN
  LeeCadena(CADENA);
  StrToReal(CADENA,NUMERO,CONVRES); (* Lo convertimos en ReaL *)
  RETURN (CONVRES = strAllRight);
END LeeReal;

(* Accion: EscribeReal
   Escribe en la salida el real que le pasemos como argumento
   Parametro de entrada:
    -NUMERO:REAL numero real a ser escrito
*)
PROCEDURE EscribeReal(NUMERO:REAL);

VAR CADENA:TipoCADENA; (* Variable auxiliar para realizar la conversion *)

BEGIN
  RealToStr(NUMERO,CADENA); (* Convertimos el real en cadena *)
  WriteString(CADENA);      (* Escribimos la cadena resultante *)
END EscribeReal;

(* Accion: TomaTiempo
   Devuelve un NATURAL con el numero de milisegundos transcurridos
   desde la medianoche anterior
*)
PROCEDURE TomaTiempo():NATURAL;

BEGIN
  RETURN (millisecs()); (* Devolvemos el valor deseado *)
END TomaTiempo;

(* Funcion: DuracionIntervalo
   Calcula la duracion en milisegundos entre dos instantes que se le pasen
   como parametros. Devuelve un valor NATURAL.
   Parametros de entrada:
    -INICIAL:NATURAL instante inicial obtenido con TomaTiempo()
    -FINAL:NATURAL instante final obtenido con TomaTiempo()
   Comentarios adicionales:
    -Por construccion no puede calcular duraciones superiores a un dia
*)
PROCEDURE DuracionIntervalo(INICIAL,FINAL:NATURAL):NATURAL;

VAR RESULTADO:NATURAL; (* Variable auxiliar para almacenar el resultado *)

BEGIN
  IF (FINAL < INICIAL) THEN
     RESULTADO:=FINAL-INICIAL+86400000; (* Ajuste si hay cambio de dia *)
  ELSE
     RESULTADO:=FINAL-INICIAL;          (* Calculo normal *)
  END;
  RETURN (RESULTADO);
END DuracionIntervalo;

END P2BIOS.
