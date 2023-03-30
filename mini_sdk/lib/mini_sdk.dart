library mini_sdk;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

/*
Product page class, fulfills the design pattern found at 
-> https://ui-patterns.com/patterns/ProductPage <-
 */
class ProductPage extends StatefulWidget {
  const ProductPage(
      {super.key,
      required this.productName,
      required this.sizeList,
      required this.colourList});
  // maybe add a callback function to add selection to basket

  final String productName;
  final List<String> sizeList;
  final List<String> colourList;

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  // We need some variables to keep track of selections on the page
  int selectedSize = 0;
  int selectedColour = 0;
  bool sizeChartOpen = false;
  bool imageZoomed = false;

  @override
  Widget build(BuildContext context) {
    // maybe some stuff here who knows

    return Container(
        child: Row(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            Text(widget.productName),
            Text(widget.sizeList[0]),
            Image.network(widget.colourList[6], width: 40),
          ],
        ),
      ),
      Container(
        child: Image.network(
          widget.colourList[selectedColour],
          scale: 0.1,
          width: 200,
        ),
      )
    ]));
  }
}
