import 'package:flutter/material.dart';
import 'package:flutter_app/AnimationPage.dart';
import 'package:flutter_app/AnimationWidgetPage.dart';
import 'package:flutter_app/AppBarPage.dart';
import 'package:flutter_app/CardItem.dart';
import 'package:flutter_app/CardPage.dart';
import 'package:flutter_app/ExpandItemPage.dart';
import 'package:flutter_app/ExpansionPanelListPage.dart';
import 'package:flutter_app/FilePage.dart';
import 'package:flutter_app/LayoutDemo.dart';
import 'package:flutter_app/ListModel.dart';
import 'package:flutter_app/MethodPage.dart';
import 'package:flutter_app/Page.dart';
import 'package:flutter_app/ProgressBarPage.dart';
import 'package:flutter_app/RefreshListViewPage.dart';
import 'package:flutter_app/SecondPage.dart';
import 'package:flutter_app/SharedAnimationPage.dart';
import 'package:flutter_app/SliverAppBarPage.dart';
import 'package:flutter_app/StackDemo.dart';
import 'package:flutter_app/TabLayoutBarPage.dart';
import 'package:flutter_app/GridDemo.dart';
import 'package:flutter_app/TextFieldPage.dart';
import 'package:flutter_app/TooltipPage.dart';
import 'package:flutter_app/ViewPage.dart';
import 'package:flutter_app/WrapChipDeletePage.dart';
import 'package:flutter_app/WrapFlowWidgetPage.dart';


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
          Page(1, "AppBarTab", Icons.tab),
          Page(2, "NetWork", Icons.network_cell),
          Page(3, "Expand", Icons.expand_more),
          Page(4, "TabLayout", Icons.tablet),
          Page(5, "LayoutDemo", Icons.label),
          Page(6, "GridView", Icons.grid_on),
          Page(7, "Stack", Icons.star),
          Page(8, "Card", Icons.credit_card),
          Page(9, "TextField", Icons.text_fields),
          Page(10, "File", Icons.file_download),
          Page(11, "MethodChannel", Icons.merge_type),
          Page(12, "ProgressBar", Icons.space_bar),
          Page(13, "RefreshListView", Icons.view_list),
          Page(14, "Animation", Icons.looks),
          Page(15, "AnimationWidget", Icons.android),
          Page(16, "SharedAnimation", Icons.star),
          Page(17, "SliverAppBar", Icons.info),
          Page(18, "Wrap", Icons.wrap_text),
          Page(19, "Tooltip", Icons.delete),
          Page(20, "WrapChipDelete", Icons.delete),
          Page(21, "ExpansionPanelList", Icons.expand_more),
          Page(22,"View",Icons.view_list)
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
        switch (index) {
          case 0:
            _toNavigator(context, AppBarPage());
            break;
          case 1:
            _toNavigator(context, SecondPage('Second'));
            break;
          case 2:
            _toNavigator(context, ExpandItemPage());
            break;
          case 3:
            _toNavigator(context, TabLayoutBarPage());
            break;
          case 4:
            _toNavigator(context, LayoutDemo());
            break;
          case 5:
            _toNavigator(context, GridDemo());
            break;
          case 6:
            _toNavigator(context, StackDemo());
            break;
          case 7:
            _toNavigator(context, CardPage());
            break;
          case 8:
            _toNavigator(context, TextFieldPage());
            break;
          case 9:
            _toNavigator(context, FilePage());
            break;
          case 10:
            _toNavigator(context, MethodPage());
            break;
          case 11:
            _toNavigator(context, ProgressBarPage());

            break;
          case 12:
            _toNavigator(context, RefreshListViewPage());
            break;
          case 13:
            _toNavigator(context, AnimationPage());
            break;
          case 14:
            _toNavigator(context, AnimationWidgetPage());
            break;
          case 15:
            _toNavigator(context, SharedAnimationPage());
            break;
          case 16:
            _toNavigator(context, SliverAppBarPage());
            break;
          case 17:
            _toNavigator(context, WrapFlowWidgetPage());
            break;
          case 18:
            _toNavigator(context, TooltipPage());
            break;
          case 19:
            _toNavigator(context, WrapChipDeletePage());
            break;
          case 20:
            _toNavigator(context, ExpansionPanelListPage());
            break;
          case 21:
            _toNavigator(context, ViewPage());
            break;
          default:
        };
        setState(() {
          _selectedItem = _selectedItem == index ? null : index;
        });
      },);
  }

  _toNavigator(BuildContext context, Widget statelessWidget) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => statelessWidget));
  }

  Widget _buildRemoveItem(BuildContext context, int index,
      Animation animation) {
    return new CardItem(
      animation: animation, item: _list[index], selected: false,);
  }

  void _insert() {
    _list.insert(_selectedItem + 1,
        Page(_nextItem++, "Other" + _nextItem.toString(), Icons.devices_other));
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_selectedItem);
    }
    setState(() {
      _selectedItem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
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
                ),
                new Row(
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