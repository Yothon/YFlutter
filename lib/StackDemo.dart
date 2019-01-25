
import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text("Stack",style: TextStyle(color: Colors.white),),
        ),
        body: Stack(
          alignment: const Alignment(0.6, 0.6),
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('images/bg.jpg'),
              radius: 100.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black54
              ),
              child: Text(
                  "Mia B",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  )
              ),
            )
          ],
        ),
      ),
    );
  }


}