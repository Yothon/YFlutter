import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: FileState(),
    );
  }

}

class FileState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FileSave();
  }
}

class _FileSave extends State<FileState> {
  TextEditingController _userNameController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  /**
   * 文件存取
   */
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/yothonFile.txt");
  }

  Future<File> save(String name) async {
    final file = await _localFile;
    return file.writeAsString(name);
  }

  Future<String> get() async {
    final file = await _localFile;
    return file.readAsString();
  }

  /**
   * 数据库存取
   */
  Future<String> get _dbPath async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "name.db");
    return path;
  }

  Future<Database> get _localDbFile async {
    var path = await _dbPath;
    var database = await openDatabase(
        path, version: 1, onCreate: (Database db, int version) async {
      db.execute("CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT)");
    });
    return database;
  }

  Future<int> saveDb(String name) async {
    var database = await _localDbFile;
    return database.transaction((trx) {
      trx.rawInsert('INSERT INTO user(name) VALUES("$name")');
    });
  }

  Future<List<Map>> getDb() async {
    var database = await _localDbFile;
    return database.rawQuery('SELECT * FROM user');
  }


  void setUserName(String name) {
    setState(() {
      _userNameController.text = name;
      _focusNode.unfocus();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 16, color: Colors.white),
        TextField(
            controller: _userNameController,
            decoration: InputDecoration(
                labelText: "存储内容",
                icon: Icon(Icons.insert_drive_file),
                contentPadding: EdgeInsets.all(10.0)
            ),
            focusNode: _focusNode
        ),
        Divider(height: 16, color: Colors.white),
        Builder(builder: (BuildContext context) {
          return RaisedButton(onPressed: () {
            var save2 = save(_userNameController.text.toString());
            save2.then((File) {
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("存储成功"),
                  backgroundColor: Colors.lightBlueAccent));
            });
          },
            child: Text("文件存储", style: TextStyle(color: Colors.white)),
            color: Theme
                .of(context)
                .primaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
          );
        }),
        Builder(builder: (BuildContext context) {
          return RaisedButton(
            onPressed: () {
              var getStr = get();
              getStr.then((string) {
                setUserName(string);
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("获取成功"),
                        backgroundColor: Colors.lightBlueAccent));
              });
            },
            child: Text("文件存储", style: TextStyle(color: Colors.white)),
            color: Theme
                .of(context)
                .primaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
          );
        }),
        Divider(height: 16, color: Colors.white),
        Builder(builder: (BuildContext context) {
          return RaisedButton(onPressed: () {
            var saveStr = saveDb(_userNameController.text.toString());
            saveStr.then((file) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("数据库存储成功"),
                  backgroundColor: Colors.lightBlueAccent));
            });
          },
            child: Text("db存储", style: TextStyle(color: Colors.white),),
            color: Theme
                .of(context)
                .primaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
          );
        }),
        Divider(height: 16, color: Colors.white),
        Builder(builder: (BuildContext context) {
          return RaisedButton(onPressed: () {
            Future<List<Map>> db = getDb();
            db.then((List<Map> userNames) {
              var first = userNames.last['name'];
              setUserName("$first");
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("$first"),
                      backgroundColor: Colors.lightBlueAccent));
            });
          },
            child: Text("db获取", style: TextStyle(color: Colors.white)),
            color: Theme
                .of(context)
                .primaryColor,
            shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
            ),
          );
        }),
      ],
    );
  }


}

class Data {
  final int id;
  final String name;

  Data({this.id, this.name});

  factory Data.fromJson(json){
    return Data(id: json['id'], name: json['name']);
  }

}