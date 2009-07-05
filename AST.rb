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

class ASTUnario < AST
  attr_accessor :term1
	def initialize(exp)
		@term1 = exp
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
  def insertaHijo(hijo)
    @hijos.push(hijo)
  end
end

class ASTD < ASTMultiple
end

class ASTDec < ASTBinario 
  def initialize(term1, term2, tabla)
    super(term1,term2)
    @term1.hijos.each do |hijo|
      if (@term2.class.to_s == 'TkValue') 
        tabla.insert(hijo.value, SymVar.new(hijo.value,hijo.line, hijo.col)) 
      else
        tabla.insert(hijo.value, SymArray.new(hijo.value,hijo.line,hijo.col,term2))
      end
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

class ASTResUnario < ASTUnario
  def run(symtable, symtableG) 
    term1 = @term1.run(symtable,symtableG)  
    return term1*-1 
  end
end

class ASTRes < ASTMath
  def run(symtable, symtableG) 
    term1 = @term1.run(symtable,symtableG)  
    term2 = @term2.run(symtable,symtableG)  
    return term1 * term2
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
end

class ASTDis < ASTBool
  def run(symtable, symtableG)
    exp1 = @exp1.run(symtable,symtableG)
	  exp2 = @exp2.run(symtable,symtableG)
	  return exp1 || exp2
  end
end
  
class ASTNeg < ASTUnario
  def run(symtable, symtableG)
    exp1 = @exp1.run(symtable,symtableG)
	  return !exp1
  end
end

class ASTLess < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	  term2 = @term2.run(symtable, symtableG)
	  return term1 < term2
  end
end
  
class ASTLeq < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	  term2 = @term2.run(symtable, symtableG)
	  return term1 <= term2
  end
end

class ASTGreat < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	  term2 = @term2.run(symtable, symtableG)
	  return term1 > term2
  end
end
  
class ASTGeq < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	  term2 = @term2.run(symtable, symtableG)
	  return term1 >= term2
  end
end
  
class ASTEqual < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	  term2 = @term2.run(symtable, symtableG)
	  return term1 == term2
  end
end
 
class ASTDif < ASTBool
  def run(symtable, symtableG)
    term1 = @term1.run(symtable, symtableG)
	  term2 = @term2.run(symtable, symtableG)
	  return term1 != term2
  end
end 

# Nuevos Arboles

class ASTCuaternario < AST
  attr_accessor :term1,:term2, :term3, :term4
	def initialize(term1, term2, term3, term4)
		@term1 = term1
		@term2 = term2
		@term3 = term3
		@term4 = term4
	end
end

class ASTProc < ASTMultiple
  def initialize(term1,term2, term3, term4, term5, tablaGlobal)
    super(term1, term2)
 
    # Crear la tabla.    
    tabla = Symtable.new()
  
    # Insertar Valores en la tabla.
    # @term2 son los parametros pasados a la tabla
    @term2.hijos.each do |hijo|
      if (hijo.getModo() == 'TkIn') 
        tabla.insert(hijo.value, ParIn.new(hijo.value,hijo.line, hijo.col)) 
      else
        tabla.insert(hijo.value, ParOut.new(hijo.value,hijo.line,hijo.col))
      end
    end    

    # Insertar procedimiento en la Tabla de Simbolos Global.
    simbolo = SymProc.new(@term2.value, @term1.line, @term1.col, AST.new(), tabla)
    tablaGlobal.insert(@term2.value,simbolo)
  end
end

class ASTParametros < ASTBinario
  def getModo()
    return @term1.value.to_s
  end
  def getId()
    return @term2.value.to_s
  end
end

class ASTNum < ASTUnario
  def value()
   return @term1.value 
  end
  def run(symtable, symtableG)
   return @term1.value 
  end
end 

class ASTId < ASTUnario
  def value()
    return @term1.value
  end
  def getId()
    return @term1.value
  end 
  def getPosicion()
    return 0
  end
end

class ASTArray < ASTBinario
  def value()
   return @term1.value 
  end
  def getId()
    return @term1.value
  end
  def getPosicion()
    return @term2.value
  end
end

class ASTAsig < ASTBinario
  def initialize(term1,term2, symtableG)
    super(term1,term2)
    variable = symtableG.find(@term1.getId())
    variable.setValue(@term1.getPosicion(), @term2.run('e',symtableG))
    symtableG.replace(@term1.getId(), variable)
  end
end 
