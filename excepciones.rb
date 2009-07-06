#= Título:
# Excepciones Manejadas en el Programa.
#= Autores:
#* Einis Rodriguez
#* Elias Matheus (mailto:e3matheus@gmail.com)

# Descripción: Excepción que maneja los comentarios anidados.
class ComentarioAnidado < RuntimeError
end

# Descripción: Excepción que maneja los comentarios que nunca fueron cerrados.
class ComentarioInfinito < RuntimeError
end

# Descripción: Excepción que maneja los caracteres que no reconoce el lexer.
class CaracterInesperado < RuntimeError
end

# Descripción: Excepción que maneja los errores de utilizacion de tipo
class ErrdeTipo < RuntimeError
end

# Descripción: Excepción que maneja los errores cuando no se declara una variable usada en el programa
class VarNoDec < RuntimeError
end

