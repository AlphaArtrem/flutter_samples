import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ai/screens/play.dart';
import 'package:tic_tac_toe_ai/screens/start.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> with SingleTickerProviderStateMixin{
  bool _start = true;
  String _player = '';

  _gameStage(bool start){
    setState(() {
      _start = start;
    });
  }

  _gamePlayer(String player){
    setState(() {
      _player = player;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tic Tac Toe',
        home: _start ? StartScreen(_gameStage, _gamePlayer) : PlayState(_player),
    );
  }
}


