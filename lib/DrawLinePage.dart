import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawLinePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Path",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: DrawLineState(),
    );
  }

}

class DrawLineState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DrawLineItem();
  }

}

class DrawLineItem extends State<DrawLineState>{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(painter: DrawLineView())
    );
  }

}


class DrawLineView extends CustomPainter{
  Paint _paint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(40, 40);
    path.lineTo(100, 200);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}