import 'package:flutter/material.dart';

class ListModel<E> {

  final dynamic removeBuilder;
  final GlobalKey<AnimatedListState> listKey;
  final List<E> _list;

  ListModel({
    @required this.removeBuilder,
    @required this.listKey,
    Iterable<E> initialItems
  })
      :assert(removeBuilder != null),
        assert(listKey != null),
        _list = new List.from(initialItems ?? <E>[]);

    AnimatedListState get _animationList => listKey.currentState;

    void insert(int index,E item){
      _list.insert(index, item);
      _animationList.insertItem(index);
    }

    E removeAt(int index){
        _animationList.removeItem(index, (BuildContext context,Animation<double> animation){
          return removeBuilder(context,index,animation);
        });
    }

    int get length => _list.length;
    E operator[](int index) => _list[index];
    int indexOf(E item) => item==null?-1:_list.indexOf(item);

}