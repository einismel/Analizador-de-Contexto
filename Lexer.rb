#= Título: 
# Lexer sin el case
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Analizador Lexicografico del lenguaje yisiel.

require "Token"
require "excepciones"

class Lexer
  attr_reader :line, :col
  
  # Descripción: Constructor del Lexer
  # @param input - Archivo al cual debemos analizar
  # Contiene en 3 listas, las expresiones regulares, asociadas con su función
  def initialize(input)
    @input     = input
    @buffer    = @input.gets
    @line      = 1
    @col       = 1
		@ignorar = {'\A\n' => :nl, '\A\{#' => :ComentarioM, '\A((\s|\t)+)' => :Ignorar, '\A(#.*)' => :Ignorar}
    @ERs = {'\A\|' => TkPipe, '\A\+' => TkPlus, '\A\-'=> TkMinus, '\A\*' => TkTimes, '\A\/'=> TkDiv,'\A=' => TkSet, '\A\|\|' => TkDisy, '\A&&' => TkConj, '\A~' => TkNeg, '\A%' => TkRes, '\A<[^=]' => TkLess, '\A>[^=]' => TkGreat, '\A<=' => TkLE, '\A>=' => TkGE, '\A\$' => TkLength, '\A\(' => TkAP,'\A\)' => TkCP, '\A\[' => TkAC, '\A\]' => TkCC,'\A,' => TkComa, '\A:' => TkPP, '\A->' => TkAsigD, '\A<-'=> TkAsigI, '\A;' => TkPC, '\Aarray of '=> TkArrayOf}	
    @ERc = {'\A-?\d+'=> :Num,'\A([a-zA-Z](\w|_)*)' => :Word, '\A("[^"]*")'=> :Str, "\A('[^']*')"=> :Str}
  end

  # Descripción: Representa el movimiento en la página.
  # @param n - Número de pasos a saltar
  def skip( n=1 )
    @buffer = @buffer[ n .. -1 ]
    @col = @col + n 
  end

  # Descripción: Pasa a la siguiente Linea
  # @param extra - Parametro opcional, que permite condensar el codigo.  
  def nl(*extra)
    @buffer = @input.gets
    @line = @line + 1
    @col = 1
	return "ignora"
  end

  # Descripción: Crea un Token de String. 
  #* @param cl - Columna Actual en el archivo input.
  #* @param cc - Fila Actual en el archivo input.
  #* @param t - String q hizo match con la expresion regular.
  def Str( cl ,cc,t )
    return TkStr.new( cl, cc, t[1..-2]) 
	end

  def Num( cl ,cc,t )
    return TkNum.new( cl, cc, t.to_s) 
	end

  # Descripción: Chequea si hay un comentario anidado, de lo contrario manda a ignorar la expresion. 
  #* @param cl - Columna Actual en el archivo input.
  #* @param cc - Fila Actual en el archivo input.
  #* @param t - String q hizo match con la expresion regular.
  def Ignorar( cl ,cc, t)
	return "ignora"
  end
 
  # Descripción: Dependiendo del string que hizo match con la expresión regular, crea o un token de palabra reservada o un token de una variable del programa. 
  #* @param cl - Columna Actual en el archivo input.
  #* @param cc - Fila Actual en el archivo input.
  #* @param t - String q hizo match con la expresion regular.
  def Word( cl ,cc, t)
    begin
      case t
        when "main"
          return TkMain.new( cl, cc )
        when "out"
          return TkOut.new( cl, cc )
        when "in"
          return TkIn.new( cl, cc )
        when "begin"
          return TkBegin.new( cl, cc )
        when "end"
          return TkEnd.new( cl, cc )
        when "proc"
          return TkProc.new( cl, cc )
        when "as"
          return TkAs.new( cl, cc )
        when "return"
          return TkReturn.new( cl, cc )
        when "show"
          return TkShow.new( cl, cc )
        when "true"
          return TkTrue.new( cl, cc )
        when "false"
          return TkFalse.new( cl, cc )
        when "value"
          return TkValue.new( cl, cc )
        when "var"
          return TkVar.new( cl, cc )
        when "skip"
          return TkSkip.new( cl, cc )
        when "if"
          return TkIf.new( cl, cc )
        when "fi"
          return TkFi.new( cl, cc )
        when "do"
          return TkDo.new( cl, cc )
        when "od"
          return TkOd.new( cl, cc )
      else
        return TkId.new( cl, cc, t )
      end
    end 
  end

  # Descripción: Función de comentarios de líneas simples. Revisa que no existen Comentarios anidados, de haberlos crea un error. 
  #* @param cl - Columna Actual en el archivo input.
  #* @param cc - Fila Actual en el archivo input.
  #* @param t - String q hizo match con la expresion regular.
  def ComentarioS( cl ,cc, t)
    nl()
    return "ignora" 
  end 

# Descripción: Función de comentarios de múltiples líneas. Revisa que no existen Comentarios anidados, de haberlos crea un error. 
  #* @param cl - Columna Actual en el archivo input.
  #* @param cc - Fila Actual en el archivo input.
  #* @param t - String q hizo match con la expresion regular.
  def ComentarioM( cl ,cc, t)
		while true
		  # ... Nos interesa una línea con un numeral
      if @buffer =~ /\A([^#]*)#/
				# ... Revisamos el caracter anterior.
				if $1.length != 0
          skip($1.length-1) 
          raise ComentarioAnidado, "Error Linea #{@line}, Columna #{@col}. Comentarios Anidados!\n" if @buffer =~ /\A\{#/
          skip()
        end
				# ... Revisamos el caracter siguiente.
        if @buffer =~ /\A#\}/
          skip(2)
          return "ignora"
        end
        skip()
      else
				if @input.eof?
			    nl()
			    raise ComentarioInfinito, "No cerro el comentario. Error en ejecución" 
        end
		    nl()
      end
    end
  end

  # Descripción: Función de comentarios de múltiples líneas. Revisa que no existen Comentarios anidados, de haberlos crea un error. 
  #* @param h - Hash que recorremos.
  #* @param cl - Columna Actual en el archivo input.
  #* @param cc - Fila Actual en el archivo input.
  #* @param opcion - Define el tipo de función a ejecutar.
  def searchHash(h, cl, cc, opcion)
		h.each { |key,value|
			if @buffer =~ Regexp.new(key)
				if (value != TkMinus) &&  (value != TkGreat) &&  (value != TkLess) 
					  skip($&.length)
				else
					skip()
				end
				case opcion
					when 1	
						return value.send(:new, cl, cc)
					when 2
						return send(value, cl, cc, $&)
				end
			end
		}
		return nil
	end	
	
  # Descripción: Realiza una búsqueda en los hash y devuelve el token mas adecuado a la expresión regular.
  # De no encontrar ninguno que cuadre, o se acabo el archivo o existe un símbolo inválido. 
  def yylex()
    t = ""
    while t
			t = searchHash(@ignorar, @line, @col, 2) # ... Omito los caracteres que debo ignorar.	
			f = searchHash(@ERs, @line, @col, 1) # ... Reviso si cumple con las expresiones regulares simples.
			return f if f
			f = searchHash(@ERc, @line, @col, 2) # ... Reviso si cumple con las expresiones regulares complejas.
			return f if f
    end 
		return nil if (@input.eof? && @buffer.nil?)
		invalido = @buffer[0].chr
    skip()
		raise CaracterInesperado, "Caracter inesperado '#{invalido}' encontrado en linea #{@line}, Columna #{@col-1}.\n" 
  end
end
