mixin PluralizeUtils {

  /// Pass in a word token to produce a function that can replicate the case on
  /// another word.
  static String restoreCase(String word, String token) {
    if (word == token) {
      return token;
    }

    if (word == word.toLowerCase()) {
      return token.toLowerCase();
    }

    if (word == word.toUpperCase()) {
      return token.toUpperCase();
    }

    if (word[0] == word[0].toUpperCase()) {
      return '${token[0].toUpperCase()}${token.substring(1).toLowerCase()}';
    }

    return token.toLowerCase();
  }

  /// Interpolate a regexp string.
  static String interpolate(String str, List<String> args) {
    final RegExp exp = RegExp(r'\$(\d{1,2})');
    return str.replaceAllMapped(exp, (match) {
      final matchedText = match.group(1);
      final int index = int.parse(matchedText!);
      return args.length > index ? args[index] : '';
    });
  }

  // Replace a word using a rule.
  static String replace(String word, List<dynamic> rule) {

    final regex = rule[0] as RegExp;
    //print('regex: $regex');

    // Use the first element of the rule as a RegExp to match in the word.
    // The second element of the rule is used as a string to replace the match.
    return word.replaceFirstMapped(regex, (match) {
      // Interpolate the replacement string using arguments from the match.

      final groups = match.groups([match.groupCount]);

      final args = groups.map((e) => e!).toList();
      final group = match.group(0);
      final String result = interpolate(rule[1] as String, args);

      // If the match is an empty string, use the previous character of the word.
      if (group!.isEmpty) {
        return restoreCase(word[match.start - 1], result);
      }
      // Otherwise, use the match as the source to restore the case.
      return restoreCase(match.group(0)!, result);
    });
  }

}
