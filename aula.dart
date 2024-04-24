import 'dart:math';

import 'package:flutter/material.dart';

class telaMain extends StatefulWidget {
  const telaMain({ super.key });

  @override
  State<telaMain> createState() => _TelaMainState();
}
var pontuacao = 0;
var imgAtual = 0;
var answers = [["unifor","Unifor"],["nice","Nice"]];
String? text; 
class _TelaMainState extends State<telaMain> {
  List<AssetImage> assetImages = [
    const AssetImage('assets/images/ead-unifor-novo.png'),
    const AssetImage("assets/images/monalsa.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        
        body:  Center(
          child: Padding(
            padding: EdgeInsets.all(23.0),
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("Pontuação: ${pontuacao}" ),SizedBox(child:
              SizedBox(width: 800,height: 200,child: Image(image: assetImages[imgAtual],alignment: Alignment.topCenter,),
              )
              ),SizedBox(width: 500,child:TextField(onChanged:(value) {
                text = value;
              },decoration: InputDecoration(labelText: "Resposta",border: OutlineInputBorder()), )),
              OutlinedButton(onPressed: (){
                  if(!verify()){
                    print("Errou");
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
        ),
      ),
    );
  }}
  bool verify(){
    
    if(answers[imgAtual].contains(text)){
      return true;
    }return false;
  }
