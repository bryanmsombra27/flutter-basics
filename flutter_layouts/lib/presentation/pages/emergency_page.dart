import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/pages/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class _ItemBoton {
  final IconData icon;
  final String texto;
  final List<Color> gradient;

  _ItemBoton(this.icon, this.texto, this.gradient);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  static const name = "emergency_page";

  @override
  Widget build(BuildContext context) {
    final items = <_ItemBoton>[
      _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          [const Color(0xff6989F5), const Color(0xff906EF5)]),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const [Color(0xff66A9F2), Color(0xff536CF6)]),
      _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const [Color(0xffF2D572), Color(0xffE06AA3)]),
      _ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const [Color(0xff317183), Color(0xff46997D)]),
      _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const [Color(0xff6989F5), Color(0xff906EF5)]),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const [Color(0xff66A9F2), Color(0xff536CF6)]),
      _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const [Color(0xffF2D572), Color(0xffE06AA3)]),
      _ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const [Color(0xff317183), Color(0xff46997D)]),
      _ItemBoton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const [Color(0xff6989F5), Color(0xff906EF5)]),
      _ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          const [Color(0xff66A9F2), Color(0xff536CF6)]),
      _ItemBoton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const [Color(0xffF2D572), Color(0xffE06AA3)]),
      _ItemBoton(FontAwesomeIcons.personBiking, 'Awards',
          const [Color(0xff317183), Color(0xff46997D)]),
    ];
    final List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: const Duration(milliseconds: 500),
              child: Button(
                onPress: () {},
                text: item.texto,
                gradient: item.gradient,
                icon: item.icon,
              ),
            ))
        .toList();

    // return const _HeaderPage();
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 350),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: itemMap,
          ),
        ),
        const _HeaderPage(),
      ],
    );
  }
}

class _HeaderPage extends StatelessWidget {
  const _HeaderPage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.plus,
          subTitle: "Haz Solicitado",
          title: "Asistencia Medica",
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              padding: const EdgeInsets.all(15),
              shape: const CircleBorder(),
              onPressed: () {},
              child: const FaIcon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}
