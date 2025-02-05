import 'package:flutter/material.dart';

Widget buildDefaultKeyboard(Function buttonPressed) {
  return Column(
    children: [
      Row(children: [
        buildButton("C", buttonPressed, null),
        buildButton("⌫", buttonPressed, null),
        buildButton("%", buttonPressed, null),
        buildButton("/", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("7", buttonPressed, null),
        buildButton("8", buttonPressed, null),
        buildButton("9", buttonPressed, null),
        buildButton("*", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("4", buttonPressed, null),
        buildButton("5", buttonPressed, null),
        buildButton("6", buttonPressed, null),
        buildButton("-", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("1", buttonPressed, null),
        buildButton("2", buttonPressed, null),
        buildButton("3", buttonPressed, null),
        buildButton("+", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("2st", buttonPressed, Icons.swap_horiz),
        buildButton("0", buttonPressed, null),
        buildButton(".", buttonPressed, null),
        buildButton("=", buttonPressed, null),
      ]),
    ],
  );
}

Widget buildAdvancedKeyboard(Function buttonPressed) {
  return Column(
    children: [
      Row(children: [
        buildButton("", buttonPressed, null),
        buildButton("sin", buttonPressed, null),
        buildButton("cos", buttonPressed, null),
        buildButton("tan", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("lg", buttonPressed, null),
        buildButton("ln", buttonPressed, null),
        buildButton("(", buttonPressed, null),
        buildButton(")", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("C", buttonPressed, null),
        buildButton("⌫", buttonPressed, null),
        buildButton("%", buttonPressed, null),
        buildButton("/", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("7", buttonPressed, null),
        buildButton("8", buttonPressed, null),
        buildButton("9", buttonPressed, null),
        buildButton("*", buttonPressed),
      ]),
      Row(children: [
        buildButton("4", buttonPressed, null),
        buildButton("5", buttonPressed, null),
        buildButton("6", buttonPressed, null),
        buildButton("-", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("1", buttonPressed, null),
        buildButton("2", buttonPressed, null),
        buildButton("3", buttonPressed, null),
        buildButton("+", buttonPressed, null),
      ]),
      Row(children: [
        buildButton("2st", buttonPressed, Icons.swap_horiz),
        buildButton("0", buttonPressed, null),
        buildButton(".", buttonPressed, null),
        buildButton("=", buttonPressed, null),
      ]),
    ],
  );
}

Widget buildButton(String text, Function buttonPressed, [IconData? icon]) {
  bool isOperator = "+-*/%⌫".contains(text);
  bool isEqualButton = text == "=";
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(24),
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