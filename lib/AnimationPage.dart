import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class AnimationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimationState();
  }
}

class AnimationState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _animationItem();

}

class _animationItem extends State<AnimationState>
    with SingleTickerProviderStateMixin {
  Animation<double> doubleAnimation; //大小
  AnimationController animationController;
  Animation<double> curvedAnimation; //透明度
  Animation<double> rotateAnimation; //翻转
  Animation<EdgeInsets> moveAnimation; //位移
  Animation<BorderRadius> radiusAnimation; //方变圆
  Animation<Color> colorAnimation;

  double value = 0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 4));
    CurvedAnimation curves = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    curvedAnimation = Tween(begin: 0.1, end: 1.0).animate(curves);
    rotateAnimation = Tween(begin: 0.0, end: math.pi * 2).animate(
        CurvedAnimation(parent: animationController,
            curve: Interval(0.0, 1.0, curve: Curves.ease)));
    radiusAnimation = BorderRadiusTween(
        begin: BorderRadius.circular(0.0),
        end: BorderRadius.circular(100.0)
    ).animate(CurvedAnimation(parent: animationController,
        curve: Interval(0.0, 1, curve: Curves.ease)));
    moveAnimation = EdgeInsetsTween(
        begin: EdgeInsets.only(left: 0.0),
        end: EdgeInsets.only(left: 80.0))
        .animate(CurvedAnimation(parent: animationController,
        curve: Interval(0.2, 0.375, curve: Curves.fastOutSlowIn)));
    colorAnimation = ColorTween(
        begin: Colors.blue[200],
        end: Colors.blue[900]
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
    doubleAnimation = Tween(begin: 0.0, end: 60.0)
        .animate(animationController)
      ..addListener(() {
        setState(() {
          value = doubleAnimation.value;
        });
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.forward:
            print("forward");
            break;
          case AnimationStatus.reverse:
            print("reverse");
            break;
          case AnimationStatus.completed:
            print("completed");
//            animationController.reverse();
            break;
          case AnimationStatus.dismissed:
            print("dismissed");
//            animationController.forward();
            break;
        }
      });
  }

  onAnimationStart() {
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                margin: moveAnimation.value,
                height: value,
                width: value,
                child: FlutterLogo(),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(
                child: GrowTranstion(
                  child: LogoWidget(),
                  animation: curvedAnimation,
                  valueAnimation: doubleAnimation,
                  rotateAnimation: rotateAnimation,
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                height: 60.0,
                width: 60.0,
                alignment: Alignment.center,
                child: Text("radio", style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    border: Border.all(
                        color: Colors.lightBlueAccent,
                        width: 2.0
                    ),
                    borderRadius: radiusAnimation.value
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Center(child: Container(
                  height: 60.0, width: 60.0, color: colorAnimation.value)))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: onAnimationStart,
          child: AnimationText(
              animation: doubleAnimation, color: Colors.white)),
    );
  }

}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
    );
  }

}

class GrowTranstion extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Animation<double> valueAnimation;
  final Animation<dynamic> rotateAnimation;

  GrowTranstion(
      {this.child, this.animation, this.valueAnimation, this.rotateAnimation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          child: child,
          animation: animation, builder: (BuildContext context, Widget child) {
        return Opacity(opacity: animation.value, child: Container(
          transform: Matrix4.identity()
            ..rotateZ(rotateAnimation.value),
          height: valueAnimation.value,
          width: valueAnimation.value,
          child: child,
        ));
      }),
    );
  }

}

class AnimationText extends AnimatedWidget {
  Color color;

  AnimationText({Animation<double> animation, this.color})
      :super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Text(
        animation.value.toInt().toString(), style: TextStyle(color: color));
  }

}