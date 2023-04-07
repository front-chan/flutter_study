import 'package:flutter/material.dart';
import 'package:flutter_study/models/webtoon_model.dart';
import 'package:flutter_study/services/api_service.dart';

class HomeScreenToons extends StatefulWidget {
  const HomeScreenToons({super.key});

  @override
  State<HomeScreenToons> createState() => _HomeScreenToonsState();
}

class _HomeScreenToonsState extends State<HomeScreenToons> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  // 비동기 함수
  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    print(isLoading);

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
