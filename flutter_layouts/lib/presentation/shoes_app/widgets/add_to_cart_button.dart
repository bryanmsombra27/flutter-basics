import 'package:flutter/material.dart';
import 'package:flutter_layouts/presentation/shoes_app/widgets/custom_button.dart';

class AddToCartButton extends StatelessWidget {
  final double amount;
  const AddToCartButton({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.10),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              '\$$amount',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const CustomButton(text: 'Add To Cart'),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
