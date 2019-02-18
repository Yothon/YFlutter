import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RefreshListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("RefreshListView", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: RefreshState(),
    );
  }
}

class RefreshState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _refreshItem();

}

class _refreshItem extends State<RefreshState> {
  List<int> items = List.generate(15, (i) => i);
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isLoadingMore = false;


  Future<Null> _handleRefresh() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      await Future.delayed(Duration(seconds: 2), () {
        setState(() {
          items.clear();
          items = List.generate(15, (i) => i);
          return null;
        });
      });
    }
  }

  Future _getMoreData() async {
    if (!isLoadingMore) {
      setState(() => isLoadingMore = true);
      List<int> newEntries = await makeHttpRequest(
          items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isLoadingMore = false;
      });
    }
  }

  Future<List<int>> makeHttpRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  Widget _buildView() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Opacity(opacity: isLoadingMore ? 1.0 : 0.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(child: ListView.builder(
        itemCount: items.length + 1,
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == items.length) {
            return _buildView();
          } else {
            return ListTile(title: Text("index:$index"));
          }
        }), onRefresh: _handleRefresh);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}