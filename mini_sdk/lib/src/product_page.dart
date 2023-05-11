import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_button.dart';
import 'quantity_bar.dart';
import 'carousel.dart';

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
      this.sizeList = const [],
      required this.colourList,
      required this.callback,
      this.selectionColor = const Color(0xFF9E9E9E),
      this.lineColor = const Color(0xFFE0E0E0),
      this.buttonTextColor = const Color(0xFFBDBDBD),
      this.textColor = const Color(0xFF757575),
      this.errorColor = const Color(0xFFF44336),
      this.alphaColor = const Color(0xFF9E9E9E),
      this.onAlphaColor = const Color(0xFFFFFFFF),
      this.sizeHint = "Select size",});

  final double price;
  final String priceText;
  final String productId;
  final String productName;
  final String productDescription;
  final List<String> sizeList;

  /// A mapping with the colour name as key, and a list of links to images of the product as value.
  /// 
  /// Format:
  /// 
  /// {"colourName" : ["imgLink1", "imgLink2"]}
  final Map<String, List<String>> colourList;

  /// the callback function must be of the form:
  /// 
  /// (*productId*, *productName*, *quantity*, *selectedColour*, *selectedSize*)
  /// 
  /// (*productId*, *productName*, *quantity*, *selectedColour*) if sizeList is left empty
  /// 
  /// The function is expected to return void.
  /// 
  final Function callback;
  final String sizeHint;

  final Color selectionColor;
  final Color buttonTextColor;
  final Color lineColor;
  final Color textColor;
  final Color errorColor;
  final Color alphaColor;
  final Color onAlphaColor;


  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Variables to keep track of selections on the page
  String selectedSize = "";
  int selectedColour = 0;
  int quantity = 1;
  bool colourListExpanded = false;
  bool detailsExpanded = false;

  // Lists to be used in creating widgets on the screen
  late List<Widget> fullColourList;
  late List<Widget> previewColourList;
  Map<String, List<Widget>> carouselList = {};
  
  late Carousel productImages;
  late Widget sizeMenu;
  late Widget colourMenu;

  late TextPainter tp;
  late bool textOverflowed;

  @override
  void initState() {
    super.initState();
    // a textpaiter is use to check if the description is too long and needs to be overflowed
    tp = TextPainter(text: TextSpan(text: widget.productDescription), maxLines: 4, textDirection: TextDirection.ltr);
  }

  void quantityCallback(int q) {
    quantity = q;
  }

  /// calls the provided callback function with the customers selections as parameters
  void cartCallback() {
    if (widget.sizeList.isNotEmpty) { // size option exists? need to validate
      if (_formKey.currentState!.validate()) {
      widget.callback(widget.productId, widget.productName, quantity,
          widget.colourList.keys.elementAt(selectedColour), selectedSize);}
    }
    else { // no size option? no need to validate, everything is valid already
        widget.callback(widget.productId, widget.productName, quantity,
          widget.colourList.keys.elementAt(selectedColour));
      }
  }
  /// closes the modal bottom sheet displaying the remaining colour options.
  void closeColourList() {
    setState(() {
      colourListExpanded = false;
      Navigator.pop(context);
    });
  }

  /// opens the list of remaining colour options in a modal bottom sheet.
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

    // testing description for overflowing
    tp.layout(maxWidth: 400);
    textOverflowed = tp.didExceedMaxLines;

    // size is an optional attribute, and creates the dropdownbutton for it only if there are sizes available as options
    if (widget.sizeList.isNotEmpty) {
      List<DropdownMenuItem> sizeMenuList = [];
      populateSizelist(sizeMenuList, context);
      sizeMenu = Container(
        margin: const EdgeInsets.only(top: 16, bottom: 12, left: 8, right: 8),
        padding: const EdgeInsets.only(left: 2, right: 2),
        child: DropdownButtonFormField( // formfield version so the customer is forced to pick a size if size is an option
          isDense: true,
          icon: Icon(
            Icons.expand_more_rounded,
            color: widget.buttonTextColor,
          ),
          value: selectedSize != "" ? selectedSize : null,
          decoration: InputDecoration(
              hintText: widget.sizeHint,
              hintStyle: GoogleFonts.raleway(color: widget.buttonTextColor),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: widget.errorColor.withAlpha(200), width: 1.5),
                  borderRadius: BorderRadius.circular(40)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: widget.errorColor, width: 1.5),
                  borderRadius: BorderRadius.circular(40)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: widget.lineColor, width: 1.5),
                  borderRadius: BorderRadius.circular(40)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: widget.lineColor, width: 1.5),
                  borderRadius: BorderRadius.circular(40))),
          items: sizeMenuList,
          validator: (value) => value == null ? widget.sizeHint : null, // no size picked? show size hint
          elevation: 0,
          alignment: Alignment.center,
          dropdownColor: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(40),
          style: GoogleFonts.raleway(
              color: widget.buttonTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w600),
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
      );
    } else {
      sizeMenu = const SizedBox();
    }

    // if the number of colours of the product exceeds 1, create a colour selection menu
    if (widget.colourList.length > 1) {
      populateCarousels();
      populateColourlist();
      productImages = Carousel(
          key: Key(selectedColour.toString()),
          dotColor: widget.buttonTextColor,
          memberList: carouselList[widget.colourList.keys
              .elementAt(selectedColour)]!); // initialize the carousels list

     
      //If the number of colourways exceeds 8, create a special button to open a drawer with the rest of the colourway options
      if (fullColourList.length > 8) {
        previewColourList = fullColourList.sublist(0, 7); // the preview uses the first 7 colours in the list
        previewColourList.add(Container( // adds an 8th element that is the button to open the modal bottom sheet
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      widget.alphaColor.withAlpha(200), BlendMode.multiply),
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
            color: widget.onAlphaColor,
          ),
        ));
      }
      colourMenu = Container(
          margin:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 16),
          child: GridView.count( // gridview controlls the layout of the colour menu
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 1,
              // picks the appropriate list depending on the number of colours available
              children: fullColourList.length > 8
                  ? previewColourList
                  : fullColourList));
    } else if (widget.colourList.isNotEmpty) {
      // if only one colourway exists, no use in a colour menu, only a carousel for the product images
      productImages = Carousel(
        dotColor: widget.buttonTextColor,
          memberList:
              List.generate(widget.colourList.values.single.length, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(widget.colourList.values.single[index]),
          ),
        );
      }));
      colourMenu = const SizedBox();
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
                        widget
                            .priceText,
                        style: GoogleFonts.sourceCodePro(
                            color: widget.buttonTextColor, fontSize: 22),
                      ),
                    ),
                    const SizedBox() // empty sized box so that the row widget pushes the price text to the left
                  ],
                ),
                sizeMenu, // The sizing options for the product (optional)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        QuantityBar(callback: quantityCallback, lineColor: widget.lineColor, textColor: widget.buttonTextColor),
                        CartButton(callback: cartCallback, lineColor: widget.lineColor, textColor: widget.buttonTextColor)
                      ],
                    ),
                  ),
                ),
                colourMenu, // The colour options for the product (optional)
                widget.colourList.length > 1
                    ? Divider(
                        indent: 10,
                        endIndent: 10,
                        thickness: 2,
                        height: 2,
                        color: widget.lineColor,
                      )
                    : const SizedBox(), // insert a divider if we have a colourway list

                // Stylised product name
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Center(
                      child: Text(widget.productName,
                          style: GoogleFonts.raleway(
                              color: widget.buttonTextColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w500))),
                ),
                // Stylized product description (non html)
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
                            overflow: TextOverflow.clip,
                            maxLines: detailsExpanded ? 100 : 4,
                            style: GoogleFonts.raleway(
                                color: widget.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                          // If the description is more than 4 lines then it will overflow and a button will appear to indicate there is more to read
                          textOverflowed ? Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                            border: Border.all(color: widget.lineColor, width: 1.5),
                            borderRadius: BorderRadius.circular(35)),
                          child: Icon(detailsExpanded? Icons.expand_less_rounded: Icons.expand_more_rounded, 
                          color: widget.buttonTextColor, 
                          size: 35)
                          )
                        ) : const SizedBox()
                      ],
                    ),
                  ),
                )
              ]
            )
          ),
        ],
      ),
    );
  }

 
  ///Populating the list for the colourway options.
  void populateColourlist() {
    fullColourList = List.generate(widget.colourList.length, (index) {
      return Stack( // stacking elements to add a label to the preview image
        alignment: Alignment.bottomCenter,
        children: [
          Container( // this is the preview image
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedColour == index
                        ? widget.selectionColor
                        : widget.lineColor,
                    width: selectedColour == index ? 1.5 : 1),
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        widget.colourList.values.elementAt(index)[0],
                        scale: 1))),
          ),
          // An inkwell to make colours selectable
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: widget.alphaColor.withAlpha(128),
                  onTap: () {
                    if (colourListExpanded) {
                      closeColourList();
                    }
                    setState(() {
                      selectedColour = index;
                      productImages = Carousel(
                          key: Key(index.toString()),
                          dotColor: widget.buttonTextColor,
                          memberList: carouselList[
                              widget.colourList.keys.elementAt(index)]!);
                    });
                  }),
            ),
          ),
          // Stylised label text with the name of the colour
          Container(
            height: 18,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                backgroundBlendMode: BlendMode.multiply,
                color: selectedColour == index
                    ? widget.selectionColor.withAlpha(200)
                    : widget.alphaColor.withAlpha(200)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(widget.colourList.keys.elementAt(index),
                  style: GoogleFonts.raleway(color: widget.onAlphaColor)),
            ),
          ),
        ],
      );
    });
  }


  ///  Populating a carousel list for each colourway of the product.
  void populateCarousels() {
    for (String colour in widget.colourList.keys) {
      // For every colourway, we enter it's specific list in colourlist and make network images out of them to put in a carouselList
      carouselList[colour] =
          List.generate(widget.colourList[colour]!.length, (index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(widget.colourList[colour]![index]),
          ),
        );
      });
    }
  }


  ///Populating the dropdown menu for the size options.
  void populateSizelist(
      List<DropdownMenuItem<dynamic>> sizeMenuList, BuildContext context) {
    for (String element in widget.sizeList) {
      // for every size, add a dropdown menu item representing it to the list
      sizeMenuList.add(DropdownMenuItem(
          value: element,
          child: Container(
            decoration: BoxDecoration(
              border: Border(top: widget.sizeList.indexOf(element) != 0 ? BorderSide(color: widget.lineColor, width: 1.5): BorderSide.none,
                //color: Theme.of(context).canvasColor,borderRadius: BorderRadius.circular(40)
                )),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16, top: 12, bottom: 12),
            child: Text(element),
          )));
    }
  }
}
