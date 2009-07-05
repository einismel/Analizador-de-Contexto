yisiel.rb: RubyCalcParser
	ruby yisiel.rb ArchivosPrueba/proce.txt

RubyCalcParser: 
	racc Parser.y -o RubyCalcParser.rb
