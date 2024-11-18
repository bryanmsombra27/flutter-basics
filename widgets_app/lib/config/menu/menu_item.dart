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
  MenuItem(
      title: 'Progress indicator',
      subTitle: 'Indicadores de progreso generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'SnackBars y dialogos',
      subTitle: 'indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'contenedores con animaciones stateFul widget',
      link: '/animated',
      icon: Icons.check_box_outline_blank),
  MenuItem(
      title: 'UI Controls + Tiles',
      subTitle: 'Diversos controles en flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'App tutorial',
      subTitle: 'tutorial de app en flutter',
      link: '/tutorial',
      icon: Icons.accessibility_rounded),
  MenuItem(
      title: 'Infinite Scroll y Pull',
      subTitle: 'Scroll infinito en flutter',
      link: '/infinite',
      icon: Icons.list_alt_outlined),
  MenuItem(
      title: 'Counter Screen',
      subTitle: 'contador',
      link: '/counter',
      icon: Icons.add),
  MenuItem(
      title: 'Theme Changer Screen',
      subTitle: 'Cambio de tema de la applicacion',
      link: '/theme-changer',
      icon: Icons.add),
];
