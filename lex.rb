#= Título: 
# Programa Principal del Programa.
#= Autores: 
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com) 
#= Usage
# 
#  Usage:  ruby yisiel.rb  [archivo]
 
require 'rdoc/usage'
require 'Lexer'
require 'Token'
require 'excepciones'

# Descripción: Ofrece un menú para introducir el archivo a analizar.
def introduceArchivo
	print "Introduzca el archivo para analizar(Para salir del sistema, escriba exit): "
	return $stdin.gets.chomp
end

# Descripción: Recibe la cantidad de parámetros en la instrucción. Si recibe uno solo, pide por consola el nombre del archivo. Si recibe dos, toma el 
# segundo argumento como el nombre del archivo. En cualquier otro caso, no acepta la instrucción. 
#* @param arg - Arreglo que contiene los elementos introducidos en la llamada al archivo.
def recibeArchivo(arg)
  case arg.length
    when 0
		  return introduceArchivo
    when 1
      return ARGV[0]
    else
      RDoc::usage('Usage')
  end
end

# Descripción: Analiza el archivo pasado por parámetro a través del analizador lexicográfico. Si al abrir el archivo ocurre un error, lo muestra y 
# pide otro documento.    
#* @param archivo - Archivo por analizar.
def look(archivo)
	begin 
		File.open(archivo, "r") do |file|
			lexer1 = Lexer.new(file)
			f= ""
			while !(f.nil?)
				begin
					f= lexer1.yylex
					puts f.to_s
				rescue ComentarioAnidado => err
					puts err
					return
				rescue ComentarioInfinito => err
					puts err
				rescue StandardError => err
					puts err
				end
			end
		end
	rescue SystemCallError => err 
			puts err
			archivo = introduceArchivo
			look(archivo) if !(archivo.eql? "exit")
	end
end

# Descripción: Programa principal. Chequea si el archivo existe, e imprime todos los tokens reconocidos por el analizador lexicográfico. De recibir 
# el parametro exit, no analiza ningun documento.
def main
  archivo = recibeArchivo(ARGV)
	look(archivo) if !(archivo.eql? "exit")
  puts "Hasta luego."
end

main
