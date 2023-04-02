library mini_sdk;

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      required this.price,
      required this.productId,
      required this.productName,
      required this.sizeList,
      required this.colourList,
      required this.callback}); // lowkey wanna create a Product class to go with this sdk

  final double price;
  final String productId;
  final String productName;
  final List<String> sizeList;
  final List<String> colourList;
  final Function callback;
  // price somewhere. list of prices for diffrent sizes etc?

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  // We need some variables to keep track of selections on the page
  String selectedSize = "";
  int selectedColour = 0;
  int quantity = 1;
  bool sizeChartOpen = false;
  bool imageZoomed = false;

  TextEditingController quantityController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> sizeMenuList = [];

    for (String element in widget.sizeList) {
      sizeMenuList.add(DropdownMenuItem(value: element, child: Text(element)));
    }

    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24, top: 8),
            child: Text(
              widget.productName,
              style: GoogleFonts.raleway(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: const Offset(0, 6),
                  )
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.colourList[selectedColour],
                scale: 0.1,
                height: 250,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade200,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      value: selectedSize != "" ? selectedSize : null,
                      items: sizeMenuList,
                      alignment: Alignment.center,
                      dropdownColor: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(40),
                      style:
                          GoogleFonts.raleway(color: Colors.grey, fontSize: 16),
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      }),
                ),
              ),
              Text(
                '${widget.price}:-',
                style: GoogleFonts.raleway(color: Colors.grey, fontSize: 22),
              ),
            ],
          ), // also make optional
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 6,
                  offset: const Offset(0, 6), // changes position of shadow
                ),
              ],
            ),
            child: Container(
                margin: const EdgeInsets.all(10),
                width: 400,
                height: 200,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: GridView.count(
                      physics: const AlwaysScrollableScrollPhysics(),
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1,
                      // think I want to animate this opening and closing to show all colours. Maybe set a limit to something reasonable.
                      // Why would an item have like 100's of options anyway.
                      children:
                          List.generate(widget.colourList.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColour = index;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: selectedColour == index
                                      ? Colors.blue.shade100
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: selectedColour == index
                                          ? Colors.blue.shade200
                                          : Colors.grey.shade400,
                                      width: selectedColour == index ? 2 : 1),
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(
                                          widget.colourList[index],
                                          scale: 1)))),
                        );
                      })),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quantity < 1000) quantity += 1;
                      quantityController.text = quantity.toString();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.blue.shade300),
                  child: const Icon(Icons.add),
                ),
                SizedBox(
                    width: 60,
                    child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.sourceCodePro(
                            fontSize: 20, color: Colors.grey),
                        controller: quantityController,
                        onChanged: (value) {
                          int? num = int.tryParse(value);
                          num ??= 1;
                          setState(() {
                            quantity = num!;
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ])),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity -= 1;
                      quantityController.text = quantity.toString();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.blue.shade300),
                  child: const Icon(Icons.remove),
                ),
              ]),
              FloatingActionButton.extended(
                onPressed: () {
                  widget.callback(widget.productId, widget.productName,
                      quantity, selectedColour, selectedSize);
                },
                icon: const Icon(Icons.add_shopping_cart_rounded),
                label: Text("Add to cart", style: GoogleFonts.raleway()),
                backgroundColor: Colors.blue.shade300,
              )
            ],
          )
        ]));
  }
}
