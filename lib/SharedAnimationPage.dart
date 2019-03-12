import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SharedAnimationSecondPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("SharedAnimation",
              style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true),
      body: GestureDetector(
        child: Center(
          child: Hero(tag: 'hero', child: Image.asset('images/bg.jpg')),
        ),
        onTap: () {
          Navigator.of(context).pop(this);
        },
      ),
    );
  }

}

class SharedAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "SharedAnimationSecondPage",
            style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SharedAnimationSecondPage()));
        },
        child: Center(
          child: Hero(tag: 'hero', child: SizedBox(
            width: 150.0,
            child: Image.asset('images/bg.jpg'),
          )),
        ),
      ),
    );
  }

}