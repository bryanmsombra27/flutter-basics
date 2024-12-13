import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/shoes_app/models/shoe_model.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShoeSizePreview extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePreview({super.key, this.fullScreen = false});

  static const name = "shoe_size";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/shoe-description-page');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5 : 30, vertical: fullScreen ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
              color: const Color(0xffffcf53),
              borderRadius: !fullScreen
                  ? BorderRadius.circular(50)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
          child: Column(
            children: [
              const _ShowWithShadow(),
              if (!fullScreen) const _ShoesSizes()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShowWithShadow extends StatelessWidget {
  const _ShowWithShadow();

  @override
  Widget build(BuildContext context) {
    final shoeProvder = Provider.of<ShoeModel>(
      context,
    );

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const Positioned.fill(top: 30, right: 0, child: _ShadowShoe()),
          Image.asset(
            shoeProvder.assetImage,
          )
        ],
      ),
    );
  }
}

class _ShadowShoe extends StatelessWidget {
  const _ShadowShoe();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
            ]),
      ),
    );
  }
}

class _ShoesSizes extends StatelessWidget {
  const _ShoesSizes();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _ShoeSizeBox(
            size: 7,
          ),
          _ShoeSizeBox(
            size: 7.5,
          ),
          _ShoeSizeBox(
            size: 8,
          ),
          _ShoeSizeBox(
            size: 8.5,
          ),
          _ShoeSizeBox(
            size: 9,
          ),
          _ShoeSizeBox(
            size: 9.5,
          ),
        ],
      ),
    );
  }
}

class _ShoeSizeBox extends StatelessWidget {
  final double size;

  const _ShoeSizeBox({
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final shoeProvder = Provider.of<ShoeModel>(
      context,
    );

    final bool isNine = size == shoeProvder.size;

    return GestureDetector(
      onTap: () {
        shoeProvder.size = size;
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 1),
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: isNine ? const Color(0xfff1a23a) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isNine
                ? [
                    const BoxShadow(
                        color: Color(0xfff1a23a),
                        blurRadius: 10,
                        offset: Offset(0, 5))
                  ]
                : []),
        child: Text(
          "$size",
          style: TextStyle(
              color: isNine ? Colors.white : const Color(0xfff1a23a),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
