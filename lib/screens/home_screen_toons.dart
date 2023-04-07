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
        return Column(
          children: [
            Container(
              width: 250,
              // 자식의 부모 영역 침범을 제어하는 방법
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    offset: const Offset(5, 5),
                    color: Colors.black.withOpacity(.8),
                  ),
                ],
              ),
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  "User-Agent":
                      "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
