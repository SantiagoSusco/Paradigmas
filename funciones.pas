unit funciones;



interface
uses crt,sysutils;
type
TFecha=Record
  dia:string;
  mes:string;
  ano:string;
end;

Tevento=record
id:string;
Fecha_Inicio:TFecha;
Fecha_fin:TFecha;
Hora_inicio:string;
Hora_fin:string ;
ubicacion:string;
Titulo:string;
descripcion:string;
tipo:string;
end;
Tvector=array[1..43] of Tevento;

Procedure Agregar(var vector:Tvector;var evento:Tevento;var tam:integer);
Procedure Eliminar(var vector:Tvector;var tam:integer);
function BuscarTipo(eventos: Tvector; clave: string;tam:integer): string;
procedure MostrarSegunTipo (eventos: Tvector; tam: integer);
procedure busca_subcadena(vec:Tvector;tam:integer);
procedure busca_fecha(vec:Tvector;tam:integer);
implementation
 Procedure Agregar(var vector:Tvector;var evento:Tevento;var tam:integer);
 var
   opcion:integer;
   correcto:boolean;
 begin
  clrscr;
 correcto:=false;
 Writeln('Ingrese el ID del evento');
 readln(evento.id);
 Writeln('Ingrese el Titulo del evento');
 readln(evento.titulo);
 Writeln('Ingrese el descripcion del evento');
 readln(evento.descripcion);

 while not correcto   do
 begin
 Writeln('Ingrese el tipo del evento (1:"cumpleaños",2:"reunion",3:"otro"');

 readln(opcion);
 if opcion=1 then
   begin
  evento.tipo:='cumpleaños' ;
  correcto:=true;
  end
  else
    begin
      if opcion=2 then
        begin
        evento.tipo:='reunion' ;
        correcto:=true;
        end
        else
          begin
            if opcion=3 then
              begin
              evento.tipo:='otro';
            correcto:=true;
          end
          else
          write('ingrese opcion valida');
          read;
    end;


    end;
    end;



 Writeln('Ingrese la fecha de inicio');
 Write('dia: ');
  readln(evento.Fecha_Inicio.dia);
Write('mes: ');
  readln(evento.Fecha_Inicio.mes);
Write('año: ');
  readln(evento.Fecha_Inicio.ano);
  Writeln('Ingrese la fecha de Fin');
 Write('dia: ');
  readln(evento.Fecha_fin.dia);
Write('mes: ');
  readln(evento.Fecha_fin.mes);
Write('año: ');
  readln(evento.Fecha_fin.ano);
  Writeln('Ingrese la hora de inicio');
  readln(evento.Hora_inicio);
 Writeln('Ingrese la hora de fin');
  readln(evento.Hora_Fin);
 Writeln('Ingrese la ubicacion del evento');
 readln(evento.ubicacion);
 tam:=tam+1 ;
 vector[tam]:=evento  ;
 clrscr;


 end;

 Procedure Eliminar(var vector:Tvector;var tam:integer);
 var
   I:integer;
   encontrado:boolean;
   iden:string;
 begin
    i:=1;
    encontrado:=false;


 Write('Ingrese el ID del evento que desea eliminar: ');
 readln(iden);
 while (not encontrado) and (i<=tam) do
 begin
   if vector[i].id=iden  then
     begin
     vector[i]:=vector[tam];
     tam:=tam-1;
     encontrado:=true
     end
     else
       i:=i+1 ;

   end;
  If encontrado then
    Write('eliminado con exito')
    else
      begin
      Write('No hay ningun ID nombrado de esa forma');
      end;

  clrscr;
 end;
 function BuscarTipo(eventos: Tvector; clave: string;tam:integer): string;
var
  i: integer;
begin
BuscarTipo:='';
  for i := 1 to tam do
    if eventos[i].tipo = clave then
    begin
      BuscarTipo := BuscarTipo+'i';

    end;
  if BuscarTipo='' then
  BuscarTipo := '0';
end;
procedure MostrarSegunTipo (eventos: Tvector; tam: integer);
var
  tipoBuscado: string;
  posicion: string;
  correcto:boolean;
  opcion,i:integer ;

begin
correcto:=false;
 while not correcto   do
 begin
 Writeln('Ingrese el tipo del evento (1:"cumpleaños",2:"reunion",3:"otro"');

 readln(opcion);

 if opcion=1 then
   begin
  tipoBuscado:='cumpleaños' ;
  correcto:=true;
  end
  else
    begin
      if opcion=2 then
        begin
        tipoBuscado:='reunion' ;
        correcto:=true;
        end
        else
          begin
            if opcion=3 then
              begin
             tipoBuscado:='otro';
            correcto:=true;
          end
          else
          write('ingrese opcion valida');
          read;
    end;

  posicion := BuscarTipo(eventos, tipoBuscado,tam);

  if posicion <> '0' then
  begin
  for i:=1 to length(posicion) do
    begin
     writeln('ID del evento: ',eventos[strtoint(posicion[i])].titulo);
    end;

end
  else
    writeln('No se encontró ningún evento de tipo ', tipoBuscado, '.');

    end;

 end;
 clrscr;
end;
procedure busca_subcadena(vec:Tvector;tam:integer);
var
  e:boolean;
  subc:string;
  i,j,k:integer;
begin
  clrscr;
  write('Titulo: ');
  readln(subc);
  for i:=1 to tam do
  begin
    with vec[i] do
    begin
      if Titulo[i]=subc[1] then
      begin
        for j:=2 to length(subc) do
        begin
          k:=i+j-1;
          if Titulo[k]=subc[j] then
            e:=True
            else
              e:=False;
        end;
      end;
      if e then
        writeln(Titulo);
    end;
  end;
  readkey;
end;
procedure busca_fecha(vec:Tvector;tam:integer);
var
  i:integer;
  fi,ff:Tfecha;
begin
 clrscr;
 Writeln('Ingrese la fecha de inicio');
 Write('dia: ');
  readln(fi.dia);
Write('mes: ');
  readln(fi.mes);
Write('año: ');
  readln(fi.ano);
  Writeln('Ingrese la fecha de Fin');
 Write('dia: ');
  readln(ff.dia);
Write('mes: ');
  readln(ff.mes);
Write('año: ');
  readln(ff.ano);
  for i:=1 to tam do
  begin
    with vec[i] do
    begin
      if ((Fecha_Inicio.dia>=fi.dia) and (Fecha_fin.dia<=ff.dia) and (Fecha_Inicio.mes>=fi.mes) and (Fecha_fin.mes<=ff.mes) and (Fecha_Inicio.ano>=fi.ano) and (Fecha_fin.ano<=ff.ano)) then
      begin
        writeln('Eventos entre el ',fi.dia,'/',fi.mes,'/',fi.ano,' y ',ff.dia,'/',ff.mes,'/',ff.ano,':');
        writeln('Desde el ',Fecha_Inicio.dia,'/',Fecha_Inicio.mes,'/',Fecha_Inicio.ano,' hasta ',Fecha_fin.dia,'/',Fecha_fin.mes,'/',Fecha_fin.ano,':',id);
      end
    end;
  end;
  readkey;
end;
end.

