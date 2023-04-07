import 'package:flutter/material.dart';
import 'package:flutter_study/screens/home_screen_toons.dart';
import 'package:flutter_study/services/api_service.dart';

void main() {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreenToons(),
    );
  }
}
