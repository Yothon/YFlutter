import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WrapFlowWidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Wrap", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Wrap(
          spacing: 10.0,
          direction: Axis.horizontal,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceBetween,
          children: <Widget>[
            MyButton("label1"),
            MyButton("label2"),
            MyButton("label3"),
            MyButton("label4"),
            MyButton("label5"),
            MyButton("label6"),
            MyButton("label7"),
            MyButton("label8"),
            MyButton("label9"),
            MyButton("label10"),
            MyButton("label11"),
          ],
        ),
      )
    );
  }

}

class MyButton extends StatelessWidget {
  final String text;


  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        child: Text(text, style: TextStyle(color: Colors.lightBlueAccent)),
        shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        borderSide: BorderSide(
          color: Colors.lightBlueAccent,
          width: 2.0,
          style: BorderStyle.solid
        ),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(text),
            action: SnackBarAction(label: "确定", onPressed: () {

            }),));
        });
  }

  MyButton(this.text);

}