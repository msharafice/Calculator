import 'package:flutter/material.dart';

Widget buildDefaultKeyboard(Function buttonPressed) {
  return Column(
    children: [
      Row(children: [
        buildButton("AC", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("⌫", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("%", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("/", buttonPressed, null),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("7", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("8", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("9", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("*", buttonPressed, null),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("4", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("5", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("6", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("-", buttonPressed, null),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("1", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("2", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("3", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("+", buttonPressed, null),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("2st", buttonPressed, Icons.swap_horiz),
        SizedBox(width: 10),
        buildButton("0", buttonPressed, null),
        SizedBox(width: 10),
        buildButton(".", buttonPressed, null),
        SizedBox(width: 10),
        buildButton("=", buttonPressed, null),
      ]),
      SizedBox(height: 10),
    ],
  );
}

Widget buildAdvancedKeyboard(Function buttonPressed) {
  return Column(
    children: [
      Row(children: [
        buildButton("2nd", buttonPressed, null, true),
        buildButton("deg", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("sin", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("cos", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("tan", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("x^y", buttonPressed, null, true),
        buildButton("lg", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("ln", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("(", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton(")", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("√", buttonPressed, null, true),
        buildButton("AC", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("⌫", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("%", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("/", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("x!", buttonPressed, null, true),
        buildButton("7", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("8", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("9", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("*", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("⁻¹", buttonPressed, null, true),
        buildButton("4", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("5", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("6", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("-", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("π", buttonPressed, null, true),
        buildButton("1", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("2", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("3", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("+", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("2st", buttonPressed, Icons.swap_horiz, true),
        SizedBox(width: 10),
        buildButton("e", buttonPressed, null, true),
        buildButton("0", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton(".", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("=", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
    ],
  );
}

Widget buildSecondKeyboard(Function buttonPressed) {
  return Column(
    children: [
      Row(children: [
        buildButton("2nd", buttonPressed, null, true),
        buildButton("deg", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("sin⁻¹", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("cos⁻¹", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("tan⁻¹", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("x^y", buttonPressed, null, true),
        buildButton("lg", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("ln", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("(", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton(")", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("√", buttonPressed, null, true),
        buildButton("AC", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("⌫", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("%", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("/", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("x!", buttonPressed, null, true),
        buildButton("7", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("8", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("9", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("*", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("⁻¹", buttonPressed, null, true),
        buildButton("4", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("5", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("6", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("-", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("π", buttonPressed, null, true),
        buildButton("1", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("2", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("3", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("+", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
      Row(children: [
        buildButton("2st", buttonPressed, Icons.swap_horiz, true),
        SizedBox(width: 10),
        buildButton("e", buttonPressed, null, true),
        buildButton("0", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton(".", buttonPressed, null, true),
        SizedBox(width: 10),
        buildButton("=", buttonPressed, null, true),
      ]),
      SizedBox(height: 10),
    ],
  );
}

Widget buildButton(String text, Function buttonPressed,
    [IconData? icon, bool isAdvanced = false]) {
  bool isOperator = "+-*/%⌫".contains(text);
  bool isEqualButton = text == "=";

  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(
            isAdvanced ? 12 : 24), // تغییر اندازه دکمه در حالت پیشرفته
        backgroundColor: isEqualButton ? Colors.orange : Colors.white,
      ),
      onPressed: () => buttonPressed(text),
      child: icon != null
          ? Icon(icon,
              size: 28, color: isOperator ? Colors.orange : Colors.black)
          : Text(
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
