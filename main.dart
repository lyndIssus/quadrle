import 'package:flutter/material.dart';
import 'package:primeirojeto/aula.dart';


main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      home: Scaffold(
        body: MyLayout()),
    );
  }
}


class MyLayout extends StatelessWidget {


  @override
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
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [ Text("QUADRLE",style: TextStyle(fontSize: 80),),
              ElevatedButton.icon(onPressed: (){
                
                Navigator.push(context,MaterialPageRoute(builder: (context)=> telaMain()));
              }, icon: Icon(Icons.play_arrow) ,label: Text("Jogar"), ),
              OutlinedButton.icon(onPressed: (){
                testAlert(context);
              }
                  ,label: Text("Como Jogar"),icon: Icon(Icons.question_mark),)


              
                
                
              
              
              
                
                

              
            ],
          ),
          )
        )),
      ),
    );
  }
}
void testAlert(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {Navigator.pop(context);},
  );
      AlertDialog alert = AlertDialog(
    title: Text("Como Jogar?"),
    content: Text("Você será mostrado parte de diferentes obras presentes no espaço cultural, seu trabalho é encontrá-las e inserir seus titulos na caixa de texto abaixo"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
  




