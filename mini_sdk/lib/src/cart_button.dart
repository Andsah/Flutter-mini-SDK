import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    super.key,
    required this.callback,
    this.textColor = const Color(0xFFBDBDBD),
    this.lineColor = const Color(0xFFE0E0E0),
    this.text = "Add to cart",
  });

  /// the function to call when pressing the button, takes no arguments and returns void.
  final Function callback;
  final String text;
  final Color textColor;
  final Color lineColor;

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
        foregroundColor: textColor,
        splashColor: lineColor,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.5, color: lineColor),
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
