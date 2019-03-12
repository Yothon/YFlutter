import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimationWidget", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: AnimatedWidgetState(),
    );
  }

}

class AnimatedWidgetState extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _animateItem();

}


class _animateItem extends State<AnimatedWidgetState> {
  double animValue = 100.0;
  double opacityLevel = 0.0;
  bool _first = true;

  _changeValue() {
    setState(() {
      animValue = animValue == 0 ? 100.0 : 0.0;
      opacityLevel = opacityLevel == 0?1.0:0.0;
      _first = _first == false? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 3),
              curve: Curves.bounceOut,
              child: FlutterLogo(size: 100),
              padding: EdgeInsets.only(bottom: animValue),
            ),
            AnimatedOpacity(opacity: opacityLevel, duration: Duration(seconds: 3),
            child: FlutterLogo(size: 100),
              curve: Curves.linear,
            ),
            AnimatedCrossFade(
                firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal,size: 100.0),
                secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked,size: 200.0,),
                crossFadeState: _first?CrossFadeState.showFirst:CrossFadeState.showSecond,
                duration: Duration(seconds: 3)),
            SizedBox(height: 30.0),
            RaisedButton(
              child: Text("Go"),
              onPressed: _changeValue,
              shape: RoundedRectangleBorder(
                  side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
              ),
            )
          ],
        )
    );
  }

}