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
  bool colourListExpanded = false;
  bool imageZoomed = false;

  late List<Widget> fullColourList;

  void closeColourList() {
    setState(() {
      colourListExpanded = false;
      Navigator.pop(context);
    });
  }

  void openColourList() {
    setState(() {
      colourListExpanded = true;
      showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                  children: fullColourList),
            );
          });
    });
  }

  TextEditingController quantityController = TextEditingController(text: "1");

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> sizeMenuList = [];

    for (String element in widget.sizeList) {
      sizeMenuList.add(DropdownMenuItem(value: element, child: Text(element)));
    }

    fullColourList = List.generate(widget.colourList.length, (index) {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedColour == index
                        ? Colors.grey.shade400 // make customizable x
                        : Colors.grey.shade300,
                    width: selectedColour == index ? 1.5 : 1),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(widget.colourList[index], scale: 1))),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: Colors.grey.withAlpha(128),
                  onTap: () {
                    if (colourListExpanded) {
                      closeColourList();
                    }

                    setState(() {
                      selectedColour = index;
                      // maybe more when there is a product class
                    });
                  }),
            ),
          )
        ],
      );
    });

    List<Widget> previewColourList = fullColourList.sublist(0, 7);
    previewColourList.add(Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.grey.withAlpha(200), BlendMode.darken),
              fit: BoxFit.fitWidth,
              image: NetworkImage(widget.colourList[7], scale: 1))),
      child: IconButton(
        onPressed: () {
          openColourList();
        },
        icon: const Icon(
          Icons.add,
          size: 35,
        ),
        color: Colors.white,
      ),
    ));

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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                width: 80,
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.transparent,
                    border:
                        Border.all(color: Colors.grey.shade300, width: 1.5)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      value: selectedSize != "" ? selectedSize : null,
                      items: sizeMenuList,
                      elevation: 0,
                      alignment: Alignment.center,
                      dropdownColor: Colors.grey.shade200.withAlpha(200),
                      borderRadius: BorderRadius.circular(20),
                      style:
                          GoogleFonts.raleway(color: Colors.grey, fontSize: 16),
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      }),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  '${widget.price}', // let user set formatting options like currency sign etc.
                  style: GoogleFonts.sourceCodePro(
                      color: Colors.grey, fontSize: 22),
                ),
              ),
            ],
          ), // also make optional
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 2,
            height: 2,
            color: Colors.grey.shade300,
          ),
          Container(
              margin: const EdgeInsets.all(10),
              width: 372,
              height: 185,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                    children: previewColourList),
              )),
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 2,
            height: 2,
            color: Colors.grey.shade300,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1.5),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (quantity < 999) quantity += 1;
                            quantityController.text = quantity.toString();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                            foregroundColor: Colors.grey.shade400,
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent),
                        child: const Icon(Icons.add),
                      ),
                      VerticalDivider(
                        indent: 6,
                        endIndent: 6,
                        thickness: 1.5,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(
                          width: 60,
                          child: TextFormField(
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.sourceCodePro(
                                  fontSize: 20,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w500),
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
                                LengthLimitingTextInputFormatter(3),
                                FilteringTextInputFormatter.digitsOnly
                              ])),
                      VerticalDivider(
                        indent: 6,
                        endIndent: 6,
                        thickness: 1.5,
                        width: 2,
                        color: Colors.grey.shade300,
                      ),
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
                            foregroundColor: Colors.grey.shade400,
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent),
                        child: const Icon(Icons.remove),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 60,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        //widget.callback(widget.productId, widget.productName, quantity, selectedColour, selectedSize);
                      },
                      elevation: 0,
                      icon: const Icon(Icons.add_shopping_cart_rounded),
                      label: Text("Add to cart",
                          style: GoogleFonts.raleway(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.grey.shade400,
                      splashColor: Colors.grey.shade300,
                      highlightElevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.5, color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
