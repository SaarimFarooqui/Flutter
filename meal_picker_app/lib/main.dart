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
    return MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.green, Colors.greenAccent])
        ),
        child: ListView(
          children: [ 
            listbox("Burger", "PKR 100"),
            listbox("Pizza", "PKR 200"),
            listbox("Juice", "PKR 80")
          ],
        ),
      ),
    );
  }
  Container listbox(String mealName, String mealPrice){
    return Container(
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(mealName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
          Text(mealPrice, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),)
        ],
      ),
    );
  }
}