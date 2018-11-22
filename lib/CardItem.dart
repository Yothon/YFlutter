import 'package:flutter/material.dart';
import 'package:flutter_app/Page.dart';

class CardItem extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final Page item;
  final bool selected;


  @override
  Widget build(BuildContext context) {
    Color primarie;
    if (selected) {
      primarie = Colors.primaries[item.index%Colors.primaries.length];
    }
    return new Padding(padding: const EdgeInsets.all(2.0),
        child: new SizeTransition(
          sizeFactor: animation, axis: Axis.vertical, child:new GestureDetector(
            onTap: onTap,
            behavior: HitTestBehavior.opaque,
            child: new SizedBox(
              height: 120.0,
              child: new Card(
                color: primarie,
                child: new Row(children: <Widget>[
                  Icon(item.icon),
                  SizedBox(width: 10.0),
                  Text('${item.title}',style: TextStyle(color: Colors.black,fontSize: 20.0),)
                ],mainAxisAlignment: MainAxisAlignment.center,),
              ),
            ),
        ),));
  }

  const CardItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false,
  }):
  assert(animation!=null),
  assert(item!=null),
  assert(selected!=null),super(key:key);


}