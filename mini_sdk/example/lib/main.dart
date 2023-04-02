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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-24-700xauto.jpg"
  ];

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
              callback: () {},
            )
          ],
        ),
      ),
    );
  }
}
