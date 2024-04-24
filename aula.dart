import 'package:flutter/material.dart';

class telaMain extends StatefulWidget {
  const telaMain({ super.key });

  @override
  State<telaMain> createState() => _TelaMainState();
}
String? text; 
class _TelaMainState extends State<telaMain> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        
        body:  Center(
          child: Padding(
            padding: EdgeInsets.all(23.0),
            child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [ SizedBox(child:
              SizedBox(width: 800,height: 200,child: Image(image: AssetImage('assets/images/ead-unifor-novo.png'),alignment: Alignment.topCenter,),
              )
              ),SizedBox(width: 500,child:TextField(onChanged:(value) {
                text = value;
              },decoration: InputDecoration(labelText: "Resposta",border: OutlineInputBorder()), ))


              
                
                
              
              
              
                
                

              
            ],
          ),
          )
        ),
      ),
    );
  }}