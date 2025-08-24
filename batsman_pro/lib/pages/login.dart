import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [const Color.fromARGB(255, 216, 193, 255), const Color.fromARGB(255, 137, 74, 244)], begin: Alignment.bottomLeft, end: Alignment.topRight)
            ),
        ),
    );
  }
}