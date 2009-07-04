#= Título: 
# Clase Arbol Abstracto 
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Contiena la clase abstracto de arbol del compilador de yisiel

class AST
	def initialize(num, sign)
		@num = num
		@sign = sign
	end
  def check(symtable, symtableG)
  end
  def run(symtable, symtableG)
  end 
end

class ArbolBinario < AST
	def initialize(term1, op, term2)
		@term1 = term1
		@op = op
		@term2 = term2
	end
end

class ArbolUnario < AST
	def initialize(exp)
		@exp = exp
	end
end 

class ASTMath < Arbol Binario
  def check(symtable, symtableG)
  end
end

