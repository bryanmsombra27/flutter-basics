import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/pages/widgets/widgets.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  static const name = "header_page";

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: HeaderCircular());
    // return Scaffold(body: HeaderDiagonal());
    // return Scaffold(body: HeaderTriangle());
    // return Scaffold(body: HeaderPico());
    // return Scaffold(body: HeaderCurvo());
    // return Scaffold(body: HeaderWaves());
    return const HeaderWaveGradient();
  }
}
