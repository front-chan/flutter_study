import 'package:flutter/material.dart';
import 'package:flutter_study/models/webtoon_model.dart';
import 'package:flutter_study/services/api_service.dart';

class HomeScreenToons extends StatelessWidget {
  HomeScreenToons({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
              // Text 출력
              // return const Text('There is data!');

              // ListView 전체 타이틀 출력
              // return ListView(
              //   children: [
              //     for (var webtoon in snapshot.data!)
              //       Text(webtoon.title,
              //           style: const TextStyle(
              //             fontSize: 20,
              //           )),
              //   ],
              // );

              // ListView.builder
              // return ListView.builder(
              //   // 수직/수평 스크롤 기능
              //   scrollDirection: Axis.vertical,
              //   itemCount: snapshot.data!.length,
              //   itemBuilder: (context, index) {
              //     var webtoon = snapshot.data![index];
              //     return Text(webtoon.title);
              //   },
              // );

              // ListView.separated
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  // print(index);
                  var webtoon = snapshot.data![index];
                  return Text(webtoon.title);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
            // return const Text('Loading...');
          }),
        ));
  }
}
