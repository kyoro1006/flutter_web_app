import 'package:flutter/material.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/top/top_page.dart';

/// 共通的に表示するWidget部品
/// ヘッダー、左ナビ、ドロワーメニュー
class CnWidget extends StatelessWidget {
  static String sSalonName = "";
  static String sLoginName = "";

  /// ヘッダー
  static Widget headerwidget(bool isMobile, BuildContext context,
      GlobalKey<ScaffoldState> _scaffoldKey) {
    if (isMobile) {
      return Positioned(
        left: 0,
        top: 0,
        right: 0,
        child: Container(
          color: Colors.grey[200],
          height: 45,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
              ),
              Text("$sSalonName　管理者画面"),
            ],
          ),
        ),
      );
    } else {
      return Container(); // Empty Container Widget
    }
  }

  /// 左ナビ
  static Widget leftmenuwidget(bool isMobile, BuildContext context) {
    if (!isMobile) {
      return Positioned(
        left: 0,
        top: 0,
        width: 300,
        child: Container(
          //width: 300,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[200],
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TopPage()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 15.0, right: 10.0),
                  width: 300,
                  color: Colors.black54,
                  child: Text(
                    '$sSalonName\n管理者画面',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 30.0, bottom: 20.0, left: 10.0, right: 10.0),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '$sLoginNameさん',
                        style: TextStyle(fontSize: 22),
                      ),
                      leading: Icon(Icons.person),
                    ),
                    ListTile(
                      title: Text(
                        'お知らせ設定',
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('管理者設定'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50.0),
                width: 150,
                child: RaisedButton(
                  padding: EdgeInsets.all(20.0),
                  child: Text("ログオフ"),
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(); // Empty Container Widget
    }
  }

  /// ドロワーメニュー
  static Widget drawer(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopPage()),
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 15.0, right: 10.0),
                width: 300,
                color: Colors.black54,
                child: Text(
                  '$sSalonName\n管理者画面',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: Text(
                '$sLoginNameさん',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('お知らせ設定'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('管理者設定'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 50.0),
              child: SizedBox(
                width: 100,
                child: RaisedButton(
                  padding: EdgeInsets.all(20.0),
                  child: Text("ログオフ"),
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
