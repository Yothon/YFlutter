import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/DrawLinePage.dart';

class ViewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ViewState(),
    );
  }

}

class ViewState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewItem();
  }

}

class ViewItem extends State<ViewState> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(40),
          child: CustomPaint(painter: MyView()),
        ),
        RaisedButton(onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DrawLinePage()));
        }, child: Text("Path"),)
      ],
    );
  }

}

class MyView extends CustomPainter {

  Paint _paint = Paint()
    ..color = Colors.blueAccent
    ..strokeCap = StrokeCap.round
//    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 5.0;

  Paint _redPaint = Paint()
    ..color = Colors.redAccent
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 5.0;

  double PI = 3.1415926;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-30.0, -30.0), Offset(30.0, -30.0), _paint);
    canvas.drawLine(Offset(30, -30), Offset(30, 30), _paint);
    canvas.drawLine(Offset(30, -30), Offset(30, 30), _paint);
    canvas.drawLine(Offset(30, 30), Offset(-30, 30), _paint);
    canvas.drawLine(Offset(-30, 30), Offset(-30, -30), _paint);
    canvas.drawPoints(PointMode.points, [
      Offset(20, 20),
      Offset(100.0, 100.0),
      Offset(100.0, 200.0),
      Offset(200.0, 200.0),
      Offset(200.0, 100.0),
      Offset(280.0, 20.0),
      Offset(20, 20),
    ], _paint);
    canvas.drawOval(Rect.fromLTRB(40, 260, 200, 340), _paint);
    canvas.drawOval(Rect.fromPoints(Offset(140, 100), Offset(100, 80)), _paint);
    canvas.drawCircle(Offset(150, 100), 40, _paint);
    canvas.drawOval(Rect.fromLTWH(0, 360, 300, 100), _paint);
    Rect rect = Rect.fromPoints(Offset(40, 40), Offset(200, 200));
    canvas.drawArc(rect, 0, PI / 6, false, _redPaint);
    Rect rect2 = Rect.fromCircle(center: Offset(100, 100), radius: 60);
    RRect rRect = RRect.fromRectAndRadius(rect2, Radius.circular(60));
    canvas.drawRRect(rRect, _redPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
