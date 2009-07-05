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
inicio : dec procedimiento ppal   { ASTTernario.new(val[0],val[1],val[2]); 
                                    puts "dec procedimiento ppal\n" ;
                                    puts "\nLa tabla de simbolos es: \n"
                                    $tablaGlobal.sim.each do |x,y| 
                                      puts "El valor es #{x}, el simbolo es #{y}"
                                      if y.class.to_s == "SymProc"
                                        puts "\nLa tabla de simbolos locales del procedimiento es:.... \n"
                                        y.symtables[0].sim.each do |x2,y2|
                                          puts "El valor es #{x2}, el simbolo es #{y2}"
                                        end
                                        puts "La tabla de simbolos locales del procedimiento termina.... \n\n"
                                      end 
                                    end; }
;

/* Reglas de Declaraciones */

dec : dec TkVar ID TkPP tipo      { val[0].insertaHijo(ASTDec.new(val[2],val[4],$tablaGlobal));} 
    |                             { result = ASTMultiple.new(); }   
;

ID: ID TkComa TkId                { result.insertaHijo(val[2]); puts "ID -> ID , TkId(#{ val[2].value.to_s }) \n" } 
  | TkId                          { result = ASTMultiple.new(); result.insertaHijo(val[0]); puts "ID -> TkId(#{ val[0].value.to_s })\n" }
;

tipo: TkValue                     { puts "tipo -> value\n" } 
    | TkArrayOf TkNum             { result = ASTUnario.new(val[1]) ; puts "tipo -> array of Tknum\n"} 
;

/* Reglas de Procedimientos */

procedimiento : procedimiento TkProc TkId TkAP z TkCP TkAs decp instsp { val[0].insertaHijo(ASTProc.new(val[1], val[2], val[4], val[7],val[8],val[9])); 
                                                                        puts "procedimiento -> procedimiento proc TkId(#{val[2].value}) ( z ) as dec instsp\n" }
              |                                                       { result = ASTMultiple.new(); puts "procedimiento -> lambda" }
;

decp : decp TkVar ID TkPP tipo      { val[0].insertaHijo(ASTDec.new(val[2],val[4], val[0].tablaProc));} 
    |                               { result = ASTDecTotal.new(); }   
;

z : z TkComa modo TkId			  { val[0].insertaHijo(ASTParametros.new(val[2], val[3])); 
                                puts "z -> z , modo TkId(#{ val[3].value.to_s }) \n" }
  | modo TkId                 { result = ASTMultiple.new(); 
                                result.insertaHijo(ASTParametros.new(val[0],val[1])); 
                                puts "z -> modo TkId(#{ val[1].value.to_s }) \n" }
;

modo : TkIn                        { puts "modo -> TkIn\n" } 
     | TkOut                       { puts "modo -> TkOut\n" }
;

instsp  :  TkSkip                         { result = ASTUnario.new(val[0]); puts "instsp -> skip\n" }
		    |  TkReturn                       { result = ASTUnario.new(val[0]); puts "instsp -> TkReturn\n" } 
		    |  seleccionp                     { puts "instsp -> seleccionp\n" }
		    |  asignacion                     { puts "instsp -> asignacion\n"}
		    |  repeticionp                    { puts "instsp -> repeticionp\n"}
		    |  bloquep                        { puts "instsp -> bloquep\n"}
		    |  invocar                        { puts "instsp -> invocar\n"}
		    |  mostrar                        { puts "instsp -> mostrar\n"}
;

seleccionp:  TkIf yp TkFi                 { result = ASTUnario.new(val[1]); puts "seleccionp -> if yp fi\n" }
;

yp: yp TkPipe ifauxp                      { val[0].insertaHijo(val[2]); puts "yp -> yp | aifauxp\n" }
  | ifauxp									              { result = ASTMultiple.new(); 
                                            result.insertaHijo(val[0]); 
                                            puts "yp -> ifauxp\n" }
;

ifauxp: guardia TkAsigD instsp            { result = ASTBinario.new(val[0], val[2]); puts "ifauxp -> guardia <- instsp\n"}
;

repeticionp: TkDo yp TkOd                 { result = ASTUnario.new(val[1]); puts "repeticion -> do yp od \n" }
;

bloquep: TkBegin instruccionesp TkEnd     { result = ASTUnario.new(val[1]); puts "bloquep -> begin instruccionesp end" }
;

instruccionesp: instruccionesp TkPC instsp			    { val[0].insertaHijo(ASTUnario.new(val[2])); puts "ppal -> instruccionesp ; instsp \n" }
			        | instsp                              { result = ASTMultiple.new(); 
                                                      result.insertaHijo(ASTUnario.new(val[0])); 
                                                      puts "instruccionesp -> instsp\n" }
;

/* Reglas del Main */

ppal: TkMain instrucciones TkEnd        { result = ASTUnario.new(val[1]); puts "ppal -> main instrucciones end\n" }
;

instrucciones : instrucciones TkPC insts              { val[0].insertaHijo(ASTUnario.new(val[2])); puts "ppal -> instrucciones ; insts \n" }
              | insts                                 { result = ASTMultiple.new(); 
                                                        result.insertaHijo(ASTUnario.new(val[0])); 
                                                        puts "instrucciones -> insts\n" } /* Debe existir por lo menos una instruccion en el main */
;

insts : TkSkip                           { result = ASTUnario.new(val[0]); puts "insts -> skip\n" }
      | seleccion                        { puts "insts -> seleccion\n" }
      | asignacion                       { puts "insts -> asignacion\n"}
      | repeticion                       { puts "insts -> repeticion\n"}
      | bloque                           { puts "insts -> bloque\n"}
      | invocar                          { puts "insts -> invocar\n"}
      | mostrar                          { puts "insts -> mostrar\n"}
;

seleccion:  TkIf y TkFi                 { result = ASTUnario.new(val[1]); puts "seleccion -> if y fi\n" }
;

y : y TkPipe ifaux                      { val[0].insertaHijo(val[2]);  puts "y -> y | aifaux\n" }
  | ifaux									              { result = ASTMultiple.new(); 
                                          result.insertaHijo(val[0]); 
                                          puts "y -> ifaux\n" }
;

ifaux: guardia TkAsigD insts            { result = ASTBinario.new(val[0], val[2]); puts "ifaux -> guardia <- insts\n"}
; 

/*Las siguientes 2 instrucciones tienen una precedencia menor a las operaciones aritmeticas */
asignacion: x TkComa asignacion TkComa exp =VACIO1            { val[0].insertaHijo(ASTAsig.new(val[2],val[4])); puts "asignacion -> x asignacion , exp" }					 
          | x TkAsigI exp                           =VACIO1   { result= ASTMultiple.new(); 
                                                                result.insertaHijo(ASTAsig.new(val[0],val[2])); 
                                                                puts "asignacion -> TkId(#{val[0].value.to_s }) <-  exp" } 
;

x : TkId                            { result = ASTId.new(val[0]); puts "x -> TkId[#{ val[0].value.to_s }] ,\n" } 
  | TkId TkAC exp TkCC             { result = ASTArray.new(val[0], val[2]); puts "x -> TkId[#{ val[0].value.to_s }] [exp] ,\n" } 
;

repeticion: TkDo y TkOd                 { result = ASTUnario.new(val[0]); puts "repeticion -> do y od \n" }
;

bloque: TkBegin instrucciones TkEnd     { result = ASTUnario.new(val[1]); puts "bloque -> begin instrucciones end" }
;

invocar: TkId TkAP w TkCP           { result = ASTBinario.new(val[0],val[2]); puts "invocar -> TkId(#{ val[0].value.to_s }) ( w ) \n"}
;

w : w TkComa exp                    { val[0].insertaHijo(val[2]); puts " w -> w , exp \n" }  
  | exp                             { result = ASTMultiple.new(); 
                                      result.insertaHijo(val[0]); 
                                      puts "w -> exp"}
;

mostrar : TkShow auxmostrar			{ result = ASTUnario.new(val[1]); puts "mostrar -> show auxmostrar"} 
;

/* La precedencia  de la siguiente instruccion es menor a las operaciones aritmeticas */
auxmostrar:  exp               =VACIO1     { puts "mostrar -> show exp" }
          |  TkStr             
;

exp : exp TkPlus exp       { result = ASTSuma.new(val[0], val[2]);      puts "El resultado es #{result.run($tablaGlobal)}"}
    | exp TkMinus exp      { result = ASTResta.new(val[0], val[2]);     puts "exp -> exp - exp\n" }
    | exp TkTimes exp      { result = ASTMult.new(val[0], val[2]);      puts "exp -> exp * exp\n" }
    | exp TkDiv exp        { result = ASTDiv.new(val[0], val[2]);       puts "exp -> exp / exp\n" }
    | exp TkRes exp        { result = ASTRes.new(val[0], val[2]);       puts "exp -> exp % exp\n" }
    | TkMinus exp  =UMINUS { result = ASTResUnario.new(val[1]);         puts "exp -> - exp\n" }
    | TkAP exp TkCP        { result = ASTUnario.new(val[1]);            puts "exp -> ( exp )\n" }
    | TkNum                { result = ASTNum.new(val[0]);            puts "exp -> TkNum(#{val[0].value.to_s })\n" }
    | TkId                 { result = ASTId.new(val[0]);            puts "exp -> TkId(#{val[0].value.to_s})\n" }
    | TkId TkAC exp TkCC   { result = ASTArray.new(val[0], val[2]);     puts "exp -> TkId(#{val[0].value.to_s})[exp]\n" }
    | TkLength TkId        { result = ASTLength.new(val[1]);            puts "exp -> $ TkId(#{val[0].value.to_s})\n" }
;

guardia : guardia TkConj booleano       { result = ASTConj.new(val[0], val[2]); puts "guardia -> guardia && booleano" }
        | guardia TkDisy booleano       { result = ASTDisy.new(val[0], val[2]); puts "guardia -> guardia || booleano" }
        | TkNeg guardia                 { result = ASTNeg.new(val[1]);          puts "guardia -> ~ guardia" }
        | booleano                      { puts "guardia -> booleano"}
;

booleano: exp TkLE exp                { result = ASTLeq.new(val[0], val[2]); puts "guardia -> exp operador exp" }
        | exp TkGE exp                { result = ASTGeq.new(val[0], val[2]); puts "guardia -> exp operador exp" }
        | exp TkSet exp               { result = ASTEqual.new(val[0], val[2]); puts "guardia -> exp operador exp" }
        | exp TkDif exp               { result = ASTDif.new(val[0], val[2]); puts "guardia -> exp operador exp" }
        | exp TkLess exp              { result = ASTLess.new(val[0], val[2]); puts "guardia -> exp operador exp" }
        | exp TkGreat exp             { result = ASTGreat.new(val[0], val[2]); puts "guardia -> exp operador exp" }
        | TkTrue                      { puts "guardia -> true" }
        | TkFalse                     { puts "guardia -> false" }
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
$tablaGlobal = SymTable.new()
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
