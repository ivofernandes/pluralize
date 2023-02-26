class PluralizeSingularData {
  static Map<RegExp, String> singularRulesData = {
    RegExp(r's$', caseSensitive: false): '',
    RegExp(r'(ss)$', caseSensitive: false): r'$0',
    RegExp(r'(wi|kni|(?:after|half|high|low|mid|non|night|[^\w]|^)li)ves$',
        caseSensitive: false): r'$0fe',
    RegExp(r'(ar|(?:wo|[ae])l|[eo][ao])ves$', caseSensitive: false): r'$0f',
    RegExp(r'ies$', caseSensitive: false): 'y',
    RegExp(
        r'\b([pl]|zomb|(?:neck|cross)?t|coll|faer|food|gen|goon|group|lass|talk|goal|cut)ies$',
        caseSensitive: false): r'$0ie',
    RegExp(r'\b(mon|smil)ies$', caseSensitive: false): r'$0ey',
    RegExp(r'\b((?:tit)?m|l)ice$', caseSensitive: false): r'$0ouse',
    RegExp(r'(seraph|cherub)im$', caseSensitive: false): r'$0',
    RegExp(
        r'(x|ch|ss|sh|zz|tto|go|cho|alias|[^aou]us|t[lm]as|gas|(?:her|at|gr)o|[aeiou]ris)(?:es)?$',
        caseSensitive: false): r'$0',
    RegExp(r'(analy|diagno|parenthe|progno|synop|the|empha|cri|ne)(?:sis|ses)$',
        caseSensitive: false): r'$0sis',
    RegExp(r'(movie|twelve|abuse|e[mn]u)s$', caseSensitive: false): r'$0',
    RegExp(r'(test)(?:is|es)$', caseSensitive: false): r'$0is',
    RegExp(
        r'(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$',
        caseSensitive: false): r'$0us',
    RegExp(
        r'(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|quor)a$',
        caseSensitive: false): r'$0um',
    RegExp(
        r'(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)a$',
        caseSensitive: false): r'$0on',
    RegExp(r'(alumn|alg|vertebr)ae$', caseSensitive: false): r'$0a',
    RegExp(r'(cod|mur|sil|vert|ind)ices$', caseSensitive: false): r'$0ex',
    RegExp(r'(matr|append)ices$', caseSensitive: false): r'$0ix',
    RegExp(r'(pe)(rson|ople)$', caseSensitive: false): r'$0rson',
    RegExp(r'(child)ren$', caseSensitive: false): r'$0',
    RegExp(r'(eau)x?$', caseSensitive: false): r'$0',
    RegExp(r'men$', caseSensitive: false): 'man',
  };
}
