import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Text('Hello Chan!'),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false, // 가운데 정렬 해제
          elevation: 0, // 그림자 표시
          title: Text('Hello flutter!'),
          // backgroundColor: Color(Color(0, 0, 0)),
        ),
        body: Center(
          child: Text('Hello Chan!'),
        ),
      ),
    );
  }
}
