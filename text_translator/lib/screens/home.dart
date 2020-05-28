import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _from = 'English' , _to = 'English';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        setState(() {
                          _from = result.toString();
                        });
                      }
                    },
                    child: Center(
                      child: Text(_from, style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
                    ),
                  ),
                ),
                Icon(Icons.compare_arrows, color: Colors.purpleAccent,),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      dynamic result = await Navigator.pushNamed(context, '/chooseLanguage');
                      if(result != null){
                        setState(() {
                          _to = result.toString();
                        });
                      }
                    },
                    child: Center(
                      child: Text(_to, style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
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
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey)),
                            ),
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled : true,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled : true,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(335, 5, 0, 0),
                  child: RawMaterialButton(
                    onPressed: () => _controller.clear(),
                    elevation: 1.0,
                    fillColor: Colors.white,
                    child: Icon(Icons.clear, color: Colors.blueGrey,),
                    padding: EdgeInsets.all(8.0),
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
