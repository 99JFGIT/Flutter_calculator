import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{

  @override

  String result="0";
  String value="0";
  double number1=0.0;
  double number2=0.0;
  String operand="";

 //function
 calculate(dynamic buttonText)
 {
  if(buttonText == "C") 
    {
      result="0";
      value="0";
      number1=0.0;
      number2=0.0;
      operand="";
    }
  else if(buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/")
  {
    //string ase result ta tai string duita age intiger or double covert kora lagbe
    number1=double.parse(result);
    operand=buttonText;
    value="0";
  }
  else if(buttonText =="=")
    {
      number2=double.parse(result);
      
      if(operand=="+"){
        value=(number1+number2).toStringAsFixed(2);
      }

      if(operand=="-"){
        value=(number1-number2).toStringAsFixed(2);
      }

      if(operand=="x"){
        value=(number1*number2).toStringAsFixed(2);
      }

      if(operand=="/"){
        value=(number1/number2).toStringAsFixed(2);
      }
      number1=0.0;
      number2=0.0;
      operand="";
    }
  else
    {
      value =value + buttonText;
    }
  


  setState(() {
    result=double.parse(value).toStringAsFixed(2);
  });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Jannat's Calculator",style: TextStyle(
          fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white,
        ),),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(result,style: TextStyle(
              fontSize: 40 ,fontWeight: FontWeight.bold, color: Colors.teal
            ),),

          ),

          Expanded(child: Divider()),

          Column(
            children: [

              Row(
                children: [
                  //widget
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  //widget
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  //widget
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("x"),
                ],
              ),
              Row(
                children: [
                  //widget
                  buildButton("0"),
                  buildButton("C"),
                  buildButton("="),
                  buildButton("/"),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText)
  {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
            style:  ElevatedButton.styleFrom(
                backgroundColor: Colors.tealAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
            ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(buttonText,style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
          onPressed:(){
             print(buttonText);
             calculate(buttonText);
          },
        ),
      ),
    );
  }

}

