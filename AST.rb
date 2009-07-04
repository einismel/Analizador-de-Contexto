#= Título: 
# Clase Arbol Abstracto 
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Contiena la clase abstracto de arbol del compilador de yisiel

class AST
  attr_accessor :num, :sign
	def initialize(num, sign)
		@num = num
		@sign = sign
	end
  def check(symtable, symtableG)
  end
  def run(symtable, symtableG)
  end 
end

class ASTBinario < AST
  attr_accessor :term1,:term2
	def initialize(term1, term2)
		@term1 = term1
		@term2 = term2
	end
end

class ASTMath < ASTBinario
  def check(symtable, symtableG)
  end
end

class ASTSuma < ASTMath
  def run(symtable, symtableG)
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1 + term2
  end
end

class ASTResta < ASTMath
  def run(symtable, symtableG) 
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1 - term2
  end
end

class ASTMult < ASTMath
  def run(symtable, symtableG) 
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1 * term2
  end
end

class ASTDiv < ASTMath
  def run(symtable, symtableG)
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1 / term2 if term2 != 0
  end
end

class ASTRes < ASTMath
  def run(symtable, symtableG) 
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1 * term2
  end
end

class ASTResUnario < ASTBinario
  def run(symtable, symtableG) 
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1*-1 
  end
end

class ASTUnario < AST
  attr_accessor :term1
	def initialize(exp)
		@term1 = exp
	end

  def run(symtable, symtableG) 
    return term1.value
  end
end 
