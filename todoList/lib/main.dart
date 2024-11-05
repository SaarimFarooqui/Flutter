import 'package:flutter/material.dart';
import 'package:lab_5/addTask.dart';

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
  Color blue = const Color.fromARGB(255, 0, 11, 165);
  Color green = const Color.fromARGB(255, 162, 255, 168);
  List<String> taskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 4),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: green
        ),
        child: ListView(
          children: taskList.map((word) => taskBox(word, taskList, taskList.indexOf(word))).toList()
        ),
      ),
      bottomNavigationBar: bottombar()
    );
  }
  // Bottom App Bar
  BottomAppBar bottombar(){
    return BottomAppBar(
      padding: EdgeInsets.all(0),
        child: Container(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                push();
              }, icon: Icon(Icons.add_circle_rounded, color: Colors.white,size: 40,)),
          ],
        ), 
        )
    );
  }
  
  Container taskBox(String taskName, List<String> taskList, int indexNum){
    indexNum += 1;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$indexNum $taskName",style: TextStyle(
            color: Colors.black, fontSize: 20, 
          ),),
          IconButton(onPressed: (){
            setState(() {
              taskList.remove(taskName);
            });
          }, icon: Icon(Icons.cancel),color: Colors.black, iconSize: 30,)
        ],
      ),
    );
  }

void push()async{
  List <String> updatedList = await Navigator.push(context, MaterialPageRoute(builder: (context)=> addTask(taskList: taskList)));
    setState(() {
      taskList = updatedList;
    });
  }
}