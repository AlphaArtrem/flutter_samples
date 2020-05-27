import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onTap: (){},
                    child: Center(
                      child: Text("From", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
                    ),
                  ),
                ),
                Icon(Icons.compare_arrows, color: Colors.purpleAccent,),
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: Center(
                      child: Text("To", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled : true,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 15,
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled : true,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
