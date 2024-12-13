import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color primary;
  final Color secondary;
  final double bulletPrimary;
  final double bulletSecondary;

  const Slideshow(
      {super.key,
      required this.slides,
      this.dotsUp = false,
      this.primary = Colors.blue,
      this.secondary = Colors.grey,
      this.bulletPrimary = 12,
      this.bulletSecondary = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SliderModel(),
      // ..primary = primary
      // ..secondary = secondary
      // ..bulletPrimary = bulletPrimary
      // ..bulletSecondary = bulletSecondary,
      child: SafeArea(child: Builder(
        builder: (context) {
          Provider.of<_SliderModel>(context).primary = primary;
          Provider.of<_SliderModel>(context).secondary = secondary;
          Provider.of<_SliderModel>(context).bulletPrimary = bulletPrimary;
          Provider.of<_SliderModel>(context).bulletSecondary = bulletSecondary;

          return _EstructuraSlideShow(dotsUp: dotsUp, slides: slides);
        },
      )),
    );
  }
}

class _EstructuraSlideShow extends StatelessWidget {
  const _EstructuraSlideShow({
    required this.dotsUp,
    required this.slides,
  });

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsUp)
          _Dots(
            slides.length,
          ),

        // el widget Expanded se usa para obtener todo el espacio disponible  para los widgets que necesitan dimensiones expecificas
        Expanded(
          child: _Slides(slides),
        ),
        if (!dotsUp)
          _Dots(
            slides.length,
          )
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalDots;

  const _Dots(
    this.totalDots,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // EL METODO generate de las List PERMITE CREAR UN ARREGLO DE ACUERDO A LA CANTIDAD DE ELEMENTOS QUE SE LE PASEN AL PRIMER PARAMETRO, Y EN EL SEGUNDO PARAMETRO ES LA FUNCION GENERADORA QUE DEVOLVERA EL ELEMENTO  A LA LISTA
        children: List.generate(totalDots, (i) {
          return _Dot(
            index: i,
          );
        }),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<_SliderModel>(context).currentPage;
    final primary = Provider.of<_SliderModel>(context).primary;
    final secondary = Provider.of<_SliderModel>(context).secondary;
    double tamano;
    Color color;

    if (pageViewIndex >= index - 0.5 && pageViewIndex < index + .5) {
      tamano = Provider.of<_SliderModel>(context).bulletPrimary;
      color = primary;
    } else {
      tamano = Provider.of<_SliderModel>(context).bulletSecondary;
      color = secondary;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final PageController pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      // actualizar instancia del provider
      Provider.of<_SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
        // children: const [
        //   _Slide(
        //     filePath: 'assets/svg/slide-1.svg',
        //   ),
        //   _Slide(
        //     filePath: 'assets/svg/slide-2.svg',
        //   ),
        //   _Slide(
        //     filePath: 'assets/svg/slide-3.svg',
        //   ),
        // ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide({
    required this.slide,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: slide,
    );
  }
}

//  PROVIDER PRIVADO PARA EL SLIDESHOW

class _SliderModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primary = Colors.blue;
  Color _secondary = Colors.grey;
  double _bulletPrimary = 12;
  double _bulletSecondary = 12;

  double get currentPage {
    return _currentPage;
  }

  Color get primary {
    return _primary;
  }

  Color get secondary {
    return _secondary;
  }

  double get bulletPrimary {
    return _bulletPrimary;
  }

  double get bulletSecondary {
    return _bulletSecondary;
  }

  set currentPage(double page) {
    _currentPage = page;
    notifyListeners();
  }

  set primary(Color color) {
    _primary = color;
    // notifyListeners();
  }

  set secondary(Color color) {
    _secondary = color;
    // notifyListeners();
  }

  set bulletPrimary(double bullet) {
    _bulletPrimary = bullet;
    // notifyListeners();
  }

  set bulletSecondary(double bullet) {
    _bulletSecondary = bullet;
    // notifyListeners();
  }
}
