import 'package:flutter/material.dart';

class boxe extends StatelessWidget {
  const boxe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}