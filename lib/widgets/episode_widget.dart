import 'package:flutter/material.dart';
import 'package:flutter_study/models/webtoon_episode_model.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.episode, required this.webtoonId});

  final String webtoonId;
  final WebtoonEpisodeModel episode;

  onButtonTap() async {
    // final url = Uri.parse('sms:+8201074314679');
    // await launchUrl(url);
    // await launch('sms:+8201074314679?body=안녕하세요');
    String episodeId = episode.id;
    int episodeNumId = int.parse(episodeId) + 1;
    String newId = episodeNumId.toString();

    // 한줄로 쓸 수 있음
    await launchUrlString(
        "https://comic.naver.com/webtoon/detail?titleId=$webtoonId&no=$newId");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onButtonTap
          // episode.id == ""
          //     ? Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: ((context) => const NotFoundScreen()),
          //         ),
          //       )
          //     : onButtonTap();
          // if (episode.id == "") {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: ((context) => const NotFoundScreen()),
          //     ),
          //   );
          // } else {
          //   onButtonTap();
          // }
          ,
          child: Container(
            // margin: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  offset: const Offset(4, 4),
                  color: Colors.black.withOpacity(.4),
                )
              ],
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal[300],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    episode.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_sharp,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  size: 14,
                  Icons.star_purple500_sharp,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  'rating: ${episode.rating}',
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  size: 14,
                  Icons.calendar_month_sharp,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  episode.date,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
