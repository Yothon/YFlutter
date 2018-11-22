import 'package:flutter/material.dart';

class TabLayoutBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: list.length, child: Scaffold(
        appBar: AppBar(
          title: Text('TabLayout'),
          bottom: TabBar(tabs: list.map((Choice choice){
            return Tab(
              text: choice.title,
              icon: Icon(choice.icon),
            );
          }).toList()),
        ),
        body: TabBarView(children: list.map((Choice choice){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: TabItem(choice: choice,),
          );
        }).toList()),
      )
      ),
    );
  }
}

class Choice {
  final String title;
  final IconData icon;

  const Choice({this.title, this.icon});

}

const List<Choice> list = const <Choice>[
  const Choice(title: "Car", icon: Icons.directions_car),
  const Choice(title: "Bus", icon: Icons.directions_bus),
  const Choice(title: "Bike", icon: Icons.directions_bike),
  const Choice(title: "Train", icon: Icons.directions_transit),
  const Choice(title: "Walk", icon: Icons.directions_walk),
  const Choice(title: "Ship", icon: Icons.directions_boat)
];

class TabItem extends StatelessWidget{
  const TabItem({Key key,this.choice}):super(key:key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon),
            Text(choice.title,style: style,)
          ],
        ),
      ),
    );
  }

}
