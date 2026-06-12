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
      child: SizedBox(
        width: 75,
        height: 75,

        child: ElevatedButton(
          onPressed: () {
            buttonpress(text);
          },
          child: Text(text,style: TextStyle(fontSize: Text=="AC"?18:30)),
          style: ElevatedButton.styleFrom(
            backgroundColor:
                text == "/" || text == "X" || text == "-" || text == "+"
                ? const Color.fromARGB(255, 47, 223, 194)
                : (text == "=")
                ? const Color.fromARGB(255, 232, 48, 12)
                : const Color.fromARGB(255, 156, 166, 164),
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 30),
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
          ),
        ),
      ),
    );
  }

  String evaluateexpression(String expression) {
    try {
      expression = expression.replaceAll("X", "*").replaceAll("/", "/");
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
      } else if (value == "⌫") {
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
      backgroundColor: const Color.fromARGB(255, 15, 1, 1),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: .end,
                    crossAxisAlignment: .end,
                    children: [
                      Text(input, style: TextStyle(color: Colors.white,fontSize: 30)),
                      Text(
                        output,
                        style: TextStyle(color: Colors.white, fontSize: 70),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      button("AC"),
                      SizedBox(width: 10),
                      button("%"),
                      SizedBox(width: 10),
                      button("()"),
                      SizedBox(width: 10),
                      button("/"),
                      SizedBox(width: 10),
                    ],
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("7"),
                      SizedBox(width: 10),
                      button("8"),
                      SizedBox(width: 10),
                      button("9"),
                      SizedBox(width: 10),
                      button("X"),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("4"),
                      SizedBox(width: 10),
                      button("5"),
                      SizedBox(width: 10),
                      button("6"),
                      SizedBox(width: 10),
                      button("-"),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("1"),
                      SizedBox(width: 10),
                      button("2"),
                      SizedBox(width: 10),
                      button("3"),
                      SizedBox(width: 10),
                      button("+"),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      button("0"),
                      SizedBox(width: 10),
                      button("⌫"),
                      SizedBox(width: 10),
                      button("."),
                      SizedBox(width: 10),
                      button("="),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
