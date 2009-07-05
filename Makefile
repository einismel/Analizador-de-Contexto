yisiel.rb: RubyCalcParser
	ruby yisiel.rb ArchivosPrueba/main.txt

RubyCalcParser: 
	racc Parser.y -o RubyCalcParser.rb
