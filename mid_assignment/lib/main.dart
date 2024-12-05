import 'package:flutter/material.dart';
import 'package:mid_assignment/screens/course_detail_scr.dart';
import 'package:mid_assignment/screens/my_courses.dart';

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
  List <course> my_courses = [];
  List <course> list_courses = [
    course(id: "CSC-301", name: "Design and Analysis of Algorithms", professor: "Zulfiqar Ali", schedule: "Wed & Thu"),
    course(id: "CSC-318", name: "Mobile App Development",  professor: "Farhan Ahmad", schedule: "Thu & Fri"),
     course(id: "CSC-316", name: "Big Data Analytics",  professor: "Faiza Nasim", schedule: "Wed & Thu"),
     course(id: "MSC-301", name: "Technopreneurship",  professor: "Shariq Ahmad Qidwai", schedule: "Thu & Fri"),
     course(id: "CNS-302", name: "Information Security",  professor: "Fauzan Siddiqui", schedule: "Wed & Fri"),
     course(id: "CSC-302", name: "Parallel and Distributed Computing",  professor: "Rameen Anwar", schedule: "Sat")
  ];
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ IconButton(onPressed: (){
          push_to_my_courses();
        }, icon: Icon(Icons.book, color: Colors.white,size: 20,))],
        backgroundColor: Colors.green,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [const Color.fromARGB(255, 0, 255, 8), const Color.fromARGB(255, 0, 81, 3)],
          begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: list_courses.map((element)=> courseCard(element)).toList()
        ),
      ),
    );
  }


  Card courseCard( course courseN ){
    return Card(
      margin: EdgeInsets.all(6),
        elevation: 10,
        shadowColor: Colors.cyan,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> course_details(the_course: courseN)));
          },
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [ 
                Row(
                  children: [
                     Text(courseN.name, style: TextStyle(fontSize: 20),)
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      course_add(courseN, my_courses);
                    }, child: Text("Add this course", style: TextStyle(),)),
                  ],
                )
                  ],
                ),
              ),
            ) 
          );
  }

  

  void course_add(course the_course, List <course> my_list){
    int prev = my_list.length;
    if(my_list.contains(the_course)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("You Already have this course"),
        duration: Duration(seconds: 1),
      ));
    }else{
      setState(() {
      the_course.isenrolled = true;
      my_list.add(the_course);
    });
    }
    if (my_list.length > prev){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Course added"),
        duration: Duration(seconds: 1),
      ));
    }
  }
  void push_to_my_courses()async{
    List <course> updatedList = [];
    updatedList = await Navigator.push(context, MaterialPageRoute(builder: (context) => added_courses(my_courses: my_courses)));
    setState(() {
      my_courses = updatedList;
    });
  }
}


class course{
  final String id;
  final String name;
  final String professor;
  final String schedule;
  bool isenrolled;
  
  course({
    required this.id,
    required this.name,
    required this.professor,
    required this.schedule,
    this.isenrolled = false
  });
}