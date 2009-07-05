#= Título: 
# Clase Arbol Abstracto 
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Contiena la clase abstracto de arbol del compilador de yisiel

class AST
  attr_accessor :num, :sign
	def initialize()
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

class ASTTernario < AST
  attr_accessor :term1,:term2, :term3
	def initialize(term1, term2, term3)
		@term1 = term1
		@term2 = term2
		@term3 = term3
	end
end

class ASTMultiple < AST
  attr_accessor :hijos
	def initialize()
		@hijos = Array.new
	end
end

class ASTD < ASTMultiple
end

class ASTDec < ASTBinario 
  def initialize(term1, term2)
    super(term1,term2)  
    @term1.hijos.each do |hijo|
      if (@term2 == 'value') 
        @tablaGlobal.insert(hijo, SymVar.new(hijo,hijo.line, hijo.col)) 
      else 
        @tablaGlobal.insert(hijo, SymArray.new(hijo,hijo.line,hijo.col, hijo)) 
      end
        puts " EL valor es #{@term2.value}"
    end
  end
end

class ASTID < ASTMultiple
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

class ASTBool < ASTBinario
  def check(symtable, symtableG)
  end
end

class ASTConj < ASTBool
  def run(symtable, symtableG)
    exp1 = @exp1.run(symtable,symtableG)
	exp2 = @exp2.run(symtable,symtableG)
	return exp1 && exp2
  end
  
class ASTDis < ASTBool
  def run(symtable, symtableG)
    exp1 = @exp1.run(symtable,symtableG)
	exp2 = @exp2.run(symtable,symtableG)
	return exp1 || exp2
  end
  
class ASTNeg < ASTBool
  def run(symtable, symtableG)
    exp1 = @exp1.run(symtable,symtableG)
	exp2 = @exp2.run(symtable,symtableG)
	return !exp1
  end

class ASTLess < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	term2 = @term2.run(symtable, symtableG)
	return term1 < term2
  end
  
class ASTLeq < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	term2 = @term2.run(symtable, symtableG)
	return term1 <= term2
  end
  
class ASTGreat < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	term2 = @term2.run(symtable, symtableG)
	return term1 > term2
  end
  
class ASTGeq < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	term2 = @term2.run(symtable, symtableG)
	return term1 >= term2
  end
  
class ASTEqual < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	term2 = @term2.run(symtable, symtableG)
	return term1 == term2
  end
  
class ASTDif < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	term2 = @term2.run(symtable, symtableG)
	return term1 != term2
  end
  