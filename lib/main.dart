import 'package:calculator_ristek/aboutme.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: CalculatorBody(),
    );
  }
}

class CalculatorBody extends StatefulWidget {
  @override
  _CalculatorBodyState createState() => _CalculatorBodyState();
}

class _CalculatorBodyState extends State<CalculatorBody> {

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        // Set the font size
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        // Set all to "0"
        equation = "0";
        result = "0";
      }
      else if (buttonText == "⌫") {
        // Set the font size
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        // Use string slicing concept
        equation = equation.substring(0, equation.length-1);
        // If the remaining substring is empty, set to 0
        if (equation == "") equation = "0";
      }
      else if (buttonText == "=") {
        // Set the font size
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        // Set expression (from math_expression package) as the current equation
        expression = equation;
        // Replace unicode symbols with math symbols
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        // Use try-catch for solving the operations
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch(e) {
          result = "ERROR";
        }
      }
      else {
        // Set the font size
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        // If the current equation is 0, set the equation to the pressed number
        if (equation == "0") equation = buttonText;
        // Else, append the pressed number to the equation
        else equation = equation + buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              )
          ),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'About Me',
              onPressed: () {
                navigateToAboutMe(context);
              }
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize),),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container( // Container of buttons
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("C", 1, Colors.deepOrangeAccent),
                        buildButton("⌫", 1, Colors.blueGrey),
                        buildButton("÷", 1, Colors.blueGrey),
                      ],
                    ), // First row

                    TableRow(
                      children: [
                        buildButton("7", 1, Colors.black45),
                        buildButton("8", 1, Colors.black45),
                        buildButton("9", 1, Colors.black45),
                      ],
                    ), // Second row

                    TableRow(
                      children: [
                        buildButton("4", 1, Colors.black45),
                        buildButton("5", 1, Colors.black45),
                        buildButton("6", 1, Colors.black45),
                      ],
                    ), // Third row

                    TableRow(
                      children: [
                        buildButton("1", 1, Colors.black45),
                        buildButton("2", 1, Colors.black45),
                        buildButton("3", 1, Colors.black45),
                      ],
                    ), // Fourth row

                    TableRow(
                      children: [
                        buildButton(".", 1, Colors.black45),
                        buildButton("0", 1, Colors.black45),
                        buildButton("00", 1, Colors.black45),
                      ],
                    ), // Fifth row
                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildButton("×", 1, Colors.blueGrey)
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("-", 1, Colors.blueGrey)
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("+", 1, Colors.blueGrey)
                      ],
                    ),

                    TableRow(
                      children: [
                        buildButton("=", 2, Colors.deepOrangeAccent)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future navigateToAboutMe(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMe()));
  }

}