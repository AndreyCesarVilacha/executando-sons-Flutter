import 'package:flutter/material.dart';
//audioplayers: ^0.19.1
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");

  _executar() async{

    //String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3";
    //int resultado = await audioPlayer.play(url);

    audioPlayer = await audioCache.play("musica.mp3");

  }

  @override
  Widget build(BuildContext context) {
    _executar();
    return Container(
      
    );
  }
}