import 'package:flutter/material.dart';
import 'package:flutter_study/models/webtoon_model.dart';
import 'package:flutter_study/services/api_service.dart';
import 'package:flutter_study/widgets/webtoon_widget.dart';

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
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // 화면의 남는 고간을 차지하는 widget
                  Expanded(
                    child: makeList(snapshot),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
            // return const Text('Loading...');
          }),
        ));
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        // print(index);
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
