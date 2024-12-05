import 'package:flutter/material.dart';
import 'package:mid_assignment/main.dart';

class course_details extends StatelessWidget {

  final course the_course;

  const course_details({super.key,
  required this.the_course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back, color: Colors.white,size: 14,)),
        backgroundColor: Colors.green,
        title: Text('Course Details', style: TextStyle( fontSize: 24, color: Colors.white, fontWeight: FontWeight.w900),),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 0),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [ 
                Flexible(child: Text('Course Code: '+the_course.id, style: TextStyle(fontWeight: FontWeight.w800,  fontSize: 20, color: Colors.black),
              overflow: TextOverflow.visible,),),
                Flexible(child: Text('Course Name: '+the_course.name, style: TextStyle( fontWeight: FontWeight.w800 ,fontSize: 20, color: Colors.black),
              overflow: TextOverflow.visible,),)
            ],
            ),
            Row(
              children: [ 
                Flexible(child: Text('Faculty/Teacher: '+the_course.professor, style: TextStyle(fontWeight: FontWeight.w800,  fontSize: 16, color: Colors.black),
              overflow: TextOverflow.visible,),),
                Flexible(child: Text('Schedule: '+the_course.schedule, style: TextStyle( fontWeight: FontWeight.w800 ,fontSize: 16, color: Colors.black),
              overflow: TextOverflow.visible,),),
            ],
            )
          ],
        ),
      ),
    );
  }
}