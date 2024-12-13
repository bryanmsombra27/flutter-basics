import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/shoes_app/widgets/widgets.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({super.key});

  static const name = "shoe_page";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            title: "For you",
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(tag: 'zapato-1', child: ShoeSizePreview()),
                ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.")
              ],
            ),
          )),
          AddToCartButton(
            amount: 180.0,
          ),
        ],
      ),
      // body: CustomAppbar(
      //   title: "For you",
      // ),
    );
  }
}
