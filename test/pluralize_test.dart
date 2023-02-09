import 'package:flutter_test/flutter_test.dart';

import 'package:pluralize/pluralize.dart';

void main() {
  test('adds one to input values', () {
    final pluralize = Pluralize();

    assert(pluralize.isPlural('cats'));
    assert(!pluralize.isPlural('cat'));
    assert(pluralize.isPlural('dogs'));
    assert(!pluralize.isPlural('dog'));
    assert(pluralize.isSingular('dog'));

    assert(pluralize.plural('cat') == 'cats');
    assert(pluralize.plural('dog') == 'dogs');
    assert(pluralize.singular('bird') == 'bird');
  });
}
