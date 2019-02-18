import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("ProgressBar", style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: ProgressBarState()
    );
  }

}

class ProgressBarState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _progressItem();

}

class _progressItem extends State<ProgressBarState> {
  double currentProgressBar = 0;
  int progress = 0;

  _addChangeProgress() {
    setState(() {
      currentProgressBar =
      currentProgressBar <= 0.9 ? currentProgressBar + 0.1 : 1;
      progress = int.parse((currentProgressBar * 100).toStringAsFixed(0));
      ;
    });
  }

  _subChangeProgress() {
    setState(() {
      currentProgressBar =
      currentProgressBar > 0.1 ? currentProgressBar - 0.1 : 0;
      progress = int.parse((currentProgressBar * 100).toStringAsFixed(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
            alignment: Alignment.center,
            child: Text(
              "当前进度：$progress", style: TextStyle(fontSize: 16),)
        ),
        LinearProgressIndicator(
          value: currentProgressBar,
        ),
        Divider(height: 16, color: Colors.white),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _addChangeProgress();
              },
              child: Text(
                  "add", style: TextStyle(fontSize: 16, color: Colors.white)),
              color: Colors.lightBlueAccent,
            ),
            RaisedButton(onPressed: () {
              _subChangeProgress();
            },
              child: Text(
                  "sub", style: TextStyle(fontSize: 16, color: Colors.white)),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
        Divider(height: 16,color: Colors.white,),
        Center(
          child: CircularProgressIndicator(
              strokeWidth: 2.0,
              valueColor: AlwaysStoppedAnimation(Colors.blue)),
        )
      ],
    );
  }

}