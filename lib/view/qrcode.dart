import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

String _title = "二维码";

class QrcodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Colors.blue, brightness: Brightness.light),
      home: new QrcodePage(),
    );
  }
}

class QrcodePage extends StatefulWidget {
  @override
  _QrcodePageState createState() => _QrcodePageState();
}

class _QrcodePageState extends State<QrcodePage> {
  String _text = "";

  TextField _editText = new TextField();
  var _imageView = QrImage(
    data: "",
    size: 200,
  );

  var _imageViewClick = new FlatButton(child: null, onPressed: scanQrcode);

  void _textOnChanged(String text) {
    setState(() {
      // When user changes what is in the cart, we need to change _shoppingCart
      // inside a setState call to trigger a rebuild. The framework then calls
      // build, below, which updates the visual appearance of the app.
      _text = text;
      _imageView = QrImage(
        data: _text,
        size: 200,
      );
      _imageViewClick =
          new FlatButton(child: _imageView, onPressed: scanQrcode);
    });
  }

  @override
  Widget build(BuildContext context) {
    _editText = new TextField(
      onChanged: _textOnChanged,
    );
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          ///这个title是一个Widget
          title: new Text(_title),
        ),
        body: Column(
          children: <Widget>[_editText, _imageViewClick],
        ));
  }
}

void scanQrcode() {
  //TODO:scanQrcode
}
