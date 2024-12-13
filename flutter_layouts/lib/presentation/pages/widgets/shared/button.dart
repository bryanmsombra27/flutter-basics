import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Color> gradient;
  final void Function()? onPress;

  const Button(
      {super.key,
      this.icon = FontAwesomeIcons.carBurst,
      required this.text,
      this.gradient = const [
        Color(0xff6989f5),
        Color(0xff906ef5),
      ],
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPress,
      child: Stack(
        children: [
          _ButtonBackground(
            icon: icon,
            text: text,
            gradient: gradient,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 140,
                width: 40,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ButtonBackground extends StatelessWidget {
  final IconData icon;
  final String text;
  final List<Color> gradient;

  const _ButtonBackground(
      {required this.icon, required this.text, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: gradient),
          color: Colors.blue,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(.2),
                ))
          ],
        ),
      ),
    );
  }
}
