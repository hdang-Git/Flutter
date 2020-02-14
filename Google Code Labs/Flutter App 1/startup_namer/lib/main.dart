import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'RandomWords.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
//      title: 'Welcome to Flutter',
//      home: Scaffold(
//        appBar: AppBar(
//          title: const Text('Welcome to Flutter'),
//        ),
//        body: Center(
//            child: RandomWords(),
////          child: const Text('Hello World'),
////          child: Text(wordPair.asPascalCase),
//        ),
//      ),
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}