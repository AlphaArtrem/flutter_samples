import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController _controllerInput = TextEditingController();
  final TextEditingController _controllerOutput = TextEditingController();
  final _translator = GoogleTranslator();

  MediaQueryData _deviceData;
  Map<String, String> _from = {'language': 'English', 'code' : 'en'} , _to = {'language': 'French', 'code' : 'fr'};

  @override
  Widget build(BuildContext context) {
    _deviceData = MediaQuery.of(context);
    return Scaffold(
      key: _scaffoldKey,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Text Translator', style: TextStyle(fontSize: 20, color: Colors.white),),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 65.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 0.75,
                  color: Colors.grey,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      dynamic result = await Navigator.pushNamed(context, '/chooseLanguage');
                      if(result != null){
                        if(result['code'] == _to['code']){
                          final snackBar = SnackBar(content: Text('Input And Output languages Can\'t Be Same'));
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        }
                        else{
                          setState(() {
                            _from = result;
                          });
                        }
                      }
                    },
                    child: Center(
                      child: Text(_from['language'].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
                    ),
                  ),
                ),
                Icon(Icons.compare_arrows, color: Colors.purpleAccent,),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      dynamic result = await Navigator.pushNamed(context, '/chooseLanguage');
                      if(result != null){
                        if(result['code'] == _from['code']){
                          final snackBar = SnackBar(content: Text('Input And Output languages Can\'t Be Same'));
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        }
                        else{
                          setState(() {
                            _to = result;
                          });
                        }
                      }
                    },
                    child: Center(
                      child: Text(_to['language'].toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [BoxShadow(
                        color: Color.fromRGBO(0, 0, 205, 0.3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )],
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _controllerInput,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled : true,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                              onChanged: (val) async {
                                if(val != ""){
                                  _translator.translate(val, from: _from['code'].toString(), to: _to['code'].toString()).then((s) {
                                    setState(() {
                                      _controllerOutput.text = s.toString();
                                    });
                                  });
                                }
                                else{
                                  setState(() {
                                    _controllerOutput.text = " ";
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_deviceData.size.width - 55, _deviceData.size.height - 775, 0, 0),
                  child: RawMaterialButton(
                    onPressed: () => _controllerInput.clear(),
                    elevation: 1.0,
                    fillColor: Colors.white,
                    child: Icon(Icons.clear, color: Colors.blueGrey, size: 20,),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [BoxShadow(
                        color: Color.fromRGBO(0, 0, 205, 0.3),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      )],
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              controller: _controllerOutput,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled : true,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                              readOnly: true,
                              showCursor: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(_deviceData.size.width - 55, _deviceData.size.height - 775, 0, 0),
                  child: RawMaterialButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text : _controllerOutput.text));
                      final snackBar = SnackBar(content: Text('Translation Copied To Clip Board'));
                      _scaffoldKey.currentState.showSnackBar(snackBar);
                    },
                    elevation: 1.0,
                    fillColor: Colors.white,
                    child: Icon(Icons.content_copy, color: Colors.blueGrey, size: 20,),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
