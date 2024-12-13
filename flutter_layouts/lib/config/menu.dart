// CON ESTA SINTAXIS SOLO CARGA LO QUE OCUPA DEL PAQUETE, PERO COMO MATERIAL YA SE CARGA DESDE EL MAIN, SOLO REUTILIZAR EL PAQUETE CARGADO
// import 'package:flutter/material.dart' show IconData;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      title: 'Header Curvo',
      subTitle: 'distintos diseños de headers',
      link: '/curve',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Header Gradiente',
      subTitle: 'distintos diseños de headers',
      link: '/gradient-page',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Header Ola',
      subTitle: 'distintos diseños de headers',
      link: '/wave',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Header Triangulo',
      subTitle: 'distintos diseños de headers',
      link: '/triangle',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Header Pico',
      subTitle: 'distintos diseños de headers',
      link: '/pico',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Header Diagonal',
      subTitle: 'distintos diseños de headers',
      link: '/diagonal',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Header Rounded',
      subTitle: 'distintos diseños de headers',
      link: '/rounded',
      icon: Icons.smart_button),
  MenuItem(
      title: 'Animaciones',
      subTitle: 'animaciones en flutter',
      link: '/animations',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Cuadrado Animado',
      subTitle: 'animaciones en flutter',
      link: '/square-animation',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Circular Progressbar',
      subTitle: 'animaciones en flutter',
      link: '/circular-progress',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Circular Progressbar page',
      subTitle: 'multiples progressbars',
      link: '/circular-graphic-page',
      icon: Icons.credit_card),
  MenuItem(
      title: 'SlideShow page',
      subTitle: 'slide widget',
      link: '/slideshow-page',
      icon: Icons.credit_card),
  MenuItem(
      title: 'SlideShow  custom widget',
      subTitle: 'slide reutilizable',
      link: '/slideshow-custom',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Pinteres Layout',
      subTitle: 'diseño similar a pinterest',
      link: '/pinterest-page',
      icon: Icons.access_alarm),
  MenuItem(
      title: 'Emergency Page Layout',
      subTitle: 'diseño de emergency app',
      link: '/emergency-page',
      icon: Icons.access_alarm),
  MenuItem(
      title: 'Sliver List Page',
      subTitle: 'diseño de sliver',
      link: '/sliverlist-page',
      icon: Icons.ac_unit_sharp),
  MenuItem(
      title: 'Animate_do_app',
      subTitle: 'animaciones con animate_do',
      link: '/animate_do',
      icon: Icons.ac_unit_sharp),
  MenuItem(
      title: 'Twitter App',
      subTitle: 'animaciones con animate_do',
      link: '/twitter-page',
      icon: FontAwesomeIcons.twitter),
  MenuItem(
      title: 'Navigation App',
      subTitle: 'animaciones con animate_do',
      link: '/navigation-page',
      icon: FontAwesomeIcons.airbnb),
  MenuItem(
      title: 'Shoes App',
      subTitle: 'animaciones con animate_do',
      link: '/shoes-page',
      icon: FontAwesomeIcons.shoePrints),
  MenuItem(
      title: 'Shoe Description',
      subTitle: 'animaciones con animate_do',
      link: '/shoe-description-page',
      icon: FontAwesomeIcons.shoePrints),
  MenuItem(
      title: 'Music Player App',
      subTitle: 'animaciones con animate_do',
      link: '/music-player-page',
      icon: FontAwesomeIcons.shoePrints),
];
