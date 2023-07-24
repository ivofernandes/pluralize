// ignore_for_file: avoid_print

import 'package:pluralize/pluralize.dart';
import 'package:test/test.dart';

void main() {
  test('Checks', () {
    assert(Pluralize().isPlural('cats'));
    assert(!Pluralize().isPlural('cat'));
    assert(Pluralize().isPlural('dogs'));
    assert(!Pluralize().isPlural('dog'));
    assert(Pluralize().isSingular('dog'));
  });

  test('Plurals', () {
    final Map<String, String> plurals = {
      'cat': 'cats',
      'dog': 'dogs',
      'bird': 'birds',
    };

    for (final String singular in plurals.keys) {
      final generatedPlural = Pluralize().plural(singular);
      print(
          'singular: $singular plural expected: ${plurals[singular]} vs $generatedPlural generated');
      assert(generatedPlural == plurals[singular]);
    }
  });

  test('Singular', () {
    assert(Pluralize().singular('cats') == 'cat');
    assert(Pluralize().singular('dogs') == 'dog');
    assert(Pluralize().singular('birds') == 'bird');
  });
}
