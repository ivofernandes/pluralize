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
    assert(Pluralize().plural('cat') == 'cats');
    assert(Pluralize().plural('dog') == 'dogs');
    assert(Pluralize().plural('bird') == 'birds');
  });

  test('Singular', () {
    assert(Pluralize().singular('cats') == 'cat');
    assert(Pluralize().singular('dogs') == 'dog');
    assert(Pluralize().singular('birds') == 'bird');
  });
}
