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
      home: Homepage(),
    ) ;
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [const Color.fromARGB(255, 149, 0, 255),const Color.fromARGB(255, 255, 0, 157)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              txtRow("My name is Saarim"),
              txtRow("I am enrolled in BSCS"),
              txtRow("I study Flutter"),
              txtRow("I am student"),
              txtRow("Last row was tapped"),
            ],
          ),
        )
      ),
    );
  }
  InkWell txtRow(String txt){
    SizedBox(
      height:20,
    );
    return InkWell(
      onTap: () {
        msgbar(txt);
      },
      onDoubleTap: () {
        msgbar("double tapped");
      },
      onLongPress: () {
        msgbar("Long pressed");
      },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [Text(txt, style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w600),),],),
    );
  }
  void msgbar(String messege){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
    Text(messege, style: TextStyle(color: Colors.white, fontSize: 20),),
    duration: Duration(seconds: 1),),);
  }
}