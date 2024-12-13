import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/pages/widgets/shared/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowSharedWidgetPage extends StatelessWidget {
  const SlideshowSharedWidgetPage({super.key});

  static const name = "slideshow_shared_widget_page";

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        final isPortrait = Orientation.portrait.name == orientation.name;
        final children = [
          const Expanded(
            child: CustomSlideShow(),
          ),
          const Expanded(
            child: CustomSlideShow(),
          ),
        ];

        return isPortrait
            ? Column(
                children: children,
              )
            : Row(
                children: children,
              );
      },
    );
  }
}

class CustomSlideShow extends StatelessWidget {
  const CustomSlideShow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      // dotsUp: true,
      bulletPrimary: 15,
      bulletSecondary: 10,
      primary: Colors.green,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}
