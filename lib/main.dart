import 'package:flutter/material.dart';
import 'package:flutter_box/view/qrcode.dart';

String _title = "Flutter.Box";
Map<String, WidgetBuilder> _routes = {
  "qrcode": (BuildContext context) => new QrcodeApp(),
};

void main() {
  runApp(DemoApp());
  /*
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }*/
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Colors.blue, brightness: Brightness.light),
      routes: _routes,
      home: new DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    List _menuList = ["二维码"];

    var mListView = new ListView.builder(
      itemBuilder: (context, index) {
        return new Card(
          child: new FlatButton(
            child: new Text(_menuList[index]),
            onPressed: () {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, "qrcode");
                  break;
                default:
                  print("default");
              }
              print(_menuList[index]);
            },
          ),
        );
      },
      itemCount: _menuList.length,
    );

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          ///这个title是一个Widget
          title: new Text(_title),
        ),
        body: mListView);
  }
}
