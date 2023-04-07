import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;
  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;

  late Timer timer;

  // 1초씩 줄어드는 역할
  void onTick(Timer timer) {
    // 타이머가 끝났을 경우 재시작
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros = totalPomodoros + 1;
        isRunning = false;
        totalSeconds = twentyFiveMinutes;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  // 타이머 스타트
  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = !isRunning;
    });
  }

  // 타이머 일시정지
  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = !isRunning;
    });
  }

  // 타이머 리셋
  void onResetPressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  // Data Format - 1500초를 25분으로 변경
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    // print(duration.toString().split(".").first.substring(2, 7));
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              // decoration: const BoxDecoration(
              //   color: Colors.red,
              // ),
              alignment: Alignment.bottomCenter,
              child: Text(
                // '$totalSeconds',
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              // decoration: const BoxDecoration(
              //   color: Colors.green,
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline_sharp
                          : Icons.play_circle_outline_sharp,
                    ),
                  ),
                  IconButton(
                    iconSize: 120,
                    color: Theme.of(context).textTheme.displayLarge!.color,
                    onPressed: onResetPressed,
                    icon: const Icon(
                      Icons.restore_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // decoration: const BoxDecoration(
                    //   color: Colors.blue,
                    // ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      // borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
