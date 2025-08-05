unit Menu;


interface

uses
  funciones,crt;
procedure menus;
implementation
procedure menus;
 var
 tam,option:integer ;
 vector:Tvector;
 evento:Tevento;
 salir:boolean;
 begin
 salir:=false;
 tam:=0 ;

 while not salir do
 begin


 Writeln('Bienvenido');
 If tam=0 then
 begin
  clrscr;
 Writeln('1)Agregar evento')     ;
  Writeln('0)Salir')  ;
  readln(option);
 end
 else
     begin
     clrscr;
     Writeln('1)Agregar evento')  ;
      Writeln('2)Eliminar evento')   ;
       Writeln('3)Buscar eventos por subcadena')   ;
       Writeln('4)Buscar eventos por fecha')        ;
       Writeln('5)Buscar eventos por tipo')          ;
       Writeln('0)Salir')  ;
        readln(option);
       end;
 case option of
   1: Agregar(vector,evento,tam) ;
   2: Eliminar(vector,tam);
   3: busca_subcadena(vector,tam  );
   4: busca_fecha(vector,tam);
   5:MostrarSegunTipo (vector, tam);
   0:salir:=true;

 end;
 end;
 end;
end.


