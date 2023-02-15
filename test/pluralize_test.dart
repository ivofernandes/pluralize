import 'package:flutter_test/flutter_test.dart';

import 'package:pluralize/pluralize.dart';

void main() {
  test('Checks', () {
    assert(Pluralize().isPlural('cats'));
    assert(!Pluralize().isPlural('cat'));
    assert(Pluralize().isPlural('dogs'));
    assert(!Pluralize().isPlural('dog'));
    assert(Pluralize().isSingular('dog'));
  });

  test('Plurals', () {
    final Map<String,String> plurals = {
      'cat': 'cats',
      'dog': 'dogs',
      'bird': 'birds',
    };

    for(String singular in plurals.keys) {
      final generatedPlural = Pluralize().plural(singular);
      print('singular: $singular plural expected: ${plurals[singular]} vs $generatedPlural generated');
      assert(generatedPlural == plurals[singular]);
    }
  });

  test('Singular', () {
    assert(Pluralize().singular('cats') == 'cat');
    assert(Pluralize().singular('dogs') == 'dog');
    assert(Pluralize().singular('birds') == 'bird');
  });
}
