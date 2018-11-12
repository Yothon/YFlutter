import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String title;

  SecondPage(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new WillPopScope(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            title, style: new TextStyle(color: Colors.white, fontSize: 24.0),),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new ListItem(),
      ),
      onWillPop: () {
        Navigator.pop(context, "Second");
        new Future.value(true);
      },
    );
  }
}

class Post {
  var code;
  var message;
  var data;


  Post({this.code, this.message, this.data});

  factory Post.fromJson(Map<String, dynamic> json){
    return new Post(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }

}


class ListItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _netResult();
  }


}

class _netResult extends State<ListItem> {
  Post post = new Post();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPost();
  }

  fetchPost() async {

    var options = Options(baseUrl: "http://d.xiaoluyy.com/xiaolucrm/",
        connectTimeout: 5000,
        receiveTimeout: 100000,
        headers: {
          "mid": "868238033778652",
          "version": "2.9.4",
          "email": "developer@xiaoluyy.com",
          "vkey": "b7a84594177515bc25856f847f95883b"
        },
        // Transform the response data to a String encoded with UTF8.
        // The default value is [ResponseType.JSON].
        responseType: ResponseType.PLAIN);

    Dio dio = new Dio(options);
    Response response = await dio.post("sea/seaToastMessage");
    print(response.data);
    setState(() {
      post = Post.fromJson(json.decode(response.data));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getBody(),
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return Center(child: CircularProgressIndicator(),);
    } else {
      return Container(
        child: Text(post.data,),
        margin: EdgeInsets.all( 12.0),
      );
    }
  }

  bool showLoadingDialog() {
    if (post.code == null) {
      return true;
    } else {
      return false;
    }
  }
}


