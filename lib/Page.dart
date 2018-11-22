
import 'package:flutter/material.dart';

class Page {
  final int index;
  final String title;
  IconData mIcon;



  Page(this.index, this.title, this.mIcon)
      :assert(index != null),
        assert(title != null),
        assert(mIcon != null);

  IconData get icon => mIcon;

  set Icon(IconData value){
    mIcon = value;
  }

  String get titleData => title;

  set title(String value) {
    title = value;
  }

  int get indexData => index;

  set index(int value) {
    index = value;
  }


}