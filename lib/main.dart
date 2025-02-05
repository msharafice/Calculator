import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "0";
  List<String> history = [];
  bool showHistory = false;

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
      } else if (value == "⌫") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(input);
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
          history.add("$input = $result");
        } catch (e) {
          result = "error";
        }
      } else {
        input += value;
      }
    });
  }

  Widget buildButton(String text) {
    bool isOperator = "+-*/%⌫".contains(text);
    bool isEqualButton = text == "=";
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24),
          backgroundColor: isEqualButton ? Colors.orange : Colors.white,
        ),
        onPressed: () => buttonPressed(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: isOperator
                ? Colors.orange
                : (isEqualButton ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() => showHistory = false),
              child: Text("Calculator",
                  style: TextStyle(
                      fontSize: 18,
                      color: showHistory ? Colors.grey : Colors.black)),
            ),
            GestureDetector(
              onTap: () => setState(() => showHistory = true),
              child: Text("History",
                  style: TextStyle(
                      fontSize: 18,
                      color: showHistory ? Colors.black : Colors.grey)),
            ),
          ],
        ),
      ),
      body: showHistory
          ? ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(history[index], style: TextStyle(fontSize: 18)),
                );
              },
            )
          : Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(16),
                    child: Text(input, style: TextStyle(fontSize: 32)),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(16),
                    child: Text(result,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ),
                Row(
                  children: [
                    buildButton("C"),
                    buildButton("⌫"),
                    buildButton("%"),
                    buildButton("/")
                  ],
                ),
                Row(children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("*")
                ]),
                Row(children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-")
                ]),
                Row(children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("+")
                ]),
                Row(children: [
                  buildButton("2st"),
                  buildButton("0"),
                  buildButton("."),
                  buildButton("=")
                ]),
              ],
            ),
    );
  }
}
