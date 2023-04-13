import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/cart_button.dart';
import 'src/quantity_bar.dart';
import 'src/carousel.dart';

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
      required this.callback,
      this.accentColor = Colors.grey});

  final double price;
  final String productId;
  final String productName;
  final List<String> sizeList;
  //final List<String> colourList;
  final Map<String, List<String>> colourList;
  final Function callback;

  final Color accentColor;

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  // We need some variables to keep track of selections on the page
  final _formKey = GlobalKey<FormState>();

  String selectedSize = "";
  int selectedColour = 0;
  int quantity = 1;
  bool colourListExpanded = false;

  late List<Widget> fullColourList;
  late List<Widget> previewColourList;

  void quantityCallback(int q) {
    quantity = q;
  }

  void cartCallback() {
    if (_formKey.currentState!.validate()) {
      widget.callback(widget.productId, widget.productName, quantity,
          widget.colourList.keys.elementAt(selectedColour), selectedSize);
    }
  }

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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                    children: fullColourList),
              ),
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem> sizeMenuList = [];

    for (String element in widget.sizeList) {
      sizeMenuList.add(DropdownMenuItem(
          value: element,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(40)),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: Text(element),
          )));
    }

    fullColourList = List.generate(widget.colourList.length, (index) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedColour == index
                        ? widget.accentColor
                        : Colors.grey.shade300,
                    width: selectedColour == index ? 1.5 : 1),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        widget.colourList.values.elementAt(index)[0],
                        scale: 1))),
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
                    });
                  }),
            ),
          ),
          Container(
            height: 16,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                backgroundBlendMode: BlendMode.multiply,
                color: selectedColour == index
                    ? widget.accentColor.withAlpha(200)
                    : Colors.grey.withAlpha(200)),
            child: Text(widget.colourList.keys.elementAt(index),
                style: GoogleFonts.raleway(color: Colors.white)),
          ),
        ],
      );
    });

    if (fullColourList.length > 8) {
      previewColourList = fullColourList.sublist(0, 7);
      previewColourList.add(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.grey.withAlpha(200), BlendMode.multiply),
                fit: BoxFit.fitWidth,
                image: NetworkImage(widget.colourList.values.elementAt(7)[0],
                    scale: 1))),
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
    }

    return Form(
      key: _formKey,
      child: Container(
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.colourList.values.elementAt(selectedColour)[0],
                  scale: 0.1,
                  height: 250,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 12, top: 16, bottom: 16),
                  child: Text(
                    "Price:",
                    style:
                        GoogleFonts.raleway(color: Colors.grey, fontSize: 22),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16, right: 12),
                  child: Text(
                    '${widget.price}', // let user set formatting options like currency sign etc.
                    style: GoogleFonts.sourceCodePro(
                        color: Colors.grey, fontSize: 22),
                  ),
                ),
              ],
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: DropdownButtonFormField(
                icon: Icon(
                  Icons.expand_more_rounded,
                  color: Colors.grey.shade400,
                ),
                value: selectedSize != "" ? selectedSize : null,
                decoration: InputDecoration(
                    hintText: "Select size",
                    hintStyle: GoogleFonts.raleway(color: Colors.grey),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.red.shade400, width: 1.5),
                        borderRadius: BorderRadius.circular(40)),
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1.5),
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                        borderRadius: BorderRadius.circular(40)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade300, width: 1.5),
                        borderRadius: BorderRadius.circular(40))),
                items: sizeMenuList,
                validator: (value) => value == null ? 'Select a size' : null,
                elevation: 0,
                alignment: Alignment.center,
                dropdownColor: Colors.grey.shade300.withAlpha(200),
                borderRadius: BorderRadius.circular(40),
                style: GoogleFonts.raleway(color: Colors.grey, fontSize: 16),
                onChanged: (value) {
                  setState(() {
                    selectedSize = value;
                  });
                },
                selectedItemBuilder: (context) {
                  return widget.sizeList.map<Widget>((e) {
                    return Text(e);
                  }).toList();
                },
              ),
            ), // also make optional

            Container(
                margin: const EdgeInsets.all(10),
                child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                    children: fullColourList.length > 8
                        ? previewColourList
                        : fullColourList)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    QuantityBar(callback: quantityCallback),
                    CartButton(callback: cartCallback)
                  ],
                ),
              ),
            ) // our custom way to set quantity
          ])),
    );
  }
}

/*
Divider(
  indent: 10,
  endIndent: 10,
  thickness: 2,
  height: 2,
  color: Colors.grey.shade300,
), 
*/
