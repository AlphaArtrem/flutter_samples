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
  void initState(){
    super.initState();
    _languageToCodeVisible = _languageToCode;
    _keys = _languageToCode.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Color.fromRGBO(0, 0, 205, 0.3),
                  blurRadius: 10,
                  offset: Offset(0, 10),
                )],
              ),
              child: Container(
                padding: EdgeInsets.all(6.5),
                child: Row(
                  children: <Widget>[
                    BackButton(color: Colors.grey[700],),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled : true,
                          border: InputBorder.none,
                          hintText: "Search By Language",
                        ),
                        onChanged: (val){
                          setState(() {
                            _languageToCodeVisible = Map.from(_languageToCode)..removeWhere((key, value) => !key.toLowerCase().startsWith(val.toLowerCase()));
                            _keys = _languageToCodeVisible.keys.toList();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                        Navigator.pop(context, _keys[index]);
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
