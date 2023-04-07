import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onPlused() {
    setState(() {
      counter = counter + 1;
    });
  }

  void onMinused() {
    setState(() {
      counter = counter - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click Count',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    // style: const ButtonStyle(
                    //   backgroundColor: MaterialStatePropertyAll(Colors.black),
                    // ),
                    iconSize: 40,
                    onPressed: onMinused,
                    icon: const Icon(
                      Icons.exposure_minus_1_sharp,
                    ),
                  ),
                  IconButton(
                    iconSize: 40,
                    onPressed: onPlused,
                    icon: const Icon(
                      Icons.plus_one_sharp,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
