

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";

  String output = "0";

  Widget button(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          buttonpress(text);
        },
        child: Text(text),style: ElevatedButton.styleFrom(backgroundColor: text=="/"||text=="x"||text=="-"||text=="+" ?  Colors.amber:(text=="=")?,
      ),
    );
  }

  String evaluateexpression(String expression) {
    try {
      expression = expression.replaceAll("x", "*").replaceAll("/", "/");
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }

  void buttonpress(String value) {
    setState(() {
      if (value == "AC") {
        input = "";
        output = "0";
      } else if (value == "clear") {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : "";
      } else if (value == "=") {
        try {
          output = evaluateexpression(input);
        } catch (e) {
          output = "error";
        }
      } else {
        input = input + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: .end,
                crossAxisAlignment: .end,
                children: [Text(input), Text(output)],
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  button("AC"),
                  button("%"),
                  button("clear"),
                  button("/"),
                ],
              ),
              Row(
                children: [button("7"), button("8"), button("9"), button("x")],
              ),
              Row(
                children: [button("4"), button("5"), button("6"), button("-")],
              ),
              Row(
                children: [button("1"), button("2"), button("3"), button("+")],
              ),
              Row(
                children: [button("00"), button("0"), button("."), button("=")],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
