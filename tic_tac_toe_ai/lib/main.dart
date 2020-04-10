import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool _start = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tac Toe',
        home: _start ? ChooseSign() : Container()
    );
  }
}

class ChooseSign extends StatefulWidget {
  @override
  _ChooseSignState createState() => _ChooseSignState();
}

class _ChooseSignState extends State<ChooseSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Colors.deepPurple[900],
              Colors.deepPurple[600],
              Colors.deepPurple[300],
              Colors.deepPurpleAccent,
            ]
          )
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Choose Your', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
              Text('Player.', style: TextStyle(fontSize: 75 , fontWeight: FontWeight.bold, color: Colors.white),),
              SizedBox(height: 50,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)
                    )
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          color: Colors.deepPurpleAccent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                            child: Text('O', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Card(
                          elevation: 5,
                          color: Colors.deepPurpleAccent,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                            child: Text('X', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

