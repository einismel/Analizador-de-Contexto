#= Título: 
#  Tabla de Simbolos 
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)
#= Contenido: 
#  Tabla de Simbolos del compilador del lenguaje yisiel.

class SymTable 
  attr_accessor :sim
	def initialize()
	  @sim = Hash.new()
	end

	def insert(str, symbol)
	  @sim.store(str, symbol)
	end

	def find(str) 
	  return @sim[str]
	end

	def delete(str)
	  @sim.delete(str)
	end

	def replace(str, sym)
	  @sim.update({str => sym})
	end
end



