import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final List<Color> gradient;

  const IconHeader(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.gradient = const [
        Color(0xff526BF6),
        Color(0xff67ACF2),
      ]});

  static const name = "icon_header";

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withOpacity(.7);

    return Stack(
      children: [
        _IconHeaderBackground(
          gradient: gradient,
        ),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(
              icon,
              size: 250,
              color: Colors.white.withOpacity(.2),
              // color: Colors.white10,
            )),
        Column(
          children: [
            const SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              subTitle,
              style: TextStyle(fontSize: 20, color: colorBlanco),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 25,
                  color: colorBlanco,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            FaIcon(
              icon,
              size: 80,
              color: Colors.white,
              // color: Colors.white10,
            )
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final List<Color> gradient;

  const _IconHeaderBackground({required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradient),
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(80)),
      ),
      width: double.infinity,
      height: 300,
    );
  }
}
