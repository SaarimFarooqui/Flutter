import 'package:flutter/material.dart';

// ignore: must_be_immutable
class addTask extends StatefulWidget {
  List <String> taskList;
    addTask({super.key, 
  required this.taskList});

  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  Color green = const Color.fromARGB(255, 162, 255, 168);
  TextEditingController taskControl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: green,
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskControl,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                label: Text("enter task", style: TextStyle(
                  fontSize: 20, color: Colors.grey
                ),
                selectionColor: Colors.black,)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
                if (taskControl.text != ""){
                  setState(() {
                    widget.taskList.add(taskControl.text.toString());
                    taskControl.clear();
                    Navigator.pop(context, widget.taskList);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("The text Field is empty", style: TextStyle( color: Colors.white, fontSize: 20 ),
                    ),
                    backgroundColor: Colors.blue,)
                  );
                }
            }, child: Text("Save Task and return", style: TextStyle( 
              color: Colors.grey, fontSize: 20
            ),))
          ],
        ),
      ),
      bottomNavigationBar: bottombar(),
    );
  }
  BottomAppBar bottombar(){
    return BottomAppBar(
      padding: EdgeInsets.all(0),
        child: Container(
          color: Colors.green,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context, widget.taskList);
              }, icon: Icon(Icons.arrow_back_ios, color: Colors.white,size: 35,)),
          ],
        ), 
        )
    );
  }
}