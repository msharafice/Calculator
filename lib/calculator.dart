import 'package:flutter/material.dart';
import 'package:math_parser/math_parser.dart';
import 'widgets.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "0";
  bool showAdvancedKeyboard = false;
  bool showSecond = false;
  bool isDegDisabled = false;
  bool isDegreeMode = true;
  List<String> history = [];
  bool showHistory = false;

  void buttonPressed(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        result = "0";
      } else if (value == "⌫") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        try {
          String formattedInput = input
              .replaceAllMapped(RegExp(r'lg\s*\(?([\d.]+)\)?'),
                  (match) => 'log(${match[1]},10)')
              .replaceAllMapped(RegExp(r'ln\s*\(?([\d.]+)\)?'),
                  (match) => 'log(${match[1]}, e)')
              .replaceAllMapped(RegExp(r'sin\s*\(?([\d.]+)\)?'),
                  (match) => 'sin((${match[1]} * pi / 180))')
              .replaceAllMapped(RegExp(r'cos\s*\(?([\d.]+)\)?'),
                  (match) => 'cos((${match[1]} * pi / 180))')
              .replaceAllMapped(RegExp(r'tan\s*\(?([\d.]+)\)?'),
                  (match) => 'tan((${match[1]} * pi / 180))')
              .replaceAllMapped(RegExp(r'sin⁻¹\s*\(?([\d.]+)\)?'),
                  (match) => '(asin(${match[1]}) * 180 / pi)')
              .replaceAllMapped(RegExp(r'cos⁻¹\s*\(?([\d.]+)\)?'),
                  (match) => '(acos(${match[1]}) * 180 / pi)')
              .replaceAllMapped(RegExp(r'tan⁻¹\s*\(?([\d.]+)\)?'),
                  (match) => '(atan(${match[1]}) * 180 / pi)')
              .replaceAll("π", "pi")
              .replaceAllMapped(
                RegExp(r'√\(?([\d.]+)\)?'),
                (match) => 'sqrt(${match[1]})',
              );
          final parser = MathNodeExpression.fromString(formattedInput);
          final evaluated =
              parser.calc(MathVariableValues({'pi': 3.141592653589793}));
          result = evaluated
              .toStringAsFixed(6)
              .replaceAll(RegExp(r"0*$"), "")
              .replaceAll(RegExp(r"\.$"), "");
          history.add("$input = $result");
          input = "";
        } catch (e) {
          result = "خطا";
        }
      } else if (value == "2st") {
        showAdvancedKeyboard = !showAdvancedKeyboard;
      } else if (value == "2nd") {
        // تغییر حالت صفحه‌کلید پیشرفته
        setState(() {
          showSecond = !showSecond; // تغییر وضعیت 2nd
        });
      } else if (value == "√") {
        input += "√(";
      } else if (value == "⁻¹") {
        setState(() {
          if (input.isNotEmpty) {
            input = "($input)^(-1)";
          }
        });
      } else if (value == "x^y") {
        // فقط ^ را به ورودی اضافه کن
        setState(() {
          if (input.isNotEmpty && !input.contains("^")) {
            input += "^"; // به ورودی فقط ^ اضافه کن
          }
        });
      } else if (value == "e") {
        // نمایش عدد e تا 20 رقم اعشار
        setState(() {
          input += "e"; // نمایش عدد e تا 20 رقم اعشار
          result = "2.71828182845904523536";
        });
      } else if (value == "π") {
        setState(() {
          input += "π";
          result = "3.141592653589793238";
        });
      } else {
        input += value;
      }
    });
  }

  void toggleDegRad() {
    setState(() {
      isDegreeMode = !isDegreeMode;
    });
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
                // advanced keyboard
                if (!showSecond && showAdvancedKeyboard)
                  buildAdvancedKeyboard(buttonPressed),
                // advanced 2nd keyboard
                if (showSecond) buildSecondKeyboard(buttonPressed),

                // defult keyboard
                if (!showSecond && !showAdvancedKeyboard)
                  buildDefaultKeyboard(buttonPressed),
              ],
            ),
    );
  }
}
