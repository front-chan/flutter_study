import 'package:flutter/material.dart';
import 'package:flutter_study/screens/home_screen_toons.dart';

void main() {
  // 콘솔에 확인하는 용도
  // ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenToons(),
    );
  }
}
