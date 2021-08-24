import 'package:flutter/material.dart';
//audioplayers: ^0.19.1
import 'package:audioplayers/audioplayers.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AudioPlayer audioPlayer = AudioPlayer();
  //Acessando os arquivos da pasta audios
  AudioCache audioCache = AudioCache(prefix: "assets/audios/");
  //Var para verifica se a musica esta tocando pela primeira vez
  bool primeiraExecucao = true;
  //Var para controlar o volume do som
  double volume = 0.5;

  //Função para executar o som
  _executar() async {
    //String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3";
    //int resultado = await audioPlayer.play(url);

    //Controla o volume do som
    audioPlayer.setVolume(volume);

    //Verifica se é a primeira execução
    if (primeiraExecucao) {
      //Executando o arquivo mp3
      audioPlayer = await audioCache.play("musica.mp3");
      primeiraExecucao = false;
    } else {
      //Caso a musica seja parada ou interrompida, ele não chama denovo o arquivo
      //Ele executa a ação do audioPlayer
      int resultado = await audioPlayer.resume();
    }
  }

  _pausar() async {
    int resultado = await audioPlayer.pause();
  }

  _parar() async {
    int resultado = await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tocando musica"),
      ),
      body: Column(
        children: [
          Slider(
              value: volume,
              min: 0,
              max: 1,
              divisions: 10,
              onChanged: (novoVolume) {
                setState(() {
                  volume = novoVolume;
                });

                audioPlayer.setVolume(volume);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    _executar();
                  },
                  child: Image.asset("assets/imagens/executar.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    _pausar();
                  },
                  child: Image.asset("assets/imagens/pausar.png"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    _parar();
                  },
                  child: Image.asset("assets/imagens/parar.png"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
