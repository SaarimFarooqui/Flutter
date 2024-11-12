import 'package:flutter/material.dart';

// ignore: must_be_immutable
class mealselect extends StatefulWidget {
  String mealName;
  String mealPrice;
  mealselect({super.key,
  required this.mealName,
  required this.mealPrice});

  @override
  State<mealselect> createState() => _mealselectState();
}

class _mealselectState extends State<mealselect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [ Colors.pink[100]!, Colors.pink],
          begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}