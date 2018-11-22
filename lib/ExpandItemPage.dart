import 'package:flutter/material.dart';

class ExpandItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ExpandTitle'),
        ),
        body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) => new EntryItem(
              data[index]), itemCount: data.length,),
      ),
    );
  }

}

class Entry {
  final String title;
  final List<Entry> list;

  Entry(this.title, [this.list = const <Entry>[]]);

}

final List<Entry> data = <Entry>[
  new Entry(
      'Chapter A',
      <Entry>[
        Entry(
            'Section A0',
            <Entry>[
              Entry('Item0'),
              Entry('Item1'),
              Entry('Item2')
            ]
        )
      ]
  ),
  new Entry(
      'Chapter B',
      <Entry>[
        Entry('SectionB0'),
        Entry(
            'Section B1',
            <Entry>[
              Entry('Item0'),
              Entry('Item1'),
              Entry('Item2')
            ]
        )
      ]
  ),
  new Entry(
      'Chapter C',
      <Entry>[
        Entry('SectionC0'),
        Entry(
            'Section C1',
            <Entry>[
              Entry('Item0',
              <Entry>[
                Entry('ChildItem0')
              ]
              ),
              Entry('Item1'),
              Entry('Item2')
            ]
        )
      ]
  )

];


class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTile(Entry root) {
    if (root.list.isEmpty) {
      return ListTile(title: Text(root.title));
    } else {
      return ExpansionTile(
          key: PageStorageKey<Entry>(root),
          title: Text(root.title),
          children: root.list.map(_buildTile).toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTile(entry);
  }

}