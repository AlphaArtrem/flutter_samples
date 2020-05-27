import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayState extends StatefulWidget {
  final String player;

  PlayState(this.player);

  @override
  _PlayStateState createState() => _PlayStateState();
}

class _PlayStateState extends State<PlayState> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('${widget.player}'),
      ),
    );
  }
}
