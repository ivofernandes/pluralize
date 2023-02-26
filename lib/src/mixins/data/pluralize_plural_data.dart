class PluralizePluralData {
  static Map<RegExp, String> pluralRulesData = {
    RegExp(r's?$', caseSensitive: false): 's',
    RegExp('[^\u0000-\u007F]\$', caseSensitive: false): r'$0',
    RegExp(r'([^aeiou]ese)$', caseSensitive: false): r'$0',
    RegExp(r'(ax|test)is$', caseSensitive: false): r'$0es',
    RegExp(r'(alias|[^aou]us|t[lm]as|gas|ris)$', caseSensitive: false): r'$0es',
    RegExp(r'(e[mn]u)s?$', caseSensitive: false): r'$0s',
    RegExp(r'([^l]ias|[aeiou]las|[ejzr]as|[iu]am)$', caseSensitive: false):
        r'$0',
    RegExp(
        r'(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$',
        caseSensitive: false): r'$0i',
    RegExp(r'(alumn|alg|vertebr)(?:a|ae)$', caseSensitive: false): r'$0ae',
    RegExp(r'(seraph|cherub)(?:im)?$', caseSensitive: false): r'$0im',
    RegExp(r'(her|at|gr)o$', caseSensitive: false): r'$0oes',
    RegExp(
        r'(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|automat|quor)(?:a|um)$',
        caseSensitive: false): r'$0a',
    RegExp(
        r'(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)(?:a|on)$',
        caseSensitive: false): r'$0a',
    RegExp(r'sis$', caseSensitive: false): 'ses',
    RegExp(r'((kni|wi|li)fe)$', caseSensitive: false): r'$0ves',
    RegExp(r'(ar|l|ea|eo|oa|hoo)f$', caseSensitive: false): r'$0ves',
    RegExp(r'([^aeiouy]|qu)y$', caseSensitive: false): r'$0ies',
    RegExp(r'([^ch][ieo][ln])ey$', caseSensitive: false): r'$0ies',
    RegExp(r'(x|ch|ss|sh|zz)$', caseSensitive: false): r'$0es',
    RegExp(r'(matr|cod|mur|sil|vert|ind|append)(?:ix|ex)$',
        caseSensitive: false): r'$0ices',
    RegExp(r'\b((?:tit)?m|l)(?:ice|ouse)$', caseSensitive: false): r'$0ice',
    RegExp(r'(child)(?:ren)?$', caseSensitive: false): r'$0ren',
    RegExp(r'eaux$', caseSensitive: false): r'$0',
    RegExp(r'm[ae]n$', caseSensitive: false): 'men',
    RegExp(r'^thou$'): 'you'
  };
}
