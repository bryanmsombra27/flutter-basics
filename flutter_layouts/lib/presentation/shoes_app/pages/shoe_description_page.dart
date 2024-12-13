import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/shoes_app/models/shoe_model.dart';
import 'package:flutter_layouts/presentation/shoes_app/widgets/custom_button.dart';
import 'package:flutter_layouts/presentation/shoes_app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShoeDescriptionPage extends StatelessWidget {
  const ShoeDescriptionPage({super.key});

  static const name = "shoe_description_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1',
                child: ShoeSizePreview(
                  fullScreen: true,
                ),
              ),
              Positioned(
                  top: 80,
                  child: FloatingActionButton(
                    onPressed: () {
                      context.pop();
                    },
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 60,
                    ),
                  ))
            ],
          ),
          const Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                _AmountBuyNow(),
                _ColorsAndMore(),
                _FloatingButtons()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _FloatingButtons extends StatelessWidget {
  const _FloatingButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadowButton(
            icon: Icons.star,
            color: Colors.red,
            size: 25,
          ),
          _ShadowButton(
            icon: Icons.add_shopping_cart,
            color: Colors.grey.withOpacity(.4),
            size: 25,
          ),
          _ShadowButton(
            icon: Icons.settings,
            color: Colors.grey.withOpacity(.4),
            size: 25,
          ),
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const _ShadowButton(
      {required this.icon, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10))
      ], color: Colors.white, shape: BoxShape.circle),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: 90,
                  child: _ColorButton(
                    color: Color(0xff364d56),
                    index: 1,
                    imgUrl: 'assets/imgs/negro.png',
                  )),
              Positioned(
                left: 60,
                child: _ColorButton(
                  color: Color(0xff2099f1),
                  index: 2,
                  imgUrl: 'assets/imgs/azul.png',
                ),
              ),
              Positioned(
                left: 30,
                child: _ColorButton(
                  color: Color(0xffffad29),
                  index: 3,
                  imgUrl: 'assets/imgs/amarillo.png',
                ),
              ),
              _ColorButton(
                color: Color(0xffc6d642),
                index: 4,
                imgUrl: 'assets/imgs/verde.png',
              ),
            ],
          )),
          CustomButton(
            text: 'More related items',
            width: 150,
            height: 30,
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String imgUrl;

  const _ColorButton({
    required this.color,
    required this.index,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    final shoeProvider = Provider.of<ShoeModel>(context);

    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      delay: Duration(milliseconds: index * 100),
      child: GestureDetector(
        onTap: () {
          shoeProvider.assetImage = imgUrl;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  const _AmountBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text('\$180.0',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Spacer(),
            Bounce(
              from: 8,
              delay: const Duration(seconds: 1),
              child: const CustomButton(
                text: 'Buy Now',
                width: 120,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
