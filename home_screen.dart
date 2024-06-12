import 'package:flutter/material.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
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
                Text(
                  "QUADRLE",
                  style: TextStyle(fontSize: 80),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GameScreen()),
                    );
                  },
                  icon: Icon(Icons.play_arrow),
                  label: Text("Jogar"),
                ),
                SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    showGameInstructions(context);
                  },
                  icon: Icon(Icons.question_mark),
                  label: Text("Como Jogar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showGameInstructions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Como Jogar?"),
          content: Text(
            "Você será mostrado parte de diferentes obras presentes no espaço cultural, seu trabalho é encontrá-las e inserir seus titulos na caixa de texto abaixo",
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
