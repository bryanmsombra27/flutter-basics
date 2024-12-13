import 'package:flutter/material.dart';
import 'package:flutter_layouts/models/slider_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  static const name = "slideshow_page";

  @override
  Widget build(BuildContext context) {
    // return SvgPicture.asset('assets/svg/slide-1.svg');
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: const Column(
        children: [
          // el widget Expanded se usa para obtener todo el espacio disponible  para los widgets que necesitan dimensiones expecificas
          Expanded(
            child: _Slides(),
          ),
          _Dots()
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _Dot(
            index: 0,
          ),
          _Dot(
            index: 1,
          ),
          _Dot(
            index: 2,
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({required this.index});

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    // final pageViewIndex = context.watch<SliderModel>().currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + .5)
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides();

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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
        children: const [
          _Slide(
            filePath: 'assets/svg/slide-1.svg',
          ),
          _Slide(
            filePath: 'assets/svg/slide-2.svg',
          ),
          _Slide(
            filePath: 'assets/svg/slide-3.svg',
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String filePath;
  const _Slide({
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(filePath),
    );
  }
}
