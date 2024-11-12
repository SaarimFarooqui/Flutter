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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
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
                widget.item = mealGroup(mealName: "Burger", mealPrice: "Rs 200");                
                Navigator.pop(context, widget.item);
              }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),child: Text("Choose Burger", style: TextStyle(color: Colors.white),),),
              //
              ElevatedButton(
              onPressed: (){
                widget.item = mealGroup(mealName: "Pizza", mealPrice: "Rs 400");                
                Navigator.pop(context, widget.item);
              }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),child: Text("Choose Pizza", style: TextStyle(color: Colors.white),),),
              //
              ElevatedButton(
              onPressed: (){
                widget.item = mealGroup(mealName: "Sushi", mealPrice: "Rs 250");                
                Navigator.pop(context, widget.item);
              }, style: ElevatedButton.styleFrom(
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