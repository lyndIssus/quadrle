import 'dart:math';

import 'package:flutter/material.dart';
import 'package:primeirojeto/main.dart';

class telaMain extends StatefulWidget {
  const telaMain({ super.key });

  @override
  State<telaMain> createState() => _TelaMainState();
}
var vidas = 3;
var pontuacao = 0;
var imgAtual = 0;
var answers = [["unifor","Unifor"],["nice","Nice"],["Relativity","relativity"]];
String? text; 
class _TelaMainState extends State<telaMain> {
  List<AssetImage> assetImages = [
    const AssetImage('assets/images/ead-unifor-novo.png'),
    const AssetImage("assets/images/monalsa.jpg"),
    const AssetImage("assets/images/Escher's_Relativity.jpg")
  ];
  List iconNumbers= [
    [Icon(Icons.favorite,color: Colors.red,),Icon(Icons.favorite,color: Colors.grey),Icon(Icons.favorite,color: Colors.grey)],
    [Icon(Icons.favorite,color: Colors.red,), Icon(Icons.favorite,color: Colors.red),Icon(Icons.favorite,color: Colors.grey)],
    [Icon(Icons.favorite,color: Colors.red,), Icon(Icons.favorite,color: Colors.red), Icon(Icons.favorite,color: Colors.red)]
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        
        body: Container( decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
            Color.fromARGB(171, 6, 201, 255),
            Color.fromARGB(155, 200, 59, 225)])
        ) ,child: Center(
          child: Padding(
            padding: EdgeInsets.all(23.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [Row(mainAxisAlignment: MainAxisAlignment.center,children: iconNumbers[vidas-1]) 
              ,Text("Vidas: ${vidas}"),Text("Pontuação: ${pontuacao}" ),SizedBox(child:
              SizedBox(width: 800,height: 200,child: Image(image: assetImages[imgAtual],alignment: Alignment.topCenter,),
              )
              ),SizedBox(width: 500,child:TextField(onChanged:(value) {
                text = value;
              },decoration: InputDecoration(labelText: "Resposta",border: OutlineInputBorder()), )),
              OutlinedButton(onPressed: (){
                  if(!verify()){
                    setState(() {
                      vidas-=1;
                      imgAtual = Random().nextInt(assetImages.length);
                      if(vidas == 0){
                        vidas = 3;
                        pontuacao = 0;
                        Navigator.pop(context);
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> MyApp()));
                        
                      }
                    });
                  }else{
                    
                    setState(() {
                      imgAtual = Random().nextInt(assetImages.length);
                      pontuacao+=1;
                      if(imgAtual==  assetImages.length){
                        imgAtual = 0;
                      }
                    });
                  }
              }, child:  Text("Enviar"))


              
            
            ],
          ),
          )
        ),)
      ),
    );
  }}
  bool verify(){
    
    if(answers[imgAtual].contains(text)){
      return true;
    }return false;
  }
