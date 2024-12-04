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
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}

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
          gradient: LinearGradient(colors: [const Color.fromARGB(255, 0, 255, 8), const Color.fromARGB(255, 0, 81, 3)],
          begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            courseCard("Computer Science")
          ],
        ),
      ),
    );
  }


  Card courseCard( String courseName ){
    return Card(
      margin: EdgeInsets.all(6),
        elevation: 10,
        shadowColor: Colors.cyan,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [ 
                Row(
                  children: [
                     Text(courseName, style: TextStyle(fontSize: 20),)
                  ],
                )
                  ],
                ),
              ),
            ) 
          );
  }
}