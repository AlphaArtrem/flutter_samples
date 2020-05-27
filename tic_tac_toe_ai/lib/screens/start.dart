import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final ValueChanged<bool> start;
  final ValueChanged<String> player;
  StartScreen(this.start, this.player);
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
                        GestureDetector(
                          onTap: (){
                            widget.player('O');
                            widget.start(false);
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.deepPurpleAccent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                              child: Text('O', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: (){
                            widget.player('X');
                            widget.start(false);
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.deepPurpleAccent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                              child: Text('X', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.white),),
                            ),
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
