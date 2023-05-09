import 'package:flutter/material.dart';
import 'package:mini_sdk/mini_sdk.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: lightMode),
      darkTheme: ThemeData(
          colorScheme: darkMode),
      home: const MyHomePage(title: 'Hobbii Amigo XL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String testid = "init";
  String testname = "init";
  int testquantity = 0;
  String testcolour = "init";
  String testsize = "init";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:8,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(tabs: [Tab(icon: Icon(Icons.star_border_purple500_sharp)), 
          Tab(icon: Icon(Icons.access_alarm)), 
          Tab(icon: Icon(Icons.account_balance_rounded)), 
          Tab(icon: Icon(Icons.baby_changing_station)),
          Tab(icon: Icon(Icons.macro_off_rounded)),
          Tab(icon: Icon(Icons.cabin_rounded)),
          Tab(icon: Icon(Icons.face_2_outlined)),
          Tab(icon: Icon(Icons.label_important_outline_sharp))]),
        ),
        body: TabBarView(
          children: [SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  colourList: list1,
                  callback: (id, name, quantity, colour) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  colourList: list2,
                  callback: (id, name, quantity, colour) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  sizeList: testList,
                  colourList: list1,
                  callback: (id, name, quantity, colour, size) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                      testsize = size;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour, $testsize.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  sizeList: testList,
                  colourList: list2,
                  callback: (id, name, quantity, colour, size) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                      testsize = size;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour, $testsize.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  colourList: list3,
                  callback: (id, name, quantity, colour) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  sizeList: testList,
                  colourList: list4,
                  callback: (id, name, quantity, colour, size) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                      testsize = size;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour, $testsize.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ProductPage(
                  price: 19.99,
                  priceText: "\$19.99",
                  productId: "ag2FGt390Fk4",
                  productName: "Hobbii Amigo XL",
                  productDescription: productDescription,
                  colourList: list5,
                  callback: (id, name, quantity, colour) {
                    setState(() {
                      testid = id;
                      testname = name;
                      testquantity = quantity;
                      testcolour = colour;
                    });
                  },
                  selectionColor: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onBackground,
                  lineColor: Theme.of(context).colorScheme.onSecondary,
                  buttonTextColor: Theme.of(context).colorScheme.secondary,
                  alphaColor: Theme.of(context).colorScheme.tertiary,
                  onAlphaColor: Theme.of(context).colorScheme.onTertiary,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    "$testid, $testname, $testquantity, $testcolour",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceCodePro(fontSize: 18),
                  ))
              ],
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Carousel(memberList: textList, width: 390, alphaColor: Colors.green, onAlphaColor: Colors.purple,),
            Carousel(memberList: widgetList, width: 300, alphaColor: const Color.fromARGB(0, 255, 255, 255))
          ],)
          ],
        ),
      ),
    );
  }
}
