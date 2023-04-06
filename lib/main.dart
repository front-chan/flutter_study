import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/Button.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF181818),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hello, Chan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text(
                'Total Balance',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(.7),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '\$5 196 582',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Button(
                    text: "Transfer",
                    backgroundColor: Color(0xFFF1B333),
                    textColor: Colors.black,
                  ),
                  Button(
                    text: "Request",
                    backgroundColor: Color(0xFF1F2123),
                    textColor: Colors.white,
                  ),
                  // MyButton()
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: const Color(0xFF1F2123),
                  //       borderRadius: BorderRadius.circular(45)),
                  //   child: const Padding(
                  //     padding: EdgeInsets.symmetric(
                  //       vertical: 20,
                  //       horizontal: 50,
                  //     ),
                  //     child: Text(
                  //       'Request',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 전구 누르고 Extract Widget - 커스텀 위젯 사용 가능 (재사용할 수 있게 만듬)
// class MyButton extends StatelessWidget {
//   const MyButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: const Color(0xFF1F2123),
//           borderRadius: BorderRadius.circular(45)),
//       child: const Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: 20,
//           horizontal: 50,
//         ),
//         child: Text(
//           'Request',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }
