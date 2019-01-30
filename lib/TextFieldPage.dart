import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextFieldPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title:
          Text("TextField",
              style: TextStyle(color: Colors.white, fontSize: 24.0,)),
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white),

        ),
        body: TextFieldState()
    );
  }

}

class TextFieldState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFiledChild();
  }
}

class _TextFiledChild extends State<TextFieldState> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _userNameFocusNode = FocusNode();
  var _isChecked = true;
  var _value = 1;
  final String USERNAME = "username";


  void clear() {
    setState(() {
      _userNameController.text = "";
      _passwordController.text = "";
    });
  }

  void changeCheck(bool check) {
    setState(() {
      _isChecked = check;
    });
  }

  void changeRadio(int value) {
    setState(() {
      _value = value;
    });
  }

  void changeSwitch(bool check) {
    setState(() {
      _isChecked = check;
    });
  }

  void setUserName(String name) {
    setState(() {
      _userNameController.text = name;
      _userNameFocusNode.unfocus();
    });
  }

  void save() async {
    SharedPreferences saveShared = await SharedPreferences.getInstance();
    saveShared.setString(USERNAME, _userNameController.text.toString());
  }

  Future<String> get() async {
    SharedPreferences getShared = await SharedPreferences.getInstance();
    return getShared.getString(USERNAME);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        TextField(
          controller: _userNameController,
          keyboardType: TextInputType.number,

          decoration: InputDecoration(
              labelText: "输入手机号",
              helperText: "账号Account",
              contentPadding: EdgeInsets.all(10.0),
              icon: Icon(Icons.phone, color: Theme
                  .of(context)
                  .primaryColor,)
          ),
          onChanged: (String str) {
            print(str);
          },
          onSubmitted: (String str) {
            print(str);
          },
          autofocus: false,
          focusNode: _userNameFocusNode,
        ),
        TextField(
            controller: _passwordController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "输入密码",
              helperText: "登录密码",
              contentPadding: EdgeInsets.all(10),
              icon: Icon(Icons.lock, color: Theme
                  .of(context)
                  .primaryColor),
            ),
            obscureText: true
        ),
        CheckboxListTile(value: _isChecked,
          onChanged: changeCheck,
          title: Text(
              "自动登录",
              style: TextStyle(fontSize: 12.0, color: Colors.blue)),
          activeColor: Colors.blue,
        ),
        new Row(
            children: <Widget>[
              Radio(value: 0,
                  groupValue: _value,
                  onChanged: changeRadio,
                  activeColor: Colors.blue),
              Radio(value: 1,
                  groupValue: _value,
                  onChanged: changeRadio,
                  activeColor: Colors.blue),
              Radio(value: 2,
                  groupValue: _value,
                  onChanged: changeRadio,
                  activeColor: Colors.blue),
            ]
        ),
        Switch(value: _isChecked,
          onChanged: changeSwitch,
          activeColor: Colors.blue,),
        Divider(height: 24, color: Colors.white,),
        Builder(builder: (BuildContext context) {
          return RaisedButton(onPressed: () {
            if (_userNameController.text.toString() == "yothon" &&
                _passwordController.text.toString() == "qqqqqq") {
              showDialog(context: context,
                  /*child: SimpleDialog(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text("登录dialog"),
                  children: <Widget>[
                    Text("恭喜发财"),
                    Divider(height: 24.0,color: Colors.white)
                  ],
                )*/
                  /*child: AlertDialog(
                  contentPadding: EdgeInsets.all(10.0),
                  title: Text("登录dialog"),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: (){
                    }, child: Text("确定")),

                  ],
                )*/
                  child: AboutDialog(
                    applicationName: "Yothon",
                    applicationVersion: "v1.0",
                    applicationIcon: Icon(
                        Icons.android, color: Colors.blueAccent),
                    children: <Widget>[
                      Text("first App")
                    ],
                  )
              );
            } else {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("登录失败"), backgroundColor: Colors.red));
            }
          },
            child: Text("登录", style: TextStyle(color: Colors.white)),

            color: Theme
                .of(context)
                .primaryColor,
            highlightColor: Colors.lightBlueAccent,
            disabledColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(25.0))
            ),
            padding: EdgeInsets.only(
                left: 40.0, right: 40.0, top: 10, bottom: 10),
          );
        }),
        Builder(builder: (BuildContext context) {
          return RaisedButton(onPressed: () {
//            showBottomSheet(context: null, builder: null)
            showModalBottomSheet(
              context: context, builder: (BuildContext context) {
              return Container(
                child: new Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text("聊天"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text("电话"),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text("帮助"),
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("设置"),
                    ),
                  ],
                ),
              );
            },
            );
          },
            child: Text("showBottomSheet"),
            color: Colors.blue,
            highlightColor: Colors.lightBlueAccent,
            disabledColor: Colors.lightBlue,
          );
        }),
        RaisedButton(onPressed: () {
          save();
        },
          child: Text(
              "存储", style: TextStyle(color: Colors.white, fontSize: 12.0)),
          padding: EdgeInsets.all(10.0),
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
        ),
        RaisedButton(onPressed: () {
          var future = get();
          future.then((String username) {
            setUserName(username);
          });
        },
          child: Text(
              "获取", style: TextStyle(color: Colors.white, fontSize: 12.0)),
          padding: EdgeInsets.all(10.0),
          color: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
        )
      ],
    );
  }
}




