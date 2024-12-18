import 'package:flutter/material.dart';

class ControlledMapScreen extends StatelessWidget {
  const ControlledMapScreen({super.key});

  static const name = "controlled_map_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Controlled map screen"),
      ),
    );
  }
}
