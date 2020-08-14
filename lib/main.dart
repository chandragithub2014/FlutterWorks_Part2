
import 'package:flutter/material.dart';
import './screenflow/home.dart';
import './screenflow/HomeContainer.dart';
import './screenflow/RowColumn.dart';

void main() => runApp(new HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hello Flutter Title",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter App Bar"),
        ),
        body: RowColumn(),
      ),
    );
  }
}
