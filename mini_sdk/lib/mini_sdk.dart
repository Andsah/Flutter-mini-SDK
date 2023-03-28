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
  const ProductPage({super.key});

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    // maybe some stuff here who knows

    return Container(child: Column(children: []));
  }
}
