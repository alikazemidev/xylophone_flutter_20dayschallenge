import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            bellButton(color: Colors.red, soundNumber: 1),
            bellButton(color: Colors.black, soundNumber: 2),
            bellButton(color: Colors.pink, soundNumber: 3),
            bellButton(color: Colors.yellow, soundNumber: 4),
            bellButton(color: Colors.brown, soundNumber: 5),
            bellButton(color: Colors.indigo, soundNumber: 6),
            bellButton(color: Colors.amber, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}

class bellButton extends StatelessWidget {
  final Color? color;
  final int? soundNumber;

  const bellButton({super.key, this.color, this.soundNumber});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () async {
          final player = AudioPlayer();
          await player.play(AssetSource('note$soundNumber.wav'));
        },
        child: Text(''),
      ),
    );
  }
}
