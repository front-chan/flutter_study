import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class HomeScreenToons extends StatelessWidget {
  const HomeScreenToons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.teal[300],
        foregroundColor: Colors.black, // 글씨 색상
        title: const Text(
          "Today's 툰s",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
