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
    return SingleChildScrollView(
      child: Container(
          child: Column(children: [
        Container(
          child: Image.network(
            widget.colourList[selectedColour],
            scale: 0.1,
            width: 250,
          ),
        ),
        Text(widget.productName),
        Text(widget.sizeList[0]),
        Container(
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 6,
                offset: Offset(0, 6), // changes position of shadow
              ),
            ],
          ),
          child: Container(
              margin: EdgeInsets.all(10),
              width: 400,
              height: 200,
              child: GridView.count(
                  physics: const AlwaysScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                  // think I want to animate this opening and closing to show all colours. Maybe set a limit to something reasonable.
                  // Why would an item have like 100's of options anyway.
                  children: List.generate(widget.colourList.length, (index) {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage(widget.colourList[index],
                                    scale: 1))));
                  }))),
        ),
      ])),
    );
  }
}
