import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Xylo> xyloList = [
    Xylo(Colors.red, 1),
    Xylo(Colors.blue, 2),
    Xylo(Colors.yellow, 3),
    Xylo(Colors.green, 4),
    Xylo(Colors.orange, 5),
    Xylo(Colors.purple, 6),
    Xylo(Colors.pink, 7),
  ];

  void playAudio(audioNum) async {
    Audio audio = Audio.load('assets/audio/note$audioNum.wav');
    audio
      ..play()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final xyloRows = xyloList.map((e) => Expanded(
          child: TextButton(
            onPressed: () {
              playAudio(e.audioNum);
            },
            child: Container(
              color: e.color,
            ),
          ),
        ));

    return Column(
      children: [
        AppBar(
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: const Text(
            "Xylophone",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ...xyloRows
      ],
    );
  }
}

class Xylo {
  MaterialColor color;
  int audioNum;

  Xylo(this.color, this.audioNum);
}
