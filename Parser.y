#= Titulo: 
# Analizador Sintactico del Programa.
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com) 

class RubyCalcParser

	/* Reglas de Precedencia */

  prechigh 
    nonassoc UMINUS AUX /* Se asignan precedencias de instrucciones. */
    left TkTimes TkDiv TkRes
    left TkPlus TkMinus
    nonassoc TkGE TkLE TkLess TkGreat TkDif TkSet 
    left TkDisy TkConj TkNeg 
	nonassoc VACIO1
  preclow

	/* Declaraciones de Token */

token UMINUS AUX VACIO VACIO1 TkPipe TkPlus TkMinus TkTimes TkDiv TkSet TkDisy TkConj TkNeg TkRes TkLE TkGE TkLength TkLess TkGreat TkAP TkCP TkAC TkCC TkComa TkPP TkAsigD TkAsigI TkPC TkArrayOf TkNum TkStr TkMain TkOut TkIn TkBegin TkEnd TkProc TkAs TkReturn TkShow TkTrue TkFalse TkValue TkVar TkSkip TkIf TkFi TkDo TkOd TkId TkDif UX

	/* Gramatica */

rule
inicio : dec procedimiento ppal   { inicio = ASTTernario.new(val[0],val[1],val[2]); puts "dec procedimiento ppal" }
;

/* Reglas de Declaraciones */

dec : dec TkVar ID TkPP tipo      { val[0].hijos.push(ASTDec.new(val[2],val[4],@tablaGlobal));} 
|                                 { result = ASTD.new(); }   
;

ID: ID TkComa TkId                { result.hijos.push(val[2]); puts "ID -> ID , TkId(#{ val[2].value.to_s }) \n" } 
| TkId                            { result = ASTID.new(); result.hijos.push(val[0]); puts "ID -> TkId(#{ val[0].value.to_s })\n" }
;

tipo: TkValue                     {  puts "tipo -> value\n" } 
| TkArrayOf TkNum                 { result = ASTUnario.new(val[1]) ; puts "tipo -> array of Tknum\n"} 
;

/* Reglas de Procedimientos */

procedimiento : procedimiento TkProc TkId TkAP z TkCP TkAs dec instsp { puts "procedimiento -> procedimiento proc TkId(#{val[3].value.to_s}) ( z ) as dec instsp\n" }
              |                                                       { puts "procedimiento -> lambda" }
;

z : z TkComa modo TkId			  { puts "z -> z , modo TkId(#{ val[3].value.to_s }) \n" }
  | modo TkId                     { puts "z -> modo TkId(#{ val[1].value.to_s }) \n" }
;

modo : TkIn                        { puts "modo -> TkIn\n" } 
     | TkOut                       { puts "modo -> TkOut\n" }
;

instsp  :  TkSkip                           { puts "instsp -> skip\n" }
		|  seleccionp                            { puts "instsp -> seleccionp\n" }
		|  asignacion                           { puts "instsp -> asignacion\n"}
		|  repeticionp                           { puts "instsp -> repeticionp\n"}
		|  bloquep                               { puts "instsp -> bloquep\n"}
		|  invocar                              { puts "instsp -> invocar\n"}
		|  mostrar                              { puts "instsp -> mostrar\n"}
		|  TkReturn                   { puts "instsp -> TkReturn\n" } 
;

seleccionp:  TkIf yp TkFi                 { puts "seleccionp -> if yp fi\n" }
;
yp: yp TkPipe ifauxp                              { puts "yp -> yp | aifauxp\n" }
| ifauxp									{ puts "yp -> ifauxp\n" }
;

ifauxp: guardia TkAsigD instsp            { puts "ifauxp -> guardia <- instsp\n"}
;

repeticionp: TkDo yp TkOd                 { puts "repeticion -> do yp od \n" }
;

bloquep: TkBegin instruccionesp TkEnd     { puts "bloquep -> begin instruccionesp end" }
;

instruccionesp: instruccionesp TkPC instsp			   { puts "ppal -> instruccionesp ; instsp \n" }
			  | instsp                                 { puts "instruccionesp -> instsp\n" }
;

/* Reglas del Main */

ppal: TkMain instrucciones TkEnd        { puts "ppal -> main instrucciones end\n" }
;

instrucciones: instrucciones TkPC insts { puts "ppal -> instrucciones ; insts \n" }
| insts                                 { puts "instrucciones -> insts\n" } /* Debe existir por lo menos una instruccion en el main */
;

insts: TkSkip                           { puts "insts -> skip\n" }
|  seleccion                            { puts "insts -> seleccion\n" }
|  asignacion                           { puts "insts -> asignacion\n"}
|  repeticion                           { puts "insts -> repeticion\n"}
|  bloque                               { puts "insts -> bloque\n"}
|  invocar                              { puts "insts -> invocar\n"}
|  mostrar                              { puts "insts -> mostrar\n"}
;

seleccion:  TkIf y TkFi                 { puts "seleccion -> if y fi\n" }
;

y: y TkPipe ifaux                       { puts "y -> y | aifaux\n" }
| ifaux									{ puts "y -> ifaux\n" }
;

ifaux: guardia TkAsigD insts            { puts "ifaux -> guardia <- insts\n"}
; 

/*Las siguientes 2 instrucciones tienen una precedencia menor a las operaciones aritmeticas */
asignacion: x TkComa asignacion TkComa exp =VACIO1   { puts "asignacion -> x asignacion , exp" }					 
|  x TkAsigI exp                           =VACIO1   { puts "asignacion -> TkId(#{val[0].value.to_s }) <-  exp" } 
;

x: TkId                          { puts "x -> TkId[#{ val[0].value.to_s }] ,\n" } 
|  TkId TkAC exp TkCC            { puts "x -> TkId[#{ val[0].value.to_s }] [exp] ,\n" } 
;

repeticion: TkDo y TkOd                 { puts "repeticion -> do y od \n" }
;

bloque: TkBegin instrucciones TkEnd     { puts "bloque -> begin instrucciones end" }
;

invocar: TkId TkAP w TkCP          { puts "invocar -> TkId(#{ val[0].value.to_s }) ( w ) \n"}
;

w : w TkComa exp                    { puts " w -> w , exp \n" }  
  | exp                             { puts "w -> exp"}
;

mostrar : TkShow auxmostrar			{ puts "mostrar -> show auxmostrar"} 
;

/* La precedencia  de la siguiente instruccion es menor a las operaciones aritmeticas */
auxmostrar:  exp               =VACIO1     { puts "mostrar -> show exp" }
          |  TkStr             
;

exp : exp TkPlus exp       { result = ASTSuma.new(val[0], val[2]);      puts "El resultado es #{result.run(@tablaGlobal,@tablaGlobal)}"}
    | exp TkMinus exp      { result = ASTResta.new(val[0], val[2]);     puts "exp -> exp - exp\n" }
    | exp TkTimes exp      { result = ASTMult.new(val[0], val[2]);      puts "exp -> exp * exp\n" }
    | exp TkDiv exp        { result = ASTDiv.new(val[0], val[2]);       puts "exp -> exp / exp\n" }
    | exp TkRes exp        { result = ASTRes.new(val[0], val[2]);       puts "exp -> exp % exp\n" }
    | TkMinus exp  =UMINUS { result = ASTResUnario.new(val[1]);         puts "exp -> - exp\n" }
    | TkAP exp TkCP        { result = ASTUnario.new(val[1]);            puts "exp -> ( exp )\n" }
    | TkNum                { result = ASTUnario.new(val[0]);            puts "exp -> TkNum(#{val[0].value.to_s })\n" }
    | TkId                 { result = ASTUnario.new(val[0]);            puts "exp -> TkId(#{val[0].value.to_s})\n" }
    | TkId TkAC exp TkCC   { result = ASTArray.new(val[0], val[2]);     puts "exp -> TkId(#{val[0].value.to_s})[exp]\n" }
    | TkLength TkId        { result = ASTLength.new(val[1]);            puts "exp -> $ TkId(#{val[0].value.to_s})\n" }
;

guardia : exp operador exp            { puts "guardia -> exp operador exp" }
        | guardia conector booleano   { puts "guardia -> guardia conector booleano" }
;

booleano: TkNeg guardia               { puts "booleano -> ~ guardia" }
        | TkTrue                      { puts "booleano -> true" }
        | TkFalse                     { puts "booleano -> false" }; 

operador: TkLE                        { puts "operador -> <="} 
        | TkGE                        { puts "operador -> >="} 
        | TkSet                       { puts "operador -> ="} 
        | TkDif                       { puts "operador -> !="} 
        | TkLess                      { puts "operador -> <"} 
        | TkGreat                     { puts "operador -> >"} 
;

conector: TkConj                      { puts "conector -> &&"} 
        | TkDisy                      { puts "conector -> ||"} 
;

end # RubyCalcParser

---- header ----
require 'AST'
require 'Sym'
require 'SymTable'
require 'Token'
require 'excepciones'

---- inner ----
def initialize(lexer)
@ast = nil
@lexer = lexer
@tablaGlobal = SymTable.new()
end

  def parse()
   do_parse()
  end

  protected

  def next_token
    begin
      tok = @lexer.yylex
      return [false, false] if tok.nil?
      return [:"#{tok.class.to_s}",tok] #Se devuelve el token completo para poder reportar el error
    rescue CaracterInesperado => err
      puts err
      next_token
    end
  end

  def on_error(t, val, vstack)
    raise ParseError, sprintf("\nError sintactico cerca del valor %s (%s)", val.class.inspect, val.to_s || '?')
  end


