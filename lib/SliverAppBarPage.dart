import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverAppBarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverState(),
    );
  }
}

class SliverState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SliverItem();
  }

}

class SliverItem extends State<SliverState> with TickerProviderStateMixin {
  final List<ListItem> list = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 20; i++) {
      list.add(ListItem("Item:$i", Icons.info));
    }
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,

              title: Text("标题",
                  style: TextStyle(color: Colors.white,
                      fontSize: 16.0
                  )),
              background: Image.asset('images/bg.jpg', fit: BoxFit.fill),
            ),
          ),
          SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: _SliverAppBarDelegate(
              TabBar(
                  controller: TabController(length: 2, vsync: this),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.yellowAccent,
                  tabs: [
                    Tab(icon: Icon(Icons.camera,color: Colors.white,), text: "模块",),
                    Tab(icon: Icon(Icons.settings,color: Colors.white,), text: "设置",)
                  ])
          ))
        ];
      },
      body: Center(
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListItemWidget(list[index]);
            }),
      ),
    );
  }

}

class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem item;

  ListItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(item.title),
        leading: Icon(item.iconData),
      ),
    );
  }

}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(
      color: Colors.lightBlueAccent,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}