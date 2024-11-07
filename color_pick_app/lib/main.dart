import 'package:flutter/material.dart';
import 'package:color_pick_app/pages/colors.dart';

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
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color background = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
         color: background
         ),
        ), 
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            chooseColor();
          }, icon: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20,))
        ],
      ),
    )
    );
  }

  void chooseColor()async{
    Color newcolor;
    newcolor = await Navigator.push(context, MaterialPageRoute(builder: (context)=>Colorpick(bgColor: background)));
    setState(() {
      background = newcolor;
    });
  }
}