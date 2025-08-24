import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 20,
                
                child: Row(
              
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("My name is Saarim")],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}