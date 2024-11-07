import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Colorpick extends StatefulWidget {
  Color bgColor = Colors.blue;
   Colorpick({super.key,
  required this.bgColor});

  @override
  State<Colorpick> createState() => _ColorpickState();
}

class _ColorpickState extends State<Colorpick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context, widget.bgColor);}, icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20,)),
        title: const Text("Choose color", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),),
      ), 
      body: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints.expand(),
        color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            colorBtn("Blue", Colors.blue),
            colorBtn("green", Colors.green),
            colorBtn("purple", Colors.purple),
            colorBtn("greenAccent", Colors.greenAccent)
          ],
        ),
      ),
    );
  }

  ElevatedButton colorBtn(String colourName, Color colour){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(200,50)
      ),
      onPressed: (){
      Navigator.pop(context, colour);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar( content: Text("$colourName is the new background color now", style: const TextStyle(fontSize: 24),),)
      );
    }, 
    child: Text(colourName, style: TextStyle(color: colour, fontSize: 25, fontWeight: FontWeight.w900),));
  }
}