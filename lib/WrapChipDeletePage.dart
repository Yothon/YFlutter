import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WrapChipDeletePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WrapChipState();
  }

}

class WrapChipState extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return WrapChipItem();
  }

}

class WrapChipItem extends State<WrapChipState> {
  List<Item> list = List<Item>();
  int count = 0;

  _addItem() {
    setState(() {
      list.add(Item(item: WrapItem((count++).toString(), Icons.add),
          callBack: _removeItem));
    });
  }

  void _removeItem() {
    setState(() {
      if (list.length > 0) {
        list.removeAt(list.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WrapChip", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 16.0),
            child: Builder(builder: (BuildContext context) {
              return GestureDetector(
                  child: Icon(Icons.add, color: Colors.white),
                  onTap: () {
                    _addItem();
                  });
            }),
          )
        ],
      ),
      body: Wrap(
        spacing: 10.0,
        direction: Axis.horizontal,
        textDirection: TextDirection.ltr,
        children: list,
      ),
    );
  }

}

class Item extends StatelessWidget {

  final WrapItem item;
  @required VoidCallback  callBack;

  Item({this.item, this.callBack});

  @override
  Widget build(BuildContext context) {
    var title = item.title;
    var icon = item.iconData;
    return Chip(
        label: Text("flutter:$title", style: TextStyle(color: Colors.white),),
        deleteIcon: Icon(Icons.delete),
        avatar: Icon(icon, color: Colors.white,),
        deleteIconColor: Colors.redAccent,
        backgroundColor: Colors.lightBlueAccent,
        onDeleted: callBack);
  }

}


class WrapItem {
  final String title;
  final IconData iconData;

  WrapItem(this.title, this.iconData);

}

