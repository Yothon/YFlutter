import 'package:flutter/material.dart';
import 'package:flutter_app/CardItem.dart';
import 'package:flutter_app/ListModel.dart';
import 'package:flutter_app/SecondPage.dart';

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


  final GlobalKey<AnimatedListState> _listKey = new GlobalKey<
      AnimatedListState>();
  ListModel<int> _list;
  int _selectItem;
  int _nextItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = ListModel<int>(
        listKey: _listKey,
        initialItems: <int>[1, 2, 3],
        removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 3;
  }

  Widget _buildItem(BuildContext context, int index,
      Animation<double> animation) {
    return new CardItem(animation: animation, item: index,
      selected: _selectItem == _list[index],
      onTap: () {
        setState(() {
          _selectItem = _selectItem == _list[index] ? null : _list[index];
        });
        Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SecondPage("Sencond")));
      },
    );
  }

  Widget _buildRemovedItem(int item, BuildContext context,
      Animation<double> animation) {
    return new CardItem(animation: animation,
      item: item,
      selected: false,
    );
  }

  void _insert() {
    final int index = _selectItem == null ? _list.length : _list.indexOf(
        _selectItem);
    _list.insert(index+1, _nextItem++);
  }

  void _remove() {
    if (_selectItem != null) {
      _list.removeAt(_list.indexOf(_selectItem));
      setState(() {
        _selectItem = null;
      });
    }
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
              new IconButton(icon: Icon(Icons.add_circle,color: Colors.white,),
                onPressed: _insert,
                tooltip: "insert a new item",),
              IconButton(icon: Icon(Icons.remove_circle,color: Colors.white,),
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
              child: new AnimatedList(itemBuilder: _buildItem,
                key: _listKey,
                initialItemCount: _list.length,),),
          ),
          bottomNavigationBar: new BottomNavigationBar(items: [
            new BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text('首页')),
            new BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: new Text('设置'))
          ],
            onTap: (int index) {
            },
          ),
        )
    );
  }

}


void main() =>
    runApp(new MyApp(
    ));