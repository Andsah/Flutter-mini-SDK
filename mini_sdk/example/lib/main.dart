import 'package:flutter/material.dart';
import 'package:mini_sdk/mini_sdk.dart';

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
        primarySwatch: Colors.brown,
      ),
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
  List<String> testList = [
    "xs",
    "s",
    "m",
    "l",
    "xl",
    "2xl",
    "3xl",
    "4xl",
    "5xl",
    "6xl"
  ];
  List<String> list2 = [
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/6/hobbii-amigo-xl-02-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-03-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-07-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-09-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-27-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-28-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-41-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-38-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-40-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-60-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-24-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-39-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-04-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-10-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-14-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-15-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-18-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-36-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-20-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-19-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-33-700xauto.jpg",
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-37-700xauto.jpg",
  ];

  String testid = "init";
  String testname = "init";
  int testquantity = 0;
  int testcolour = 0;
  String testsize = "init";

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ProductPage(
              price: 19.99,
              productId: "ag2FGt390Fk4",
              productName: "Hobbii Amigo XL",
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
            ),
            Text("$testid, $testname, $testquantity, $testcolour, $testsize.")
          ],
        ),
      ),
    );
  }
}
