// Copyright 2016 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';


class GridDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridItem();
  }


}

class _GridItem extends State<GridDemo> {

  Widget buildGrid() {
    return GridView.extent(
      maxCrossAxisExtent: 160.0,
      padding: EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridList(50),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
        title: Text("111",style: TextStyle(color: Colors.white),),
      ),
      body: new Center(
        child: buildGrid(),
      ),
    );
  }

  List<Container> _buildGridList(int i) {
    return new List<Container>.generate(i, (int index) =>
        Container(child: Stack(
          children: <Widget>[
            Container(
              child: Image.asset("images/bg.jpg", fit: BoxFit.cover,),
              height: 160,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 30.0,
                decoration: BoxDecoration(
                  color: Colors.black45
                ),
                padding: EdgeInsets.all(6.0),
                child: Row(
                  children: <Widget>[
                    Text("内容", style: TextStyle(color: Colors.white)),
                    Container(width: 10.0, height: 1),
                    Icon(Icons.star, color: Colors.white, size: 15.0,)
                  ],

                ),
              ),
            )


          ],
        ),
          color: Colors.blue,
        ));
  }

}