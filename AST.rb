#= Título: 
# Clase Arbol Abstracto 
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Contiene la clase abstracta de arbol del compilador de yisiel

class AST
  attr_accessor :num, :sign
	def initialize()
	end
  def check(symtable)
  end
  def run(symtable)
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

class ASTDec < ASTBinario 
  def initialize(term1, term2, tabla)
    super(term1,term2)
    @term1.hijos.each do |hijo|
      if (@term2.class.to_s == 'TkValue') 
        tabla.insert(hijo.getId(), SymVar.new(hijo.getId(),hijo.getToken().line, hijo.getToken().col)) 
      else
        tabla.insert(hijo.getId(), SymArray.new(hijo.getId(),hijo.getToken().line,hijo.getToken().col,term2))
      end
    end
  end
end

class ASTMath < ASTBinario
  def check(symtable)
  end
end

class ASTSuma < ASTMath
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable) 
    term2 = @term2.run(symtable) 	
    return term1 + term2
  end
end

class ASTResta < ASTMath
  def check(symtble)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable) 
    term1 = @term1.run(symtable)  
    term2 = @term2.run(symtable)  
    return term1 - term2
  end
end

class ASTMult < ASTMath
  def check(symtble)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable) 
    term1 = @term1.run(symtable)  
    term2 = @term2.run(symtable)  
    return term1 * term2
  end
end

class ASTDiv < ASTMath
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)  
    term2 = @term2.run(symtable)  
    return term1 / term2 if term2 != 0
  end
end

class ASTResUnario < ASTUnario
  def check(symtable, symtableG)
    @term1.check(symtable)  
  end
  def run(symtable) 
    term1 = @term1.run(symtable)  
    return term1*-1 
  end
end

class ASTRes < ASTMath
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable) 
    term1 = @term1.run(symtable)  
    term2 = @term2.run(symtable)  
    return term1 % term2
  end
end

class ASTBool < ASTBinario
  def check(symtable)
  end
end

class ASTConj < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	return term1 && term2
  end
end

class ASTDis < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	return term1 || term2
  end
end
  
class ASTNeg < ASTUnario
  def check(symtable)
    @term1.check(symtable)  
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	  return !term1
  end
end

class ASTLess < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	  return term1 < term2
  end
end
  
class ASTLeq < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	  return term1 <= term2
  end
end

class ASTGreat < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	  return term1 > term2
  end
end
  
class ASTGeq < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	  return term1 >= term2
  end
end
  
class ASTEqual < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	  return term1 == term2
  end
end
 
class ASTDif < ASTBool
  def check(symtable)
    @term1.check(symtable)  
    @term2.check(symtable)
  end
  def run(symtable)
    term1 = @term1.run(symtable)
	term2 = @term2.run(symtable)
	  return term1 != term2
  end
end 

class ASTExpBool < ASTUnario
  def check(tabla)
  end
  def run(tabla)
    return @term1.value
  end
end

# Nuevos Arboles

class ASTDecTotal < ASTMultiple
  attr_accessor :tablaProc
  def initialize() 
    @tablaProc = SymTable.new()
		@hijos = Array.new
  end
end

class ASTProc < ASTMultiple
  def initialize(term1,term2, term3, term4, term5, term6)
 
    # Crear la tabla y se le pasa el arbol.    
    tabla = term4.tablaProc
    arbol = term6

    # Insertar Valores en la tabla.
    # term3 son los parametros pasados a la tabla
    term3.hijos.each do |hijo|
      if (hijo.getModo() == 'in') 
        tabla.insert(hijo.getId(), ParIn.new(hijo.getId(), hijo.getToken().line, hijo.getToken().col)) 
      else
        tabla.insert(hijo.getId(), ParOut.new(hijo.getId(), hijo.getToken.line, hijo.getToken().col))
      end
    end    

    # Insertar procedimiento en la Tabla de Simbolos Global.
    simbolo = SymProc.new(term2.value, term1.line, term1.col, arbol, tabla)
    $tablaGlobal.insert(term2.value,simbolo)
  end
end

class ASTParametros < ASTBinario
  def getModo()
    return @term1.value.to_s
  end
  def getId()
    return @term2.value.to_s
  end
  def getToken()
    return @term1
  end
end

class ASTNum < ASTUnario
  def value()
   return @term1.value 
  end
  # si es un numero no hay ningun problema
  def check(symtable)
  end
  def run(symtable)
   return @term1.value 
  end
end 

class ASTId < ASTUnario
  def value()
    return @term1.value
  end
  def getToken()
    return @term1
  end
  def getId()
    return @term1.value
  end 
  def getPosicion()
    return 0
  end

  def check(symtable)
    elem = $tablaGlobal.find(@term1.value)
    elem2 = symtable.find(@term1.value)
	# se chequea que haya sido declarada
	if elem.nil?
	  raise VarNoDec, "No esta declarada la variable #{@term1.value}, en la linea #{@term1.line}, columna #{@term1.col}.\n"
	end
	  # se debe chequear que no se use un arreglo como una variable
	  if elem.class.to_s == "SymArray" ||  elem.class.to_s == "SymProc"
	    raise ErrdeTipo, "Utilizacion del arreglo o procedimiento '#{@term1.value}' como una variable simple, en la linea #{@term1.line}, columna #{@term1.col}.\n"
	  end
  end

  def run(symtable)
   term1 = $tablaGlobal.find(@term1.value)
   return term1.value
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
  def check(symtable)
    elem = $tablaGlobal.find(@term1.value)
	# se chequea que haya sido declarada
	if elem.nil?
	  raise VarNoDec, "No esta declarada la variable #{@term1.value}, en la linea #{@term1.line}, columna #{@term1.col}.\n"
	end
	# se debe chequear que no se use una variable como un arreglo
	if elem.class.to_s == "SymVar" ||  elem.class.to_s == "SymProc"
	  raise ErrdeTipo, "Utilizacion de la variable simple o procedimiento '#{@term1.value}' como un arreglo, en la linea #{@term1.line}, columna #{@term1.col}.\n"
	end
  end
end

class ASTAsig < ASTBinario
  def check(tabla)
    variable = $tablaGlobal.find(@term1.getId())
    puts "No esta declarada la variable..." if variable.nil?
  end
  def run(tabla)
    variable = $tablaGlobal.find(@term1.getId())
    variable.setValue(@term1.getPosicion(), @term2.run('e')) 
    $tablaGlobal.replace(@term1.getId(), variable) 
  end 
end 
