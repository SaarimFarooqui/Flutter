import 'package:flutter/material.dart';
import 'package:meal_picker_app/meal.dart';

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
  mealGroup item = mealGroup(mealName: "", mealPrice: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 69, 5, 0),
        title: Text("Meal Selection App", style: TextStyle(fontFamily: "Playfultime",color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),),
        shape: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 2
          )
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 69, 5, 0), Colors.red], begin: Alignment.topCenter, end: Alignment.bottomCenter)
        ),
        child: ListView(
          children: [
            listbox(item.mealName, item.mealPrice)
          ]
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ElevatedButton(
              onPressed: (){
                pushTomealSelector();
              }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red
              ),child: Text("Select meal", style: TextStyle(color: Colors.white),),)],
          ),
        ),
      ),
    );
  }
  Container listbox(String mealName, String mealPrice){
    String st;
    if (mealName == ""){
      st = "No item selected";
    }else{
      st = "Meal name: $mealName";
    }
    return Container(
      height: 70,
      width: 200,
      margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(st, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
          Text(mealPrice, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),)
        ],
      ),
    );
  }
  void pushTomealSelector()async{
     mealGroup newitem;
     newitem = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => mealselect(item: item,)));
     setState(() {
       item = newitem;
     });
  }
}

