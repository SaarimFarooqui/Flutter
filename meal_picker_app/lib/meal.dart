import 'package:flutter/material.dart';

// ignore: must_be_immutable
class mealselect extends StatefulWidget {
  mealGroup item;
  mealselect({super.key,
  required this.item});

  @override
  State<mealselect> createState() => _mealselectState();
}

class _mealselectState extends State<mealselect> {
  String mealName = "";
  String mealPrice = "";
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
          children: [
            ElevatedButton(
              onPressed: (){
                mealName = "Burger";
                mealPrice = "Rs 200";
                Navigator.pop(context);
              }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),child: Text("Choose Burger", style: TextStyle(color: Colors.white),),),
              ElevatedButton(
              onPressed: (){}, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),child: Text("Choose Pizza", style: TextStyle(color: Colors.white),),),
              ElevatedButton(
              onPressed: (){}, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),child: Text("Choose Sushi", style: TextStyle(color: Colors.white),),),
            ],
          ),
        ),
      );
  }
}

class mealGroup {
   String mealName;
   String mealPrice;

  mealGroup({required this.mealName, required this.mealPrice});
}