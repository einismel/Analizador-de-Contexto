yisiel.rb: RubyCalcParser
	ruby yisiel.rb ArchivosPrueba/basico

RubyCalcParser: 
	racc Parser.y -o RubyCalcParser.rb
