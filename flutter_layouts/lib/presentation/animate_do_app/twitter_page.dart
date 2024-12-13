import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({super.key});

  static const name = "twitter_page";

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            animate = !animate;
          });
        },
        child: animate
            ? const FaIcon(FontAwesomeIcons.stop)
            : const FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: animate,
          duration: const Duration(seconds: 1),
          from: 30,
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.blue,
            size: 40,
          ),
        ),
      ),
    );
  }
}
