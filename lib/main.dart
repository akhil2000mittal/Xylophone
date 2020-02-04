import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  List<Color> tileColor = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.lightGreen,
    Colors.green,
    Colors.blue,
    Colors.purple,
  ];
  List<String> tileNote = [
    "Sa",
    "Re",
    "Ga",
    "Ma",
    "Pa",
    "Dha",
    "Ni",
  ];

  void plays(int soundnumber) {
    final player = AudioCache();
    player.play("note$soundnumber.wav");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(7, buildTile))),
      ),
    );
  }

  Expanded buildTile(int index) {
    return Expanded(
      child: FlatButton(
        color: tileColor[index],
        onPressed: () {
          plays(index + 1);
        },
        child: Text(tileNote[index]),
      ),
    );
  }
}
