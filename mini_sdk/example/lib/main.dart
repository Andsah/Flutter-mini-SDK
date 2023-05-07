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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProductPage(
                price: 19.99,
                priceText: "\$19.99",
                productId: "ag2FGt390Fk4",
                productName: "Hobbii Amigo XL",
                productDescription: productDescription,
                //sizeList: testList,
                colourList: list2, // list1,
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
      ),
    );
  }
}
