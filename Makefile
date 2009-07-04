yisiel.rb: RubyCalcParser documentar
	ruby yisiel.rb ArchivosPrueba/main.txt

documentar:
	rdoc -q .

RubyCalcParser: 
	racc Parser.y -o RubyCalcParser.rb
