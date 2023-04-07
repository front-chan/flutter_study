import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle
                  ? const MyLargeTitle()
                  : const Text(
                      'nothing',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
              IconButton(
                onPressed: toggleTitle,
                icon: Icon(
                  showTitle ? Icons.toggle_off_sharp : Icons.toggle_on_sharp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  // initState() 상태를 초기화하기 위한 메서드
  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  // 위젯이 스크린에서 제거될 때 호출되는 메서드
  // API 업데이트나 이벤트 리스너로부터 구독을 취소하거나 form의 리스너로부터 벗어나고 싶을 때 사용
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build!');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        // color: Theme.of(context).textTheme.titleLarge!.color,
        // ?, ! 둘다 사용 가능 ? -> 일수도 아닐수도 , ! -> 확신
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
