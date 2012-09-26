" Vala {{{3
 let type_vala = {}
 let type_vala.ctagstype = 'vala'
 let type_vala.kinds = [
 \ {'short' : 'c', 'long' : 'classes', 'fold' : 0},
 \ {'short' : 'd', 'long' : 'delegates', 'fold' : 0},
 \ {'short' : 'e', 'long' : 'enumerations', 'fold' : 0},
 \ {'short' : 'E', 'long' : 'error domains', 'fold' : 0},
 \ {'short' : 'f', 'long' : 'fields', 'fold' : 0},
 \ {'short' : 'i', 'long' : 'interfaces', 'fold' : 0},
 \ {'short' : 'm', 'long' : 'methods', 'fold' : 0},
 \ {'short' : 'p', 'long' : 'properties', 'fold' : 0},
 \ {'short' : 'r', 'long' : 'error codes', 'fold' : 0},
 \ {'short' : 's', 'long' : 'structures', 'fold' : 0},
 \ {'short' : 'S', 'long' : 'signals', 'fold' : 0},
 \ {'short' : 'v', 'long' : 'enumeration values', 'fold' : 0}
 \ ]
 let type_vala.sro = '.'
 let type_vala.kind2scope = {
 \ 'i' : 'interface',
 \ 'c' : 'class',
 \ 's' : 'structure',
 \ 'e' : 'enum'
 \ }
 let type_vala.scope2kind = {
 \ 'interface' : 'i',
 \ 'class' : 'c',
 \ 'struct' : 's',
 \ 'enum' : 'e'
 \ }
 let s:known_types.vala = type_vala
