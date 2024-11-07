import 'package:flutter/material.dart';
import 'package:task_3/pages/answerpage.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Multiple Choice Questions", style: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors:[Color.fromARGB(255, 70, 0, 182), Color.fromARGB(255, 132, 24, 255)],
          begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           question("What is the Capital of France ?","London","Berlin","Paris","Paris"),
           question("When did World war 2 ended ?","1944","1942","1945","1945")
          ],
        ),
      ),
    );
  }

  Container question(String question, String opt1, String opt2, String opt3, String Correct)
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(question, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 20)
            ),
            onPressed: ()async{
            String returnedAnswer;
            returnedAnswer = await Navigator.push(context, MaterialPageRoute(builder: (context)=>
            answerPage(question: question, option1: opt1, option2: opt2, option3: opt3, correct: Correct,)));
            if (returnedAnswer == Correct){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Its $Correct The answer is correct"))
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Its not $returnedAnswer The answer is incorrect"))
              );
            }
              }, child: const Text("Answer it"))
        ],
      ),

    );
  }
  
}