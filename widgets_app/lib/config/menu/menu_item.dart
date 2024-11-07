// CON ESTA SINTAXIS SOLO CARGA LO QUE OCUPA DEL PAQUETE, PERO COMO MATERIAL YA SE CARGA DESDE EL MAIN, SOLO REUTILIZAR EL PAQUETE CARGADO
// import 'package:flutter/material.dart' show IconData;
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subTitle: 'varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
];
