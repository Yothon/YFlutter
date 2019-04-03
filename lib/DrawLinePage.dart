import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart' as ui;
import 'package:flutter/services.dart' as ui;
import 'package:flutter/widgets.dart' as ui;
import 'package:flutter/material.dart' as ui;
import 'package:flutter/painting.dart' as ui;
import 'dart:ui' as flutterui;

class DrawLinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Path",
          style: TextStyle(color: Colors.white54),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: DrawLineState(),
    );
  }
}

class DrawLineState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawLineItem();
  }
}

class DrawLineItem extends State<DrawLineState> {
  var image;
  @override
  void initState() {
    super.initState();
    ImageLoader.load("images/bg.jpg").then((image){
      setState(() {
        this.image =image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: CustomPaint(painter: DrawLineView(image)));
  }
}

class DrawLineView extends CustomPainter {
  var image;

  DrawLineView(this.image);

  Paint _paint = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 4.0
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..color = Colors.blueAccent;

    Paint _paint2 = Paint()
    ..isAntiAlias = true
    ..strokeWidth = 4.0
    ..style = PaintingStyle.fill
    ..strokeCap = StrokeCap.round
    ..color = Colors.black;

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(140, 40);
    path.relativeMoveTo(0, 20);
    path.lineTo(100, 200);
    path.relativeLineTo(30, 30);
    Rect rect = Rect.fromCircle(
        center: Offset(path.getBounds().left, path.getBounds().bottom),
        radius: 30);
    path.arcTo(rect, 0, 3.1415926 / 2, false);
    canvas.drawPath(path, _paint);
    Path path3 =Path();
    var width = 300;
    var height = 400;
    path3.moveTo(width / 2, height / 4);
    path3.cubicTo((width * 6) / 7, height / 9, (width * 12) / 13,
        (height * 2) / 5, width / 2, (height * 7) / 12);
    canvas.drawPath(path3, _paint2);
    Path path2 = Path();
    path2.moveTo(width / 2, height / 4);
    path2.cubicTo(width / 7, height / 9, width / 13, (height * 2) / 5,
        width / 2, (height * 7) / 12);
    canvas.drawPath(path2, _paint2);

    Path path4 =Path();
    path4.lineTo(100, 0);
    path4.lineTo(0, 100);
    path4.close();
    canvas.drawPath(path4, _paint2);
    Path path5 =Path();
    path5.moveTo(200,0);
    path5.lineTo(200, 100);
    path5.lineTo(100, 0);
    path5.close();
    canvas.drawPath(path5, _paint2);
    Path path6 =Path();
    path6.moveTo(0, 400);
    path6.lineTo(0, 600);
    path6.lineTo(200, 600);
    path6.close();
    canvas.drawPath(path6, _paint2);
    Path path7 =Path();
    path7.arcTo(Rect.fromCircle(center:Offset(200, 300),radius: 50), 0, 3.1415926*2, false);
    canvas.drawPath(path7, _paint);
    // canvas.drawImage(image, Offset(100, 100), _paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class ImageLoader{
  static ui.AssetBundle getAssetBundle() => (ui.rootBundle != null)
      ? ui.rootBundle
      : new ui.NetworkAssetBundle(new Uri.directory(Uri.base.origin));
  static Future<flutterui.Image> load(String url) async {
    ui.ImageStream stream = new ui.AssetImage(url, bundle: getAssetBundle())
        .resolve(ui.ImageConfiguration.empty);
    Completer<flutterui.Image> completer = new Completer<flutterui.Image>();
    void listener(ui.ImageInfo frame, bool synchronousCall) {
      final flutterui.Image image = frame.image;
      completer.complete(image);
      stream.removeListener(listener);
    }

    stream.addListener(listener);
    return completer.future;
  }
}
