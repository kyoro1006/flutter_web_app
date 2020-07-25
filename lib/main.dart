import 'package:flutter/material.dart';
import 'package:flutter_web_app/main.dart';
import 'package:flutter_web_app/top/top_page.dart';

import 'common/cn_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debag表示消す
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'KBOYのFlutter大学サロン',
            ),
            Text('管理者用'),
            RaisedButton(
              child: Text("ログインする"),
              padding: EdgeInsets.all(20.0),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {
                CnWidget.sSalonName = "KBOYのFlutter大学サロン";
                CnWidget.sLoginName = "Kboy";
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TopPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
