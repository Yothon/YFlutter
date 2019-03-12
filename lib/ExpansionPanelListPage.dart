import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpansionPanelListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanel", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: ExpansionState(),
    );
  }

}

class ExpansionState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ExpansionItem();
  }
}

class ExpandBean {
  var isOpen;
  var index;

  ExpandBean(this.isOpen, this.index);

}

class ExpansionItem extends State<ExpansionState> {

  var currentPanelIndex = -1;
  List<int> list;
  List<ExpandBean> expandList;


  @override
  void initState() {
    super.initState();
    list = List();
    expandList = List();
    for (int i = 0; i < 10; i++) {
      list.add(i);
      expandList.add(ExpandBean(false, i));
    }
  }

  _setCurrentIndex(index,bol){
    setState(() {
      expandList.forEach((item){
        if(item.index==index){
          item.isOpen = !bol;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList.radio(
        children: list.map((index) {
          return ExpansionPanelRadio(headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text("我是第$index个标题"),
            );
          }, body: Padding(padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 100.0,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Icon(Icons.security, size: 35.0,),
            ),

          ), value: index
          );
        }).toList(),
        expansionCallback: (index,bol){
          _setCurrentIndex(index, bol);
        },
      ),
    );
  }

}


