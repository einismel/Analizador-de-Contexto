#= Título: 
# Clase Simbolos
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Simbolos pertenecientes al Analizador de Contexto del lenguaje yisiel.

class Sym 
	attr_accessor :str, :line, :col 
	def initialize(str,line, col)
		@str   = str
		@line   = line
		@col    = col
	end
end

class SymVar < Sym
	attr_accessor :value
	def initialize(str,line, col, value)
		@str   = str
		@line   = line
		@col    = col
		@value = value
	end
end

class ParIn < SymVar
	
end

class ParOut < SymVar
end

class SymArray < Sym 
	attr_reader :dim
	attr_accessor :values
	def initialize(str,line, col, dim, values)
		@str   = str
		@line   = line
		@col    = col
		@values = values
		@dim = dim
	end
end

class SymProc < Sym
	attr_reader :ast
	attr_accessor :symtable
	def initialize(str,line, col, ast, symtable)
		@str   = str
		@line   = line
		@col    = col
		@symtable = symtable
		@ast = ast
	end
end
