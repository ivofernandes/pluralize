import 'package:pluralize/src/mixins/data/pluralize_irregular_data.dart';
import 'package:pluralize/src/mixins/data/pluralize_plural_data.dart';
import 'package:pluralize/src/mixins/data/pluralize_singular_data.dart';
import 'package:pluralize/src/mixins/data/pluralize_uncountable_data.dart';
import 'package:pluralize/src/mixins/pluralize_utils.dart';

class Pluralize {
  static final Pluralize _instance = Pluralize._internal();
  factory Pluralize() => _instance;
  Pluralize._internal(){
    init();
  }

  final _pluralRules = <List<dynamic>>[];
  final _singularRules = <List<dynamic>>[];
  final _uncountables = {};
  final _irregularPlurals = <String, String>{};
  final _irregularSingles = <String, String>{};


  /// Sanitize a word by passing in the word and sanitization rules.
  String sanitizeWord(String token, String word, List<List<dynamic>> rules) {
    // Empty string or doesn't need fixing.
    if (token.isEmpty || _uncountables.containsKey(token)) {
      return word;
    }

    var len = rules.length;

    // Iterate over the sanitization rules and use the first one to match.
    while (len-- > 0) {
      final rule = rules[len];

      final regexp = rule[0] as RegExp;
      if (regexp.hasMatch(word)) {
        return PluralizeUtils.replace(word, rule);
      }
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
    final token = word.toLowerCase();

    // Check against the keep object map.
    if (keepMap.containsKey(token)) {
      return PluralizeUtils.restoreCase(word, token);
    }

    // Check against the replacement map for a direct word replacement.
    if (replaceMap.containsKey(token)) {
      return PluralizeUtils.restoreCase(word, replaceMap[token]!);
    }

    // Run all the rules against the word.
    return sanitizeWord(token, word, rules);

  }

  /// Check if a word is part of the map.
  bool checkWord(
      Map<String, String> replaceMap,
      Map<String, String> keepMap,
      List<List<dynamic>> rules,
      String word,
      ) {

    final token = word.toLowerCase();

    if (keepMap.containsKey(token)) {
      return true;
    }
    if (replaceMap.containsKey(token)) {
      return false;
    }

    return sanitizeWord(token, token, rules) == token;
  }

  /// Pluralize or singularize a word based on the passed in count.
  String pluralize(String word, int count, bool inclusive) {
    String pluralized = count == 1
        ? singular(word) : plural(word);

    return (inclusive ? '$count ' : '') + pluralized;
  }

  /// Pluralize a word.
  String plural(String word)=> replaceWord(_irregularSingles, _irregularPlurals, _pluralRules, word);


  /// Check if a word is plural.
  bool isPlural(String word)=> checkWord(_irregularSingles, _irregularPlurals, _pluralRules, word);

  ///Singularize a word.
  String singular(String word) => replaceWord(_irregularPlurals, _irregularSingles, _singularRules, word);

  ///Check if a word is singular.
  bool isSingular(String word) => checkWord(_irregularPlurals, _irregularSingles, _singularRules, word);

  /// Add a pluralization rule to the collection.
  void addPluralRule(dynamic rule, String replacement) {
    _pluralRules.add([rule, replacement]);
  }

  /// Add a singularization rule to the collection.
  void addSingularRule(dynamic rule, String replacement) {
    _singularRules.add([rule, replacement]);
  }

  ///Add an irregular word definition.
  void addIrregularRule(String singleParam, String pluralParam) {
    final plural = pluralParam.toLowerCase();
    final single = singleParam.toLowerCase();

    _irregularSingles[single] = plural;
    _irregularPlurals[plural] = single;
  }

  /// Add an uncountable word rule.
  void addUncountableRule(dynamic word) {
    if (word is String) {
      _uncountables[word.toLowerCase()] = true;
      return;
    }

    // Set singular and plural references for the word.
    addPluralRule(word, r'$0');
    addSingularRule(word, r'$0');
  }

  /// Initialize the collection of pluralization and singularization rules.
  void init() {
    initIrregularRules();
    initPluralRules();
    initSingularRules();
    initUncountableRules();
  }

  void initIrregularRules() {
    for (final rule in PluralizeIrregularData.irregularRulesData) {
      addIrregularRule(rule[0], rule[1]);
    }
  }

  void initPluralRules() {
    for(final regex in PluralizePluralData.pluralRulesData.keys) {
      addPluralRule(regex, PluralizePluralData.pluralRulesData[regex]!);
    }
  }

  void initSingularRules() {
    for (final rule in PluralizeSingularData.singularRulesData.keys) {
      final String replacement = PluralizeSingularData.singularRulesData[rule]!;
      addSingularRule(rule, replacement);
    }
  }

  void initUncountableRules() {
    for(final rule in PluralizeUncountableData.uncountableRulesData) {
      addUncountableRule(rule);
    }
  }
}
