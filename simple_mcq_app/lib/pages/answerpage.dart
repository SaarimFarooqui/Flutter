import 'package:flutter/material.dart';

// ignore: must_be_immutable
class answerPage extends StatefulWidget {
    String question;
    String option1;
    String option2;
    String option3;
    String correct;
  answerPage({super.key,
  required this.question,
  required this.option1,
  required this.option2,
  required this.option3,
  required this.correct});

  @override
  State<answerPage> createState() => _answerPageState();
}

class _answerPageState extends State<answerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(7, 200, 7, 200),
        constraints: const BoxConstraints.expand(),
        color: const Color.fromARGB(255, 0, 41, 61),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.question, style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),),
              //option 1
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 30)
                ),
                onPressed: (){
                  Navigator.pop(context, widget.option1);
                }, child: Text(widget.option1, style: 
              const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),)),
              //option 2
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 30)
                ),
                onPressed: (){
                  Navigator.pop(context, widget.option2);
                }, child: Text(widget.option2, style: 
              const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),)),
              //option 3
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 30)
                ),
                onPressed: (){
                  Navigator.pop(context, widget.option3);
                }, child: Text(widget.option3, style: 
              const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),)),
            ],
          ),
        ),

      ),
    );
  }
}