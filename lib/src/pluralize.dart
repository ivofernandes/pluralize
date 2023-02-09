import 'package:pluralize/src/mixins/pluralize_utils.dart';

class Pluralize with PluralizeUtils {
  static final Pluralize _instance = Pluralize._internal();
  factory Pluralize() {
    return _instance;
  }
  Pluralize._internal(){
    init();
  }

  var pluralRules = <List<dynamic>>[];
  var singularRules = <List<dynamic>>[];
  var uncountables = {};
  var irregularPlurals = <String, String>{};
  var irregularSingles = <String, String>{};


  /// Sanitize a word by passing in the word and sanitization rules.
  String sanitizeWord(String token, String word, List<List<dynamic>> rules) {
    // Empty string or doesn't need fixing.
    if (token.isEmpty || uncountables.containsKey(token)) {
      return word;
    }

    var len = rules.length;

    // Iterate over the sanitization rules and use the first one to match.
    while (len-- > 0) {
      var rule = rules[len];

      if (rule[0].hasMatch(word)) return replace(word, rule);
    }

    return word;
  }


  /// Replace a word with the updated word.
  ///
  /// [replaceMap]  map of words to be replaced
  /// [keepMap]     map of words to keep intact
  /// [rules]       List of rules to use for sanitization
  ///
  /// Returns a function that accepts a word and returns the updated word
  String replaceWord(
      Map<String, String> replaceMap,
      Map<String, String> keepMap,
      List<List<dynamic>> rules,
      String word
      ) {
    // Get the correct token and case restoration functions.
    var token = word.toLowerCase();

    // Check against the keep object map.
    if (keepMap.containsKey(token)) {
      return restoreCase(word, token);
    }

    // Check against the replacement map for a direct word replacement.
    if (replaceMap.containsKey(token)) {
      return restoreCase(word, replaceMap[token]!);
    }

    // Run all the rules against the word.
    return sanitizeWord(token, word, rules);

  }

  // Check if a word is part of the map.
  bool checkWord(
      Map<String, String> replaceMap,
      Map<String, String> keepMap,
      List<List<dynamic>> rules,
      String word,
      ) {

    var token = word.toLowerCase();

    if (keepMap.containsKey(token)) return true;
    if (replaceMap.containsKey(token)) return false;

    return sanitizeWord(token, token, rules) == token;
  }

  /// Pluralize or singularize a word based on the passed in count.
  String pluralize(String word, int count, bool inclusive) {
    String pluralized = count == 1
        ? singular(word) : plural(word);

    return (inclusive ? '$count ' : '') + pluralized;
  }

  /// Pluralize a word.
  String plural(word){
    return replaceWord(irregularSingles, irregularPlurals, pluralRules, word);
  }


  /// Check if a word is plural.
  bool isPlural(word){
    return checkWord(irregularSingles, irregularPlurals, pluralRules, word);
  }

  ///Singularize a word.
  String singular(String word) {
    return replaceWord(irregularPlurals, irregularSingles, singularRules, word);
  }

  ///Check if a word is singular.
  bool isSingular(String word) {
    return checkWord(irregularPlurals, irregularSingles, singularRules, word);
  }

  /// Add a pluralization rule to the collection.
  void addPluralRule(dynamic rule, String replacement) {
    pluralRules.add([rule, replacement]);
  }

  /// Add a singularization rule to the collection.
  void addSingularRule(dynamic rule, String replacement) {
    singularRules.add([rule, replacement]);
  }

  ///Add an irregular word definition.
  void addIrregularRule(String single, String plural) {
    plural = plural.toLowerCase();
    single = single.toLowerCase();

    irregularSingles[single] = plural;
    irregularPlurals[plural] = single;
  }

  /// Add an uncountable word rule.
  void addUncountableRule(dynamic word) {
    if (word is String) {
      uncountables[word.toLowerCase()] = true;
      return;
    }

    // Set singular and plural references for the word.
    addPluralRule(word, '\$0');
    addSingularRule(word, '\$0');
  }

  void init() {
    initIrregularRules();
    initPluralRules();
    initSingularRules();
  }

  void initIrregularRules() {

    /// Irregular rules.
    [
      // Pronouns.
      ['I', 'we'],
      ['me', 'us'],
      ['he', 'they'],
      ['she', 'they'],
      ['them', 'them'],
      ['myself', 'ourselves'],
      ['yourself', 'yourselves'],
      ['itself', 'themselves'],
      ['herself', 'themselves'],
      ['himself', 'themselves'],
      ['themself', 'themselves'],
      ['is', 'are'],
      ['was', 'were'],
      ['has', 'have'],
      ['this', 'these'],
      ['that', 'those'],
      // Words ending in with a consonant and `o`.
      ['echo', 'echoes'],
      ['dingo', 'dingoes'],
      ['volcano', 'volcanoes'],
      ['tornado', 'tornadoes'],
      ['torpedo', 'torpedoes'],
      // Ends with `us`.
      ['genus', 'genera'],
      ['viscus', 'viscera'],
      // Ends with `ma`.
      ['stigma', 'stigmata'],
      ['stoma', 'stomata'],
      ['dogma', 'dogmata'],
      ['lemma', 'lemmata'],
      ['schema', 'schemata'],
      ['anathema', 'anathemata'],
      // Other irregular rules.
      ['ox', 'oxen'],
      ['axe', 'axes'],
      ['die', 'dice'],
      ['yes', 'yeses'],
      ['foot', 'feet'],
      ['eave', 'eaves'],
      ['goose', 'geese'],
      ['tooth', 'teeth'],
      ['quiz', 'quizzes'],
      ['human', 'humans'],
      ['proof', 'proofs'],
      ['carve', 'carves'],
      ['valve', 'valves'],
      ['looey', 'looies'],
      ['thief', 'thieves'],
      ['groove', 'grooves'],
      ['pickaxe', 'pickaxes'],
      ['passerby', 'passersby']
    ].forEach((List rule) {
      addIrregularRule(rule[0], rule[1]);
    });
  }

  void initPluralRules() {
    Map<RegExp, String> rules = {
      RegExp(r's?$', caseSensitive: false): 's',
      RegExp('[\^\u0000-\u007F]\$', caseSensitive: false): '\$0',
      RegExp(r'([^aeiou]ese)$', caseSensitive: false): '\$1',
      RegExp(r'(ax|test)is$', caseSensitive: false): '\$1es',
      RegExp(r'(alias|[^aou]us|t[lm]as|gas|ris)$', caseSensitive: false): '\$1es',
      RegExp(r'(e[mn]u)s?$', caseSensitive: false): '\$1s',
      RegExp(r'([^l]ias|[aeiou]las|[ejzr]as|[iu]am)$', caseSensitive: false): '\$1',
      RegExp(r'(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$', caseSensitive: false): '\$1i',
      RegExp(r'(alumn|alg|vertebr)(?:a|ae)$', caseSensitive: false): '\$1ae',
      RegExp(r'(seraph|cherub)(?:im)?$', caseSensitive: false): '\$1im',
      RegExp(r'(her|at|gr)o$', caseSensitive: false): '\$1oes',
      RegExp(r'(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|automat|quor)(?:a|um)$', caseSensitive: false): '\$1a',
      RegExp(r'(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)(?:a|on)$', caseSensitive: false): '\$1a',
      RegExp(r'sis$', caseSensitive: false): 'ses',
      RegExp(r'(?:(kni|wi|li)fe|(ar|l|ea|eo|oa|hoo)f)$', caseSensitive: false): '\$1\$2ves',
      RegExp(r'([^aeiouy]|qu)y$', caseSensitive: false): '\$1ies',
      RegExp(r'([^ch][ieo][ln])ey$', caseSensitive: false): '\$1ies',
      RegExp(r'(x|ch|ss|sh|zz)$', caseSensitive: false): '\$1es',
      RegExp(r'(matr|cod|mur|sil|vert|ind|append)(?:ix|ex)$', caseSensitive: false): '\$1ices',
      RegExp(r'\b((?:tit)?m|l)(?:ice|ouse)$', caseSensitive: false): '\$1ice',
      RegExp(r'(pe)(?:rson|ople)$', caseSensitive: false): '\$1ople',
      RegExp(r'(child)(?:ren)?$', caseSensitive: false): '\$1ren',
      RegExp(r'eaux$', caseSensitive: false): '\$0',
      RegExp(r'm[ae]n$', caseSensitive: false): 'men',
      RegExp('thou'): 'you'
    };

    for(final regex in rules.keys) {
      addPluralRule(regex, rules[regex]!);
    }
  }

  void initSingularRules() {
    List<List<String>> rules = [
      ["/s\$/i", ""],
      ["/(ss)\$/i", '\$1'],
      ["/(wi|kni|(?:after|half|high|low|mid|non|night|[^\w]|^)li)ves\$/i", '\$1fe'],
      ["/(ar|(?:wo|[ae])l|[eo][ao])ves\$/i", '\$1f'],
      ["/ies\$/i", 'y'],
      ["/\b([pl]|zomb|(?:neck|cross)?t|coll|faer|food|gen|goon|group|lass|talk|goal|cut)ies\$/i", '\$1ie'],
      ["/\b(mon|smil)ies\$/i", '\$1ey'],
      ["/\b((?:tit)?m|l)ice\$/i", '\$1ouse'],
      ["/(seraph|cherub)im\$/i", '\$1'],
      ["/(x|ch|ss|sh|zz|tto|go|cho|alias|[^aou]us|t[lm]as|gas|(?:her|at|gr)o|[aeiou]ris)(?:es)?\$/i", '\$1'],
      ["/(analy|diagno|parenthe|progno|synop|the|empha|cri|ne)(?:sis|ses)\$/i", '\$1sis'],
      ["/(movie|twelve|abuse|e[mn]u)s\$/i", '\$1'],
      ["/(test)(?:is|es)\$/i", '\$1is'],
      ["/(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)\$/i", '\$1us'],
      ["/(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|quor)a\$/i", '\$1um'],
      ["/(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)a\$/i", '\$1on'],
      ["/(alumn|alg|vertebr)ae\$/i", '\$1a'],
      ["/(cod|mur|sil|vert|ind)ices\$/i", '\$1ex'],
      ["/(matr|append)ices\$/i", '\$1ix'],
      ["/(pe)(rson|ople)\$/i", '\$1rson'],
      ["/(child)ren\$/i", '\$1'],
      ["/(eau)x?\$/i", '\$1'],
      ["/men\$/i", 'man']
    ];

    rules.forEach((rule) => addSingularRule(RegExp(rule[0]), rule[1]));
  }



}
