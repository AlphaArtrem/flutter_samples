import 'package:flutter/material.dart';
import 'package:texttranslator/screens/home.dart';
import 'package:texttranslator/screens/language.dart';

void main() => runApp(Translator());

class Translator extends StatefulWidget {
  @override
  _TranslatorState createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Translator App",
      home: Home(),
      routes: {
        '/chooseLanguage' : (context) => ChooseLanguage(),
      },
    );
  }
}
