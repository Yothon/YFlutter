import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.animation,
    this.onTap,
    @required this.item,
    this.selected: false
  })
      :assert(animation != null),
        assert(item != null),
        assert(selected != null),
        super(key: key)
  ;

  final Animation<double> animation;
  final VoidCallback onTap;
  final int item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle display12 = Theme
        .of(context)
        .textTheme
        .display1;
    if (selected) {
      display12.copyWith(color: Colors.lightBlueAccent[300]);
    }
    return new Padding(padding: const EdgeInsets.all(2.0),
    child: new SizeTransition(sizeFactor: animation,axis: Axis.vertical,
    child: new GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: new SizedBox(
        height: 120.0,
        child: new Card(
          color: Colors.primaries[item%Colors.primaries.length],
          child: new Center(
            child: Text('Item $item',style: display12,),
          ),
        ),
      ),
    ),
    ),
    );
  }
}