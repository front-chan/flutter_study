import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  // final 노란 전구 - create constructor for final fields
  const Button({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  // 직접 작성
  // const Button({
  //   required this.text,
  //   required this.backgroundColor,
  //   required this.textColor,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 50,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
