import 'package:flutter/material.dart';
import 'main.dart';

class EndScreen extends StatelessWidget {
  final List<int> data;

  EndScreen({required this.data});

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
                  "FIM DE JOGO",
                  style: TextStyle(fontSize: 70),
                ),
                Text(
                  "Pontuação: ${data[0]}",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  "Erros: ${data[1]}",
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  icon: Icon(Icons.keyboard_return),
                  label: Text("Voltar ao Menu"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
