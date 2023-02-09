Pluralize and singularize any word.

## Getting Started
![Zoom_demo](https://github.com/ivofernandes/pluralize/blob/main/doc/screenshot.png?raw=true)

## Usage
We have singular and plural methods that convert text
And isSingular and isPlural to check if a word is singular or plural.

```dart

    final pluralize = Pluralize();

    assert(pluralize.isPlural('cats'));
    assert(!pluralize.isPlural('cat'));
    assert(pluralize.isPlural('dogs'));
    assert(!pluralize.isPlural('dog'));
    assert(pluralize.isSingular('dog'));

    assert(pluralize.plural('cat') == 'cats');
    assert(pluralize.plural('dog') == 'dogs');
    assert(pluralize.singular('bird') == 'bird');
```