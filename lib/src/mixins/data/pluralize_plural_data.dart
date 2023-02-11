class PluralizePluralData{
  static Map<RegExp, String> pluralRulesData = {
    RegExp(r's?$', caseSensitive: false): 's',
    RegExp('[^\u0000-\u007F]\$', caseSensitive: false): r'$0',
    RegExp(r'([^aeiou]ese)$', caseSensitive: false): r'$1',
    RegExp(r'(ax|test)is$', caseSensitive: false): r'$1es',
    RegExp(r'(alias|[^aou]us|t[lm]as|gas|ris)$', caseSensitive: false): r'$1es',
    RegExp(r'(e[mn]u)s?$', caseSensitive: false): r'$1s',
    RegExp(r'([^l]ias|[aeiou]las|[ejzr]as|[iu]am)$', caseSensitive: false): r'$1',
    RegExp(r'(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$', caseSensitive: false): r'$1i',
    RegExp(r'(alumn|alg|vertebr)(?:a|ae)$', caseSensitive: false): r'$1ae',
    RegExp(r'(seraph|cherub)(?:im)?$', caseSensitive: false): r'$1im',
    RegExp(r'(her|at|gr)o$', caseSensitive: false): r'$1oes',
    RegExp(r'(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|automat|quor)(?:a|um)$', caseSensitive: false): r'$1a',
    RegExp(r'(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)(?:a|on)$', caseSensitive: false): r'$1a',
    RegExp(r'sis$', caseSensitive: false): 'ses',
    RegExp(r'(?:(kni|wi|li)fe|(ar|l|ea|eo|oa|hoo)f)$', caseSensitive: false): r'$1$2ves',
    RegExp(r'([^aeiouy]|qu)y$', caseSensitive: false): r'$1ies',
    RegExp(r'([^ch][ieo][ln])ey$', caseSensitive: false): r'$1ies',
    RegExp(r'(x|ch|ss|sh|zz)$', caseSensitive: false): r'$1es',
    RegExp(r'(matr|cod|mur|sil|vert|ind|append)(?:ix|ex)$', caseSensitive: false): r'$1ices',
    RegExp(r'\b((?:tit)?m|l)(?:ice|ouse)$', caseSensitive: false): r'$1ice',
    RegExp(r'(pe)(?:rson|ople)$', caseSensitive: false): r'$1ople',
    RegExp(r'(child)(?:ren)?$', caseSensitive: false): r'$1ren',
    RegExp(r'eaux$', caseSensitive: false): r'$0',
    RegExp(r'm[ae]n$', caseSensitive: false): 'men',
    RegExp('thou'): 'you'
  };
}
