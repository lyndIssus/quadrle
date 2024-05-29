

import 'package:flutter/material.dart';
import 'package:quadrle/main.dart';

class ScreenTwo extends StatelessWidget {
  
  final List data;
  ScreenTwo({ required this.data});
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home:Scaffold(
        
        body: Container(decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            Color.fromARGB(171, 6, 201, 255),
            Color.fromARGB(155, 200, 59, 225)])
        ) ,child: 
        Center(
          child: Padding(
            padding: EdgeInsets.all(23.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("FIM DE JOGO",style: TextStyle(fontSize: 70),),
                  Text("Pontuacao: ${data[0]}",style: TextStyle(fontSize: 50)),
                  Text("Erros: ${data[1]}",style: TextStyle(fontSize: 50,),)
              ,ElevatedButton.icon(onPressed: (){
                
                Navigator.push(context,MaterialPageRoute(builder: (context)=> MyApp()));
              }, icon: Icon(Icons.keyboard_return) ,label: Text("Voltar ao Menu"), )]
            )
            )
            )
            )
            )
    );
  }

  
}
