import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('LayoutDemo'),
          ),
          body: ListView(
            children: <Widget>[
              Image.asset('images/bg.jpg',
                width: 600.0,
                height: 240.0,
                fit: BoxFit.fill,
              ),
              new TitleLayout(),
              new ButttonLayout(),
              new ContentLayout()
            ],
          ),
        )

    );
  }
}

class TitleLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(36.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text('Title is me', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black)),
              ),
              Text('Im a content',
                style: TextStyle(color: Colors.grey[500], fontSize: 14.0),)
            ],
          )),
          FavoriteWidget()
        ],
      ),
    );
  }
}

class ButttonLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Column _buildButtonColumn(IconData icon, String tile) {
      Color color = Theme
          .of(context)
          .primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(tile, style: TextStyle(
                color: color, fontWeight: FontWeight.w400, fontSize: 12.0),),
          )
        ],
      );
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
      _buildButtonColumn(Icons.call, "CALL"),
          _buildButtonColumn(Icons.near_me, "ROUTE"),
          _buildButtonColumn(Icons.share, "SHARE")
        ],
      ),
    );
  }

}

class ContentLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Text("Lake Oeschinen lies at the foot of "
          "the Blüemlisalp in the Bernese Alps."
          " Situated 1,578 meters above sea level, "
          "it is one of the larger Alpine Lakes. "
          "A gondola ride from Kandersteg, "
          "followed by a half-hour walk through pastures and pine forest,"
          " leads you to the lake, which warms to 20 degrees Celsius in the summer."
          " Activities enjoyed here include rowing, and riding the summer toboggan run.",
        style: TextStyle(color: Colors.grey[800], fontSize: 14.0),
        softWrap: true,
      ),
    );
  }

}

class FavoriteWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteState();
  }

}

class _FavoriteState extends State<FavoriteWidget>{
  bool _isFavorite = false;
  int _favoriteCount = 10;

  void _changeFavorite(){
    setState(() {
      if(_isFavorite){
        _isFavorite = false;
        _favoriteCount--;
      }else{
        _isFavorite = true;
        _favoriteCount++;
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(icon: _isFavorite?Icon(Icons.star):Icon(Icons.star_border),color: Colors.red[400], onPressed: _changeFavorite),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount',style: TextStyle(color: Colors.black),),
          ),
        )
      ],
    );
  }

}

