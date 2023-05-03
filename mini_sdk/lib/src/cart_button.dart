import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.callback,
    this.text = "Add to cart",
  });

  final Function callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FloatingActionButton.extended(
        onPressed: () => callback(),
        elevation: 0,
        icon: const Icon(Icons.add_shopping_cart_rounded),
        label: Text(text,
            style:
                GoogleFonts.raleway(fontSize: 16, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade400,
        splashColor: Colors.grey.shade300,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.5, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
