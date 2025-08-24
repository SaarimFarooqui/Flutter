import 'package:flutter/material.dart';
import 'package:batsman_pro/pages/scrolls.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 246, 198, 255)
        ),
        child: Column(
          children: [
            Container(
              
            ),
            Container(
              height: 210,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.pink, Colors.purpleAccent], begin: Alignment.topLeft, end: Alignment.bottomRight)
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  boxe(), boxe(), boxe(), boxe(), boxe(),
                  boxe(), boxe(), boxe()
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}