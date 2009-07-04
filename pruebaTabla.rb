require "Sym"
require "SymTable" 

tabla = SymTable.new()
simbolo = SymVar.new("TkId", 1 , 2, "funcion")
puts simbolo.value
tabla.insert(simbolo.value, simbolo)
puts tabla.find(simbolo.value)
tabla.delete(simbolo.value)
puts tabla.find(simbolo.value)
