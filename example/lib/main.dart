import 'package:flutter/material.dart';
import 'package:pluralize/pluralize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  String _feedback = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final word = _controller.text;

    _feedback = Pluralize().isPlural(word)
      ? 'The word $word is plural'
      : 'The word $word is singular';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pluralize'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter a word',
                ),
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                  });
                }
              ),
              const SizedBox(height: 20),
              Text(_feedback),
              const SizedBox(height: 20),
              Text('The plural of $word is ${Pluralize().plural(word)}'),
              const SizedBox(height: 20),
              Text('The singular of $word is ${Pluralize().singular(word)}'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
