import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;

  const CustomButton(
      {super.key, required this.text, this.height = 50, this.width = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.orange,
      ),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
