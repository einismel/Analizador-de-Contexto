#
# DO NOT MODIFY!!!!
# This file is automatically generated by racc 1.4.5
# from racc grammer file "Parser.y".
#

require 'racc/parser'


require 'AST'
require 'Sym'
require 'SymTable'
require 'Token'
require 'excepciones'


class RubyCalcParser < Racc::Parser

module_eval <<'..end Parser.y modeval..idd2072dad63', 'Parser.y', 188
def initialize(lexer)
@ast = nil
@lexer = lexer
@tablaGlobal = SymTable.new()
end

  def parse()
   do_parse()
  end

  protected

  def next_token
    begin
      tok = @lexer.yylex
      return [false, false] if tok.nil?
      return [:"#{tok.class.to_s}",tok] #Se devuelve el token completo para poder reportar el error
    rescue CaracterInesperado => err
      puts err
      next_token
    end
  end

  def on_error(t, val, vstack)
    raise ParseError, sprintf("\nError sintactico cerca del valor %s (%s)", val.class.inspect, val.to_s || '?')
  end


..end Parser.y modeval..idd2072dad63

##### racc 1.4.5 generates ###

racc_reduce_table = [
 0, 0, :racc_error,
 3, 55, :_reduce_1,
 5, 56, :_reduce_2,
 0, 56, :_reduce_3,
 3, 59, :_reduce_4,
 1, 59, :_reduce_5,
 1, 60, :_reduce_6,
 2, 60, :_reduce_7,
 9, 57, :_reduce_8,
 0, 57, :_reduce_9,
 4, 61, :_reduce_10,
 2, 61, :_reduce_11,
 1, 63, :_reduce_12,
 1, 63, :_reduce_13,
 1, 62, :_reduce_14,
 1, 62, :_reduce_15,
 1, 62, :_reduce_16,
 1, 62, :_reduce_17,
 1, 62, :_reduce_18,
 1, 62, :_reduce_19,
 1, 62, :_reduce_20,
 1, 62, :_reduce_21,
 3, 64, :_reduce_22,
 3, 70, :_reduce_23,
 1, 70, :_reduce_24,
 3, 71, :_reduce_25,
 3, 66, :_reduce_26,
 3, 67, :_reduce_27,
 3, 73, :_reduce_28,
 1, 73, :_reduce_29,
 3, 58, :_reduce_30,
 3, 74, :_reduce_31,
 1, 74, :_reduce_32,
 1, 75, :_reduce_33,
 1, 75, :_reduce_34,
 1, 75, :_reduce_35,
 1, 75, :_reduce_36,
 1, 75, :_reduce_37,
 1, 75, :_reduce_38,
 1, 75, :_reduce_39,
 3, 76, :_reduce_40,
 3, 79, :_reduce_41,
 1, 79, :_reduce_42,
 3, 80, :_reduce_43,
 5, 65, :_reduce_44,
 3, 65, :_reduce_45,
 1, 81, :_reduce_46,
 4, 81, :_reduce_47,
 3, 77, :_reduce_48,
 3, 78, :_reduce_49,
 4, 68, :_reduce_50,
 3, 83, :_reduce_51,
 1, 83, :_reduce_52,
 2, 69, :_reduce_53,
 1, 84, :_reduce_54,
 1, 84, :_reduce_none,
 3, 82, :_reduce_56,
 3, 82, :_reduce_57,
 3, 82, :_reduce_58,
 3, 82, :_reduce_59,
 3, 82, :_reduce_60,
 2, 82, :_reduce_61,
 3, 82, :_reduce_62,
 1, 82, :_reduce_63,
 1, 82, :_reduce_64,
 4, 82, :_reduce_65,
 2, 82, :_reduce_66,
 3, 72, :_reduce_67,
 3, 72, :_reduce_68,
 2, 87, :_reduce_69,
 1, 87, :_reduce_70,
 1, 87, :_reduce_71,
 1, 85, :_reduce_72,
 1, 85, :_reduce_73,
 1, 85, :_reduce_74,
 1, 85, :_reduce_75,
 1, 85, :_reduce_76,
 1, 85, :_reduce_77,
 1, 86, :_reduce_78,
 1, 86, :_reduce_79 ]

racc_reduce_n = 80

racc_shift_n = 147

racc_action_table = [
    43,    50,    43,    62,    43,     9,    43,   116,    43,    49,
    11,    87,    88,    44,    37,    44,    37,    44,    37,    44,
    37,    44,    37,    43,    45,    43,    45,    43,    45,    43,
    45,   141,    45,    55,    82,    62,    44,    37,    44,    37,
    44,    37,    44,    37,    42,    57,    42,    45,    42,    45,
    42,    45,    42,    45,   109,    12,    13,   110,    33,   141,
    79,    43,   143,    43,    61,    43,   119,    42,    43,    42,
    43,    42,    31,    42,    44,    37,    44,    37,    44,    37,
    54,    44,    37,    44,    37,    45,    43,    45,   140,    45,
    75,    76,    45,   139,    45,    67,    68,    69,    50,    44,
    37,   138,    43,    77,    43,    42,    56,    42,    43,    42,
    45,    43,    42,    81,    42,    44,    37,    44,    37,   111,
    43,    44,    37,    43,    44,    37,    45,    43,    45,    51,
    42,   102,    45,    44,    37,    45,    44,    37,    30,   106,
    44,    37,   107,    47,    45,    48,    42,    45,    42,    87,
    88,    45,    42,    75,    76,    42,    29,   103,   101,    67,
    68,    69,    70,    72,    42,    35,   142,    42,    36,    48,
    91,    42,    67,    68,    69,    70,    72,    67,    68,    69,
   114,    67,    68,    69,    70,    72,   125,     8,     6,     4,
   129,    25,     3,   108,   nil,   nil,   124,   126,   125,   127,
    92,    23,   129,    25,   nil,    19,   nil,   nil,   124,   126,
    25,   127,    19,    23,   nil,    18,    21,    25,    22,   nil,
    23,   nil,    18,    21,   125,    22,   nil,    23,   129,    25,
   nil,   nil,   nil,   nil,   124,   126,   125,   127,   nil,    23,
   129,    25,   nil,    19,   nil,     4,   124,   126,    25,   127,
    19,    23,   nil,    18,    21,    25,    22,   nil,    23,   nil,
    18,    21,   nil,    22,   nil,    23,    67,    68,    69,    70,
    72,    73,    74,    63,    64,    65,    66,    67,    68,    69,
    70,    72,    67,    68,    69,    70,    72,    67,    68,    69,
    70,    72,    67,    68,    69,    70,    72,    67,    68,    69,
    70,    72,    67,    68,    69,    70,    72 ]

racc_action_check = [
    70,    24,   141,    46,    69,     5,    68,   109,    67,    24,
     5,    54,    54,    70,    70,   141,   141,    69,    69,    68,
    68,    67,    67,    62,    70,    72,   141,    79,    69,   127,
    68,   137,    67,    33,    46,    38,    62,    62,    72,    72,
    79,    79,   127,   127,    70,    35,   141,    62,    69,    72,
    68,    79,    67,   127,    89,     7,     7,    89,    13,   134,
    42,    48,   137,    47,    38,   126,   117,    62,    21,    72,
    22,    79,    13,   127,    48,    48,    47,    47,   126,   126,
    29,    21,    21,    22,    22,    48,    91,    47,   134,   126,
    41,    41,    21,   133,    22,    97,    97,    97,    34,    91,
    91,   133,    43,    41,    25,    48,    34,    47,   102,   126,
    91,   107,    21,    44,    22,    43,    43,    25,    25,    90,
    71,   102,   102,    36,   107,   107,    43,    37,    25,    25,
    91,    78,   102,    71,    71,   107,    36,    36,    12,    84,
    37,    37,    84,    23,    71,    23,    43,    36,    25,   110,
   110,    37,   102,   136,   136,   107,    11,    78,    78,   105,
   105,   105,   105,   105,    71,    20,   136,    36,    20,    57,
    58,    37,    85,    85,    85,    85,    85,    99,    99,    99,
   105,    60,    60,    60,    60,    60,   139,     4,     3,     2,
   139,   139,     1,    85,   nil,   nil,   139,   139,   142,   139,
    60,   139,   142,   142,   nil,    50,   nil,   nil,   142,   142,
    50,   142,    19,   142,   nil,    50,    50,    19,    50,   nil,
    50,   nil,    19,    19,   125,    19,   nil,    19,   125,   125,
   nil,   nil,   nil,   nil,   125,   125,   118,   125,   nil,   125,
   118,   118,   nil,     9,   nil,   118,   118,   118,     9,   118,
    77,   118,   nil,     9,     9,    77,     9,   nil,     9,   nil,
    77,    77,   nil,    77,   nil,    77,    40,    40,    40,    40,
    40,    40,    40,    40,    40,    40,    40,    83,    83,    83,
    83,    83,   112,   112,   112,   112,   112,   115,   115,   115,
   115,   115,    59,    59,    59,    59,    59,    52,    52,    52,
    52,    52,    98,    98,    98,    98,    98 ]

racc_action_pointer = [
   nil,   192,   143,   188,   135,   -29,   nil,    29,   nil,   206,
   nil,   104,    86,    27,   nil,   nil,   nil,   nil,   nil,   175,
   139,    60,    62,   121,   -29,    96,   nil,   nil,   nil,    58,
   nil,   nil,   nil,     1,    68,    -7,   115,   119,    15,   nil,
   262,    75,    36,    94,    61,   nil,   -17,    55,    53,   nil,
   168,   nil,   293,   nil,   -24,   nil,   nil,   145,   144,   288,
   177,   nil,    15,   nil,   nil,   nil,   nil,     0,    -2,    -4,
    -8,   112,    17,   nil,   nil,   nil,   nil,   213,   114,    19,
   nil,   nil,   nil,   273,   116,   168,   nil,   nil,   nil,    31,
    67,    78,   nil,   nil,   nil,   nil,   nil,    91,   298,   173,
   nil,   nil,   100,   nil,   nil,   155,   nil,   103,   nil,   -33,
   114,   nil,   278,   nil,   nil,   283,   nil,    14,   199,   nil,
   nil,   nil,   nil,   nil,   nil,   187,    57,    21,   nil,   nil,
   nil,   nil,   nil,    63,    39,   nil,   138,    11,   nil,   149,
   nil,    -6,   161,   nil,   nil,   nil,   nil ]

racc_action_default = [
    -3,   -80,    -9,   -80,   -80,   -80,   147,   -80,    -5,   -80,
    -1,   -80,   -80,   -80,   -36,   -37,   -38,   -39,   -33,   -80,
   -80,   -80,   -80,   -46,   -80,   -80,   -32,   -35,   -34,   -80,
    -4,    -6,    -2,   -80,   -80,   -80,   -80,   -80,   -80,   -42,
   -80,   -80,   -64,   -80,   -80,   -63,   -80,   -80,   -80,   -30,
   -80,   -55,   -54,   -53,   -80,    -7,   -49,   -46,   -80,   -45,
   -80,   -40,   -80,   -76,   -77,   -75,   -74,   -80,   -80,   -80,
   -80,   -80,   -80,   -73,   -72,   -79,   -78,   -80,   -80,   -80,
   -61,   -66,   -48,   -52,   -80,   -80,   -31,   -13,   -12,   -80,
   -80,   -80,   -62,   -41,   -58,   -59,   -60,   -56,   -67,   -57,
   -43,   -71,   -80,   -70,   -68,   -80,   -50,   -80,   -47,   -80,
   -80,   -11,   -44,   -69,   -65,   -51,    -3,   -80,   -80,   -10,
   -17,   -18,   -19,   -20,   -14,   -80,   -80,   -80,    -8,   -21,
   -15,   -16,   -29,   -80,   -80,   -24,   -80,   -80,   -27,   -80,
   -22,   -80,   -80,   -26,   -28,   -23,   -25 ]

racc_goto_table = [
     2,    58,    90,    52,   113,    86,   122,     1,    24,   145,
   128,    89,   123,   122,    59,    60,   133,   132,    34,   123,
    32,    80,    38,    46,     7,    83,    85,   122,   136,   136,
   122,   144,   100,   123,   146,    10,   123,   134,   137,    93,
     5,    84,    53,   136,    71,    94,    95,    96,    97,    98,
    99,   104,   nil,   nil,   nil,   nil,   nil,   105,   117,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   112,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   131,   115,   nil,   nil,   nil,   nil,
   nil,   131,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   131,   nil,   nil,   131,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   118 ]

racc_goto_check = [
     2,    11,     9,    28,    18,    21,    14,     1,    20,    17,
     8,     7,    15,    14,    28,    28,    19,     8,    20,    15,
     6,    28,    25,    25,     5,    28,    28,    14,    18,    18,
    14,     8,    21,    15,     8,     4,    15,    16,    16,    26,
     3,    29,    30,    18,    31,    28,    28,    28,    28,    28,
    28,    33,   nil,   nil,   nil,   nil,   nil,    28,     9,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    28,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    11,    28,   nil,   nil,   nil,   nil,
   nil,    11,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    11,   nil,   nil,    11,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,     2 ]

racc_goto_pointer = [
   nil,     7,     0,    38,    30,    20,     7,   -43,  -108,   -52,
   nil,   -34,   nil,   nil,  -112,  -106,   -89,  -132,   -98,  -109,
    -1,   -45,   nil,   nil,   nil,     1,   -23,   nil,   -22,    -6,
    17,     4,   nil,   -27 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   130,    27,   120,   121,    16,    17,   nil,   135,    41,   nil,
   nil,    26,    28,    14,    15,   nil,    39,    20,    40,   nil,
   nil,   nil,    78,   nil ]

racc_token_table = {
 false => 0,
 Object.new => 1,
 :UMINUS => 2,
 :AUX => 3,
 :TkTimes => 4,
 :TkDiv => 5,
 :TkRes => 6,
 :TkPlus => 7,
 :TkMinus => 8,
 :TkGE => 9,
 :TkLE => 10,
 :TkLess => 11,
 :TkGreat => 12,
 :TkDif => 13,
 :TkSet => 14,
 :TkDisy => 15,
 :TkConj => 16,
 :TkNeg => 17,
 :VACIO1 => 18,
 :VACIO => 19,
 :TkPipe => 20,
 :TkLength => 21,
 :TkAP => 22,
 :TkCP => 23,
 :TkAC => 24,
 :TkCC => 25,
 :TkComa => 26,
 :TkPP => 27,
 :TkAsigD => 28,
 :TkAsigI => 29,
 :TkPC => 30,
 :TkArrayOf => 31,
 :TkNum => 32,
 :TkStr => 33,
 :TkMain => 34,
 :TkOut => 35,
 :TkIn => 36,
 :TkBegin => 37,
 :TkEnd => 38,
 :TkProc => 39,
 :TkAs => 40,
 :TkReturn => 41,
 :TkShow => 42,
 :TkTrue => 43,
 :TkFalse => 44,
 :TkValue => 45,
 :TkVar => 46,
 :TkSkip => 47,
 :TkIf => 48,
 :TkFi => 49,
 :TkDo => 50,
 :TkOd => 51,
 :TkId => 52,
 :UX => 53 }

racc_use_result_var = true

racc_nt_base = 54

Racc_arg = [
 racc_action_table,
 racc_action_check,
 racc_action_default,
 racc_action_pointer,
 racc_goto_table,
 racc_goto_check,
 racc_goto_default,
 racc_goto_pointer,
 racc_nt_base,
 racc_reduce_table,
 racc_token_table,
 racc_shift_n,
 racc_reduce_n,
 racc_use_result_var ]

Racc_token_to_s_table = [
'$end',
'error',
'UMINUS',
'AUX',
'TkTimes',
'TkDiv',
'TkRes',
'TkPlus',
'TkMinus',
'TkGE',
'TkLE',
'TkLess',
'TkGreat',
'TkDif',
'TkSet',
'TkDisy',
'TkConj',
'TkNeg',
'VACIO1',
'VACIO',
'TkPipe',
'TkLength',
'TkAP',
'TkCP',
'TkAC',
'TkCC',
'TkComa',
'TkPP',
'TkAsigD',
'TkAsigI',
'TkPC',
'TkArrayOf',
'TkNum',
'TkStr',
'TkMain',
'TkOut',
'TkIn',
'TkBegin',
'TkEnd',
'TkProc',
'TkAs',
'TkReturn',
'TkShow',
'TkTrue',
'TkFalse',
'TkValue',
'TkVar',
'TkSkip',
'TkIf',
'TkFi',
'TkDo',
'TkOd',
'TkId',
'UX',
'$start',
'inicio',
'dec',
'procedimiento',
'ppal',
'ID',
'tipo',
'z',
'instsp',
'modo',
'seleccionp',
'asignacion',
'repeticionp',
'bloquep',
'invocar',
'mostrar',
'yp',
'ifauxp',
'guardia',
'instruccionesp',
'instrucciones',
'insts',
'seleccion',
'repeticion',
'bloque',
'y',
'ifaux',
'x',
'exp',
'w',
'auxmostrar',
'operador',
'conector',
'booleano']

Racc_debug_parser = false

##### racc system variables end #####

 # reduce 0 omitted

module_eval <<'.,.,', 'Parser.y', 26
  def _reduce_1( val, _values, result )
 inicio = ASTTernario.new(val[0],val[1],val[2]); puts "dec procedimiento ppal"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 31
  def _reduce_2( val, _values, result )
 val[0].hijos.push(ASTDec.new(val[2],val[4]));
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 32
  def _reduce_3( val, _values, result )
 result = ASTD.new();
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 35
  def _reduce_4( val, _values, result )
 result.hijos.push(val[2]); puts "ID -> ID , TkId(#{ val[2].value.to_s }) \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 36
  def _reduce_5( val, _values, result )
 result = ASTID.new(); puts "ID -> TkId(#{ val[0].value.to_s })\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 39
  def _reduce_6( val, _values, result )
 result = "value"; puts "tipo -> value\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 40
  def _reduce_7( val, _values, result )
 result = val[1]
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 45
  def _reduce_8( val, _values, result )
 puts "procedimiento -> procedimiento proc TkId(#{val[3].value.to_s}) ( z ) as dec instsp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 46
  def _reduce_9( val, _values, result )
 puts "procedimiento -> lambda"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 49
  def _reduce_10( val, _values, result )
 puts "z -> z , modo TkId(#{ val[3].value.to_s }) \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 50
  def _reduce_11( val, _values, result )
 puts "z -> modo TkId(#{ val[1].value.to_s }) \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 53
  def _reduce_12( val, _values, result )
 puts "modo -> TkIn\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 54
  def _reduce_13( val, _values, result )
 puts "modo -> TkOut\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 57
  def _reduce_14( val, _values, result )
 puts "instsp -> skip\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 58
  def _reduce_15( val, _values, result )
 puts "instsp -> seleccionp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 59
  def _reduce_16( val, _values, result )
 puts "instsp -> asignacion\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 60
  def _reduce_17( val, _values, result )
 puts "instsp -> repeticionp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 61
  def _reduce_18( val, _values, result )
 puts "instsp -> bloquep\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 62
  def _reduce_19( val, _values, result )
 puts "instsp -> invocar\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 63
  def _reduce_20( val, _values, result )
 puts "instsp -> mostrar\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 64
  def _reduce_21( val, _values, result )
 puts "instsp -> TkReturn\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 67
  def _reduce_22( val, _values, result )
 puts "seleccionp -> if yp fi\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 69
  def _reduce_23( val, _values, result )
 puts "yp -> yp | aifauxp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 70
  def _reduce_24( val, _values, result )
 puts "yp -> ifauxp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 73
  def _reduce_25( val, _values, result )
 puts "ifauxp -> guardia <- instsp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 76
  def _reduce_26( val, _values, result )
 puts "repeticion -> do yp od \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 79
  def _reduce_27( val, _values, result )
 puts "bloquep -> begin instruccionesp end"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 82
  def _reduce_28( val, _values, result )
 puts "ppal -> instruccionesp ; instsp \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 83
  def _reduce_29( val, _values, result )
 puts "instruccionesp -> instsp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 88
  def _reduce_30( val, _values, result )
 puts "ppal -> main instrucciones end\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 91
  def _reduce_31( val, _values, result )
 puts "ppal -> instrucciones ; insts \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 92
  def _reduce_32( val, _values, result )
 puts "instrucciones -> insts\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 95
  def _reduce_33( val, _values, result )
 puts "insts -> skip\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 96
  def _reduce_34( val, _values, result )
 puts "insts -> seleccion\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 97
  def _reduce_35( val, _values, result )
 puts "insts -> asignacion\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 98
  def _reduce_36( val, _values, result )
 puts "insts -> repeticion\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 99
  def _reduce_37( val, _values, result )
 puts "insts -> bloque\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 100
  def _reduce_38( val, _values, result )
 puts "insts -> invocar\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 101
  def _reduce_39( val, _values, result )
 puts "insts -> mostrar\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 104
  def _reduce_40( val, _values, result )
 puts "seleccion -> if y fi\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 107
  def _reduce_41( val, _values, result )
 puts "y -> y | aifaux\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 108
  def _reduce_42( val, _values, result )
 puts "y -> ifaux\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 111
  def _reduce_43( val, _values, result )
 puts "ifaux -> guardia <- insts\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 115
  def _reduce_44( val, _values, result )
 puts "asignacion -> x asignacion , exp"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 116
  def _reduce_45( val, _values, result )
 puts "asignacion -> TkId(#{val[0].value.to_s }) <-  exp"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 119
  def _reduce_46( val, _values, result )
 puts "x -> TkId[#{ val[0].value.to_s }] ,\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 120
  def _reduce_47( val, _values, result )
 puts "x -> TkId[#{ val[0].value.to_s }] [exp] ,\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 123
  def _reduce_48( val, _values, result )
 puts "repeticion -> do y od \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 126
  def _reduce_49( val, _values, result )
 puts "bloque -> begin instrucciones end"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 129
  def _reduce_50( val, _values, result )
 puts "invocar -> TkId(#{ val[0].value.to_s }) ( w ) \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 132
  def _reduce_51( val, _values, result )
 puts " w -> w , exp \n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 133
  def _reduce_52( val, _values, result )
 puts "w -> exp"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 136
  def _reduce_53( val, _values, result )
 puts "mostrar -> show auxmostrar"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 140
  def _reduce_54( val, _values, result )
 puts "mostrar -> show exp"
   result
  end
.,.,

 # reduce 55 omitted

module_eval <<'.,.,', 'Parser.y', 144
  def _reduce_56( val, _values, result )
 result = ASTSuma.new(val[0], val[2]);      puts "El resultado es #{result.run('e','e')}"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 145
  def _reduce_57( val, _values, result )
 result = ASTResta.new(val[0], val[2]);     puts "exp -> exp - exp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 146
  def _reduce_58( val, _values, result )
 result = ASTMult.new(val[0], val[2]);      puts "exp -> exp * exp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 147
  def _reduce_59( val, _values, result )
 result = ASTDiv.new(val[0], val[2]);       puts "exp -> exp / exp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 148
  def _reduce_60( val, _values, result )
 result = ASTRes.new(val[0], val[2]);       puts "exp -> exp % exp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 149
  def _reduce_61( val, _values, result )
 result = ASTResUnario.new(val[1]);         puts "exp -> - exp\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 150
  def _reduce_62( val, _values, result )
 result = ASTUnario.new(val[1]);            puts "exp -> ( exp )\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 151
  def _reduce_63( val, _values, result )
 result = ASTUnario.new(val[0]);            puts "exp -> TkNum(#{val[0].value.to_s })\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 152
  def _reduce_64( val, _values, result )
 result = ASTUnario.new(val[0]);            puts "exp -> TkId(#{val[0].value.to_s})\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 153
  def _reduce_65( val, _values, result )
 result = ASTArray.new(val[0], val[2]);     puts "exp -> TkId(#{val[0].value.to_s})[exp]\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 154
  def _reduce_66( val, _values, result )
 result = ASTLength.new(val[1]);            puts "exp -> $ TkId(#{val[0].value.to_s})\n"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 157
  def _reduce_67( val, _values, result )
 puts "guardia -> exp operador exp"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 158
  def _reduce_68( val, _values, result )
 puts "guardia -> guardia conector booleano"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 161
  def _reduce_69( val, _values, result )
 puts "booleano -> ~ guardia"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 162
  def _reduce_70( val, _values, result )
 puts "booleano -> true"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 163
  def _reduce_71( val, _values, result )
 puts "booleano -> false"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 165
  def _reduce_72( val, _values, result )
 puts "operador -> <="
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 166
  def _reduce_73( val, _values, result )
 puts "operador -> >="
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 167
  def _reduce_74( val, _values, result )
 puts "operador -> ="
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 168
  def _reduce_75( val, _values, result )
 puts "operador -> !="
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 169
  def _reduce_76( val, _values, result )
 puts "operador -> <"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 170
  def _reduce_77( val, _values, result )
 puts "operador -> >"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 173
  def _reduce_78( val, _values, result )
 puts "conector -> &&"
   result
  end
.,.,

module_eval <<'.,.,', 'Parser.y', 174
  def _reduce_79( val, _values, result )
 puts "conector -> ||"
   result
  end
.,.,

 def _reduce_none( val, _values, result )
  result
 end

end   # class RubyCalcParser
