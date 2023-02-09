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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pluralize'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  _feedback = Pluralize().isPlural(_controller.text)
                      ? 'The word is plural'
                      : 'The word is singular';
                });
              },
              child: const Text('Check'),
            ),
            Text(_feedback),
          ],
        ),
      ),
    );
  }
}
