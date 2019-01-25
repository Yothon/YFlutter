import 'package:flutter/material.dart';
import 'package:flutter_app/AppBarPage.dart';
import 'package:flutter_app/CardItem.dart';
import 'package:flutter_app/CardPage.dart';
import 'package:flutter_app/ExpandItemPage.dart';
import 'package:flutter_app/LayoutDemo.dart';
import 'package:flutter_app/ListModel.dart';
import 'package:flutter_app/Page.dart';
import 'package:flutter_app/SecondPage.dart';
import 'package:flutter_app/StackDemo.dart';
import 'package:flutter_app/TabLayoutBarPage.dart';
import 'package:flutter_app/GridDemo.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CardItemOperation();
  }

}

class CardItemOperation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NavigatorTo();
  }
}


class NavigatorTo extends State<CardItemOperation> {

  Widget userHeader = UserAccountsDrawerHeader(
    accountName: new Text('Yothon'),
    accountEmail: new Text('wanyouxin@xiaoluyy.com'),
    currentAccountPicture: new CircleAvatar(
      radius: 45.0,
      backgroundImage: NetworkImage(
          "http://ph1smmuzc.bkt.clouddn.com/flutter_head.png"),),);
  ListModel listModel;
  GlobalKey<AnimatedListState> globalKey = GlobalKey();
  ListModel<Page> _list;
  int _nextItem;
  int _selectedItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<Page>(
        removeBuilder: _buildRemoveItem,
        listKey: globalKey,
        initialItems: <Page>[
          Page(1, "AppBarTab",Icons.tab),
          Page(2, "NetWork",Icons.network_cell),
          Page(3, "Expand",Icons.expand_more),
          Page(4, "TabLayout", Icons.tablet),
          Page(5,"LayoutDemo",Icons.label),
          Page(6,"GridView",Icons.grid_on),
          Page(7,"Stack",Icons.star),
          Page(8,"Card",Icons.credit_card),
        ]);
    _nextItem = 3;
  }

  Widget _builderItem(BuildContext context, int index,
      Animation<double> animation) {
    return new CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == index,
      onTap: () {
        switch(index){
          case 0:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AppBarPage()));
            break;
          case 1:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage('Second')));
            break;
          case 2:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExpandItemPage()));
            break;
          case 3:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TabLayoutBarPage()));
            break;
          case 4:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LayoutDemo()));
            break;
          case 5:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GridDemo()));
            break;
          case 6:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StackDemo()));
            break;
          case 7:
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardPage()));
            break;
        };
        setState(() {
          _selectedItem = _selectedItem ==index ? null : index;
        });
      },);
  }

  Widget _buildRemoveItem(BuildContext context, int index,
      Animation animation) {
    return new CardItem(animation: animation, item: _list[index], selected: false,);
  }

  void _insert() {
      _list.insert(_selectedItem+1, Page(_nextItem++,"Other"+_nextItem.toString(),Icons.devices_other));
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_selectedItem);
    }
    setState(() {
      _selectedItem=null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[300],
          accentColor: Colors.cyan[500],
        ),
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "Title",
              style: new TextStyle(fontSize: 24.0, color: Colors.white),),
            centerTitle: true,
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.add_circle, color: Colors.white,),
                onPressed: _insert,
                tooltip: "insert a new item",),
              IconButton(icon: Icon(Icons.remove_circle, color: Colors.white,),
                onPressed: _remove,
                tooltip: "remove the selected Item",)
            ],
            iconTheme: new IconThemeData(color: Colors.white),
          ),
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                userHeader,
                new Row(
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.home),
                      onPressed: () {},
                      alignment: Alignment.center,),
                    new Text('北京',
                      style: new TextStyle(
                          color: Colors.black, fontSize: 14.0),)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.work),
                      onPressed: () {},
                      alignment: Alignment.center,),
                    new Text('小鹿医馆',
                      style: new TextStyle(
                          color: Colors.black, fontSize: 14.0),)
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.phone),
                      onPressed: () {},
                      alignment: Alignment.center,),
                    new Text('15309601517',
                      style: new TextStyle(
                          color: Colors.black, fontSize: 14.0),)
                  ],
                ),


                new Row(
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.web),
                      onPressed: () {},
                      alignment: Alignment.center,),
                    new Text('https://github.com/Yothon',
                      style: new TextStyle(
                          color: Colors.black, fontSize: 14.0),)
                  ],
                ), new Row(
                  children: <Widget>[
                    new IconButton(icon: Icon(Icons.message),
                      onPressed: () {},
                      alignment: Alignment.center,),
                    new Text('My first flutter',
                      style: new TextStyle(
                          color: Colors.black, fontSize: 14.0),)
                  ],
                ),

              ],
            ),
          ),
          body: new Center(
              child: new Padding(padding: const EdgeInsets.all(16.0),
                child: new AnimatedList(itemBuilder: _builderItem,
                  initialItemCount: _list.length,
                  controller: ScrollController(keepScrollOffset: true),
                  key: globalKey,),
              )
          ),
          bottomNavigationBar: new BottomNavigationBar(items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text('首页')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: new Text('设置'))
          ],
            onTap: (int index) {},
          ),
        )
    );
  }

}


void main() =>
    runApp(new MyApp(
    ));