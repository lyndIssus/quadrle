import 'dart:math';
import 'package:flutter/material.dart';
import 'end_screen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  int vidas = 3;
  int pontuacao = 0;
  int imgAtual = 0;
  String? text;
  bool wrongAnswer = false;
  List<AssetImage> fixedImages = [
    AssetImage('assets/images/monalsa.jpeg'),
    AssetImage('assets/images/indiomulata.jpeg'),
    AssetImage('assets/images/meninosA.jpeg'),
  ];
  List<AssetImage> assetImages = [
    AssetImage('assets/images/monalsa.jpeg'),
    AssetImage('assets/images/indiomulata.jpeg'),
    AssetImage('assets/images/meninosA.jpeg'),
  ];
  List<List<String>> fixedAsw = [
    ["unifor", "Unifor"],
    ["nice", "Nice"],
    ["Relativity", "relativity"]
  ];
  List<List<String>> answers = [
    ["unifor", "Unifor"],
    ["nice", "Nice"],
    ["Relativity", "relativity"]
  ];

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.1, 0),
    ).chain(CurveTween(curve: Curves.elasticIn)).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(171, 6, 201, 255),
              Color.fromARGB(155, 200, 59, 225),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return Icon(
                      Icons.favorite,
                      color: index < vidas ? Colors.red : Colors.grey,
                    );
                  }),
                ),
                SizedBox(height: 10),
                Text("Vidas: $vidas"),
                Text("Pontuação: $pontuacao"),
                SizedBox(
                  width: 800,
                  height: 200,
                  child: SlideTransition(
                    position: _animation,
                    child: Image(image: assetImages[imgAtual]),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: 500,
                  child: TextField(
                    onChanged: (value) {
                      text = value;
                    },
                    decoration: InputDecoration(
                      labelText: "Resposta",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    if (!verifyAnswer()) {
                      setState(() {
                        wrongAnswer = true;
                        _animationController.forward().then((value) {
                          _animationController.reverse();
                        });
                        vidas -= 1;
                        assetImages.removeAt(imgAtual);
                        answers.removeAt(imgAtual);
                        if(assetImages.isEmpty){
                          endGame(context);
                        }
                        imgAtual = Random().nextInt(assetImages.length);
                        if (vidas == 0) {
                          endGame(context);
                        }
                      });
                    } else {
                      setState(() {
                        wrongAnswer = false;
                        assetImages.removeAt(imgAtual);
                        answers.removeAt(imgAtual);
                        pontuacao += 1;
                        if(assetImages.isEmpty){
                          endGame(context);
                        }
                        imgAtual = Random().nextInt(assetImages.length);
                        
                        if (imgAtual == assetImages.length) {
                          imgAtual = 0;
                        }
                      });
                    }
                  },
                  child: Text("Enviar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool verifyAnswer() {
    return answers[imgAtual].contains(text);
  }

  void endGame(BuildContext context) {
    assetImages = fixedImages;
    answers = fixedAsw;
    List<int> data = [pontuacao, 3 - vidas];
    pontuacao = 0;
    vidas = 3;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => EndScreen(data: data)),
      (Route<dynamic> route) => false,
    );
  }
}
