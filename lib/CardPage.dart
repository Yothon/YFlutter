
import 'package:flutter/material.dart';

class CardPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        title: Text("Card",style: TextStyle(color: Colors.white),),
      ),
      body: SizedBox(
        height: 220.0,
        child: Card(
          margin: EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text('903 Floor',style: TextStyle(fontWeight: FontWeight.w500),),
                subtitle: Text('My City 10086'),
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.blue[500],
                ),
              ),
              Divider(),
              ListTile(
                title: Text('1111-1111',style: TextStyle(fontWeight: FontWeight.w500),),
                leading: Icon(Icons.contact_phone,color: Colors.blue[500],),
              ),
              ListTile(
                title: Text('wanyouxin729@gmail.com',style: TextStyle(fontWeight: FontWeight.w500),),
                leading: Icon(Icons.contact_mail,color: Colors.blue[500],),
              )
            ],
          ),
        ),
      ),
    );
  }

}