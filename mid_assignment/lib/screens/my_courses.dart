import 'package:flutter/material.dart';
import 'package:mid_assignment/main.dart';
// ignore: must_be_immutable
class added_courses extends StatefulWidget {
  List <course> my_courses = [];
  added_courses({super.key,
  required this.my_courses});

  @override
  State<added_courses> createState() => _added_coursesState();
}

class _added_coursesState extends State<added_courses> {
  home fun = new  home();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context, widget.my_courses);}, icon: Icon(Icons.arrow_back, color: Colors.white,)),
        backgroundColor: Colors.green,
        title: Text('Enrolled Courses', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.my_courses.map((element)=> box(element ,element.name, element.id)).toList()
        ),
      ),
    );
  }
  Container box(course element, String CName, String Ccode){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(CName, style: TextStyle(fontSize: 18, color: Colors.black),),
          SizedBox(height: 10),
          Text(Ccode, style: TextStyle(fontSize: 18, color: Colors.black),),
          ElevatedButton(onPressed: (){
            setState(() {
              widget.my_courses.remove(element);
            });
          }, child: Text("Drop"))
        ],
      ),
    );
  }
}