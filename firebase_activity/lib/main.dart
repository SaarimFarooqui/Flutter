import 'package:firebase_activity/pages/addition.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 0, 255, 8), Color.fromARGB(255, 217, 255, 0)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: ListView(
          children: const [],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buttonAddTask(context)
          ],
        ),
      ),
    );
  }

  ElevatedButton buttonAddTask(BuildContext thecontext){
    return ElevatedButton(onPressed: (){
      Navigator.push(thecontext, MaterialPageRoute(builder: (thecontext)=> const addition()));
    }, 
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(10),
            backgroundColor: WidgetStateProperty.all(Colors.blue)
      ), child: 
      const Icon(Icons.add, size: 30, color: Colors.white,),
    );
  }

  
}