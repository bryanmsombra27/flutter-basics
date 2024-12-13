import 'package:flutter/material.dart';

class HeaderBorderRounded extends StatelessWidget {
  const HeaderBorderRounded({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff515AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60))),
    );
  }
}
