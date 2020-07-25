import 'package:flutter/material.dart';
import 'package:flutter_web_app/common/cn_widget.dart';

/// TOPページ
class TopPage extends StatelessWidget {
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
    bool isMobile = MediaQuery.of(context).size.width < 800; //800px以下はモバイル表示
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CnWidget.drawer(context),
      body: Stack(
        children: [
          mainwidget(isMobile, context),
          CnWidget.headerwidget(isMobile, context, _scaffoldKey),
          CnWidget.leftmenuwidget(isMobile, context),
        ],
      ),
    );
  }

  /// メイン部
  Widget mainwidget(bool isMobile, BuildContext context) {
    if (!isMobile) {
      return Positioned(
        left: 300,
        top: 0,
        right: 0,
        child: Container(
          //width: MediaQuery.of(context).size.width - 300,
          height: MediaQuery.of(context).size.height,
          //color: Colors.lightGreenAccent,
          color: Colors.white,
          child: SingleChildScrollView(
            child: mainbodywidget(isMobile, context),
          ),
        ),
      );
    } else {
      return Positioned(
          left: 0,
          top: 45,
          right: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: SingleChildScrollView(
              child: mainbodywidget(isMobile, context),
            ),
          ));
      ; // Empty Container Widget
    }
  }

  /// メイン部(ここを変更してください)
  /// isMobile  true = 800pxより画面幅が小さい
  Widget mainbodywidget(bool isMobile, BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('中央部分は長くなったらスクロールします'),
          Container(
            color: Colors.amber,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
          ),
          Container(
            color: Colors.amber,
            height: 200,
          ),
          Container(
            color: Colors.blue,
            height: 200,
          ),
        ],
      ),
    );
  }
}
