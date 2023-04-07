import 'package:flutter/material.dart';
import 'package:flutter_study/models/webtoon_model.dart';
import 'package:flutter_study/services/api_service.dart';

class HomeScreenToons extends StatelessWidget {
  HomeScreenToons({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
        body: FutureBuilder(
          future: webtoons,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return const Text('There is data!');
            }
            return const Text('Loading...');
          }),
        ));
  }
}
