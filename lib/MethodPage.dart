
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MethodPage extends StatelessWidget{






  @override
  Widget build(BuildContext context) {
    return NetState();
  }

}

class NetState extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NetWork();
  }

}

class _NetWork extends State<NetState>{
  static const platform = const MethodChannel("com.yothon.flutterapp/android");
  static const EventChannel eventChannel = const EventChannel("com.yothon.flutterapp/netChanged");
  var netChangeStr = "点我获取当前网络状态";


  showToast(msg) async{
    try {
      platform.invokeMethod("showToast",{"msg":msg});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent,onError: _onError);
  }

  void _onEvent(Object event){
    setState(() {
      netChangeStr = event;
    });
  }

  void _onError(Object event){
    setState(() {
      netChangeStr = "网络状态获取失败";
    });
  }

  Future<bool> isNetConnection() async{
    bool isConnection;
    try {
      isConnection = await platform.invokeMethod("netConnection");
    } catch (e) {
      print(e);
    }
    return isConnection;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("platformChannels")),body: Center(
      child: RaisedButton(
          child: Text(netChangeStr),
          onPressed: (){
            isNetConnection().then((bool){
              showToast(bool?"网络连接成功":"网络连接失败");
            });
          }),
    ),
    );
  }

}