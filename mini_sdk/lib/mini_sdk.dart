import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      required this.callback});

  final double price;
  final String productId;
  final String productName;
  final List<String> sizeList;
  final List<String>
      colourList; // replace with final Map<String,List<String>> colourList;
  final Function callback;

  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  // We need some variables to keep track of selections on the page
  String selectedSize = "";
  int selectedColour = 0;
  bool colourListExpanded = false;

  late List<Widget> fullColourList;
  late List<Widget> previewColourList;

  QuantityBar qBar = const QuantityBar();

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

    if (fullColourList.length > 8) {
      previewColourList = fullColourList.sublist(0, 7);
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
          Divider(
            indent: 10,
            endIndent: 10,
            thickness: 2,
            height: 2,
            color: Colors.grey.shade300,
          ),
          qBar // our custom way to set quantity
        ]));
  }
}
