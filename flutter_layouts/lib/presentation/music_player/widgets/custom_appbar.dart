import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        children: [
          Icon(FontAwesomeIcons.chevronLeft),
          Spacer(),
          Icon(FontAwesomeIcons.message),
          SizedBox(
            width: 20,
          ),
          Icon(FontAwesomeIcons.headphonesSimple),
          SizedBox(
            width: 20,
          ),
          Icon(FontAwesomeIcons.upRightFromSquare),
        ],
      ),
    );
  }
}
