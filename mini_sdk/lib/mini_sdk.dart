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
      required this.priceText,
      required this.productId,
      required this.productName,
      required this.productDescription,
      required this.sizeList,
      required this.colourList,
      required this.callback,
      this.accentColor = Colors.grey,
      this.sizeHint = "Select size",
      this.seeMore = "see more",
      this.seeLess = "see less"});

  final double price;
  final String priceText;
  final String productId;
  final String productName;
  final String productDescription;
  final List<String> sizeList;
  //final List<String> colourList;
  final Map<String, List<String>> colourList;
  final Function callback;

  final Color accentColor;
  final String sizeHint;
  final String seeMore;
  final String seeLess;

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

  bool detailsExpanded = false;

  late List<Widget> fullColourList;
  late List<Widget> previewColourList;
  Map<String, List<Widget>> carouselList = {};
  late Carousel productImages;

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

    /*
    Populating the dropdown menu for the size options.
     */
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

    /*
    Populating a carousel list for each colourway of the product.
     */
    for (String colour in widget.colourList.keys) {
      carouselList[colour] =
          List.generate(widget.colourList[colour]!.length, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
                // workshop the size make it fit width
                scale: 0.1,
                height: 390,
                widget.colourList[colour]![index]),
          ),
        );
      });
    }

    productImages = Carousel(
        key: Key(selectedColour.toString()),
        memberList: carouselList[widget.colourList.keys
            .elementAt(selectedColour)]!); // initialize the carousels list

    /*
    Populating the list for the colourway options.
     */
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
                      productImages = Carousel(
                          key: Key(index.toString()),
                          memberList: carouselList[
                              widget.colourList.keys.elementAt(index)]!);
                    });
                  }),
            ),
          ),
          Container(
            height: 18,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                backgroundBlendMode: BlendMode.multiply,
                color: selectedColour == index
                    ? widget.accentColor.withAlpha(200)
                    : Colors.grey.withAlpha(200)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(widget.colourList.keys.elementAt(index),
                  style: GoogleFonts.raleway(color: Colors.white)),
            ),
          ),
        ],
      );
    });

    /*
    If the number of colourways exceeds 8, create a special button to open a drawer with the rest of the colourway options
     */
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
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 10), child: productImages),
          Container(
              margin: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 2, bottom: 2, right: 12, left: 10),
                      child: Text(
                        '${widget.priceText}', // let user set formatting options like currency sign etc.
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.grey, fontSize: 22),
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 16, bottom: 12, left: 8, right: 8),
                  padding: const EdgeInsets.only(left: 2, right: 2),
                  child: DropdownButtonFormField(
                    icon: Icon(
                      Icons.expand_more_rounded,
                      color: Colors.grey.shade400,
                    ),
                    value: selectedSize != "" ? selectedSize : null,
                    decoration: InputDecoration(
                        hintText: widget.sizeHint,
                        hintStyle:
                            GoogleFonts.raleway(color: Colors.grey.shade400),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.red.shade400, width: 1.5),
                            borderRadius: BorderRadius.circular(40)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 1.5),
                            borderRadius: BorderRadius.circular(40)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 1.5),
                            borderRadius: BorderRadius.circular(40)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey.shade300, width: 1.5),
                            borderRadius: BorderRadius.circular(40))),
                    items: sizeMenuList,
                    validator: (value) =>
                        value == null ? widget.sizeHint : null,
                    elevation: 0,
                    alignment: Alignment.center,
                    dropdownColor: Colors.grey.shade300.withAlpha(200),
                    borderRadius: BorderRadius.circular(40),
                    style: GoogleFonts.raleway(
                        color: Colors.grey.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QuantityBar(callback: quantityCallback),
                        CartButton(callback: cartCallback)
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 16),
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
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(widget.productName,
                          style: GoogleFonts.raleway(
                              color: Colors.grey.shade400,
                              fontSize: 22,
                              fontWeight: FontWeight.w500))),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10, left: 8, right: 8, bottom: 10),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      detailsExpanded = !detailsExpanded;
                    }),
                    child: Wrap(
                      children: [
                        Text(widget.productDescription,
                            overflow: TextOverflow.fade,
                            maxLines: detailsExpanded ? 100 : 4,
                            style: GoogleFonts.raleway(
                                color: Colors.grey.shade800,
                                fontSize: 16,
                                fontWeight: FontWeight.w300)),
                        Center(
                          child: Text(
                              detailsExpanded ? widget.seeLess : widget.seeMore,
                              style: GoogleFonts.raleway(
                                  color: Colors.grey.shade400,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                )
              ])),
        ],
      ),
    );
  }
}
