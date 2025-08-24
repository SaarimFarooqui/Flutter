import 'package:flutter/material.dart';

class addition extends StatefulWidget {
  const addition({super.key});

  @override
  State<addition> createState() => _additionState();
}

class _additionState extends State<addition> {
  TextEditingController taskname = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 34, 0, 255), Color.fromARGB(255, 2, 0, 58)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                ),
                labelText: "Task Name",
                labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                hintText: "i.e Homework",
                hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}