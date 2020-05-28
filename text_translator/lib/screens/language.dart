import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  final Map<String, String> _languageToCode = {
    "Afrikaans" : "af" ,
    "Irish" : "ga" ,
    "Albanian" : "sq" ,
    "Italian" : "it" ,
    "Arabic" : "ar" ,
    "Japanese" : "ja" ,
    "Azerbaijani" : "az" ,
    "Kannada" : "kn" ,
    "Basque" : "eu" ,
    "Korean" : "ko" ,
    "Bengali" : "bn" ,
    "Latin" : "la" ,
    "Belarusian" : "be" ,
    "Latvian" : "lv" ,
    "Bulgarian" : "bg" ,
    "Lithuanian" : "lt" ,
    "Catalan" : "ca" ,
    "Macedonian" : "mk" ,
    "Chinese Simplified" : "zh-CN" ,
    "Malay" : "ms" ,
    "Chinese Traditional" : "zh-TW" ,
    "Maltese" : "mt" ,
    "Croatian" : "hr" ,
    "Norwegian" : "no" ,
    "Czech" : "cs" ,
    "Persian" : "fa" ,
    "Danish" : "da" ,
    "Polish" : "pl" ,
    "Dutch" : "nl" ,
    "Portuguese" : "pt" ,
    "English" : "en" ,
    "Romanian" : "ro" ,
    "Esperanto" : "eo" ,
    "Russian" : "ru" ,
    "Estonian" : "et" ,
    "Serbian" : "sr" ,
    "Filipino" : "tl" ,
    "Slovak" : "sk" ,
    "Finnish" : "fi" ,
    "Slovenian" : "sl" ,
    "French" : "fr" ,
    "Spanish" : "es" ,
    "Galician" : "gl" ,
    "Swahili" : "sw" ,
    "Georgian" : "ka" ,
    "Swedish" : "sv" ,
    "German" : "de" ,
    "Tamil" : "ta" ,
    "Greek" : "el" ,
    "Telugu" : "te" ,
    "Gujarati" : "gu" ,
    "Thai" : "th" ,
    "Haitian Creole" : "ht" ,
    "Turkish" : "tr" ,
    "Hebrew" : "iw" ,
    "Ukrainian" : "uk" ,
    "Hindi" : "hi" ,
    "Urdu" : "ur" ,
    "Hungarian" : "hu" ,
    "Vietnamese" : "vi" ,
    "Icelandic" : "is" ,
    "Welsh" : "cy" ,
    "Indonesian" : "id" ,
    "Yiddish" : "yi" ,
  };

  Map<String, String> _languageToCodeVisible;
  List<String> _keys;

  @override
  Widget build(BuildContext context) {
    _languageToCodeVisible = _languageToCode;
    _keys = _languageToCode.keys.toList();
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ListView.builder(
              itemCount: _keys.length,
              itemBuilder: (context, index){
                return Card(
                  elevation: 1,
                  child: Container(
                    padding: EdgeInsets.all(6.5),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pop(_keys[index]);
                      },
                      title: Row(
                        children: <Widget>[
                          Expanded(child: Text('${_keys[index]}', style: TextStyle(color: Colors.deepPurpleAccent),)),
                          Icon(Icons.navigate_next, color: Colors.blueGrey,)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),],
      ),),
    );
  }
}
