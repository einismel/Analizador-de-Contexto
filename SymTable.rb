#= Título: 
#  Tabla de Simbolos 
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Tabla de Simbolos del compilador del lenguaje yisiel.

class SymTable 
  attr_accessor :key, :value
	def initialize()
	  @key = Array.new()
	  @value = Array.new()
	end

	def insert(str, symbol)
    @key.push(str)
    @value.push(symbol)
	end

	def find(str) 
	  if @key.index(str).nil?
        return nil
      else		
	    return @value[@key.index(str)]
	  end
	end

	def delete(str)
	end

	def replace(str, sym)
	  @value[@key.index(str)]= sym
	end
end
