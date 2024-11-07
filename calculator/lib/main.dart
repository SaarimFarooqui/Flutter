import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String input = "";
  String result = "";

  // Function to handle button presses
  void onButtonPressed(String value) {
    setState(() {
      if (value == "Clear") {
        // Clear the input and result
        input = "";
        result = "";
      } else if (value == "Calculate") {
        // Evaluate the expression and update the result
        try {
          result = _evaluateExpression(input);
        } catch (e) {
          result = "Error";
        }
      } else {
        // Append the value to the current input
        input += value;
      }
    });
  }

  // Function to evaluate the expression using basic logic
  String _evaluateExpression(String expression) {
    // Convert expression into a list of numbers and operators
    List<String> tokens = _tokenize(expression);

    // Apply DMAS rule
    tokens = _applyOperation(tokens, "/");
    tokens = _applyOperation(tokens, "X");
    tokens = _applyOperation(tokens, "+");
    tokens = _applyOperation(tokens, "-");

    // The final result should be the only remaining element
    return tokens.isNotEmpty ? tokens.first : "Error";
  }

  // Function to tokenize the expression string into numbers and operators
  List<String> _tokenize(String expression) {
    List<String> tokens = [];
    String currentNumber = "";

    for (int i = 0; i < expression.length; i++) {
      String char = expression[i];
      if (char == "+" || char == "-" || char == "X" || char == "/") {
        // Add the number and operator to tokens
        if (currentNumber.isNotEmpty) {
          tokens.add(currentNumber);
          currentNumber = "";
        }
        tokens.add(char);
      } else {
        // Accumulate the number
        currentNumber += char;
      }
    }

    // Add the last number to the tokens
    if (currentNumber.isNotEmpty) tokens.add(currentNumber);
    return tokens;
  }

  // Function to apply an operation ("/", "X", "+", "-") on the token list
  List<String> _applyOperation(List<String> tokens, String operator) {
    for (int i = 0; i < tokens.length; i++) {
      if (tokens[i] == operator) {
        double left = double.parse(tokens[i - 1]);
        double right = double.parse(tokens[i + 1]);
        double result;

        // Apply the operator
        switch (operator) {
          case "/":
            result = left / right;
            break;
          case "X":
            result = left * right;
            break;
          case "+":
            result = left + right;
            break;
          case "-":
            result = left - right;
            break;
          default:
            result = 0.0;
        }

        // Replace the operator and operands with the result
        tokens.replaceRange(i - 1, i + 2, [result.toString()]);
        
        // Restart the loop to reprocess from the beginning for the same operator
        i = 0;
      }
    }
    return tokens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.greenAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: 250,
              width: 450,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    input,
                    style: const TextStyle(fontSize: 32, color: Colors.black54),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 48, color: Colors.black),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btn("1"),
                      btn("2"),
                      btn("3"),
                      btn("/"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btn("4"),
                      btn("5"),
                      btn("6"),
                      btn("X"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btn("7"),
                      btn("8"),
                      btn("9"),
                      btn("+"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btn("0"),
                      btn("-"),
                      btn("Calculate"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      btn("Clear"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton btn(String text) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(40, 5, 40, 5),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}
