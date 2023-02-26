Pluralize and singularize any word.

This package is an adaptation of this pluralize npm package for dart.
https://www.npmjs.com/package/pluralize

## Process of creating the package
If you are interested in creating flutter packages,
I have documented the process of creating this package in this videos:

https://youtu.be/pVZCmgdxin8

https://youtu.be/Bgsn4zodmko

## Features

- Pluralize and singularize any word.
- Check if a word is singular or plural.
- Works with irregular words.
- Works with uncountable words.
![Pluralize demo](https://raw.githubusercontent.com/ivofernandes/pluralize/main/doc/screenshot.png)



## Getting Started
Add the dependency to your `pubspec.yaml` file.

```
pluralize: ^0.0.7
```

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

## Contributing
If you want to contribute to this project your PRs are welcome.

The tests are not covering all the possible cases, so if you want to add more tests, please do so.
https://github.com/ivofernandes/pluralize/blob/main/test/pluralize_test.dart

I'm also quite sure that is not supporting all the irregular and uncountable words.
So free feel to help this package to improve.

## License
MIT License