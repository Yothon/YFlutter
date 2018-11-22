import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AppBarPageDemo();
  }

}

class _AppBarPageDemo extends State<AppBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: list.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) {
      return;
    }
    _tabController.animateTo(newIndex);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
            title: const Text('AppBar Demo'),
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
              _nextPage(-1);
            }),
            actions: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {
                _nextPage(1);
              })
            ],
            bottom: new PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: Container(height: 48.0,
                    alignment: Alignment.center,
                    child: TabPageSelector(controller: _tabController))))),
        body: TabBarView(
            controller: _tabController,
            children: list.map((Choice choice){
              return new Padding(padding: EdgeInsets.all(16.0),child: ChoiceCard(choice: choice,),);
            }).toList()
        ),
      ),
    );
  }

}

/*class _AppBarPageDemo extends State<AppBarPage> {
  Choice _choice = list[0];

  void _select(Choice choice) {
    setState(() {
      _choice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: const Text('AppBar Demo'),
          actions: <Widget>[
            new IconButton(icon: Icon(list[0].iconData), onPressed: () {
              _select(list[0]);
            }),
            IconButton(icon: Icon(list[1].iconData), onPressed: () {
              _select(list[1]);
            }),
            new PopupMenuButton<Choice>(itemBuilder: (BuildContext context) {
              return list.skip(2).map((Choice choice) {
                return new PopupMenuItem(
                  child: Text(choice.title), value: choice,);
              }).toList();
            })
          ],
        ),
        body: Padding(padding: const EdgeInsets.all(16.0), child:ChoiceCard(choice: _choice,),),
      ),
    );
  }

}*/

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) :super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.iconData, size: 128.0, color: textStyle.color,),
            Text(choice.title, style: textStyle,)
          ],
        ),
      ),
    );
  }

}

class Choice {
  final String title;
  final IconData iconData;

  const Choice({this.title, this.iconData});

}

const List<Choice> list = const <Choice>[
  const Choice(title: "Car", iconData: Icons.directions_car),
  const Choice(title: "Bus", iconData: Icons.directions_bus),
  const Choice(title: "Bicycle", iconData: Icons.directions_bike),
  const Choice(title: "Train", iconData: Icons.directions_railway),
  const Choice(title: "Walk", iconData: Icons.directions_walk),
];

