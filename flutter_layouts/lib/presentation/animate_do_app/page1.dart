import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animaciones con Animate_do"),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/twitter-page");
              },
              icon: const FaIcon(FontAwesomeIcons.twitter)),
          SlideInLeft(
            from: 100,
            child: IconButton(
                onPressed: () {
                  // Navigator.push(context, );
                  context.push("/animate_do");
                },
                icon: const Icon(Icons.navigate_next_rounded)),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          onPressed: () {
            context.push("/navigation-page");
          },
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: const Duration(milliseconds: 1100),
              child: const Icon(
                Icons.new_releases,
                color: Colors.blue,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 200),
              child: const Text(
                "Titulo",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: const Text(
                "Texto pequeño",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
