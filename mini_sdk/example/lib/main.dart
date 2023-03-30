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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
    "https://cdn.discordapp.com/attachments/807179568754458684/1030946124778971136/Julvante_vrist_-_Stitch_Fiddle.png",
    "https://cdn.discordapp.com/attachments/807179568754458684/1030946424659128380/Julvante_F_-_Stitch_Fiddle.png",
    "https://cdn.discordapp.com/attachments/807179568754458684/1029049947590504568/DungeonQuest_UI_2_20221010051638.png",
    "https://cdn.discordapp.com/attachments/807179568754458684/1024122784873467914/Project_20220927025801.png",
    "https://cdn.discordapp.com/attachments/807179568754458684/1022632032167268352/Project_20220922091021.png",
    "https://cdn.discordapp.com/attachments/807179568754458684/1007392211446550528/yarnexample.jpeg",
    "https://cdn.discordapp.com/attachments/807179568754458684/1007358931728863282/20220722_164610.jpg",
    "https://cdn.discordapp.com/attachments/807179568754458684/996851328217251952/unknown.png",
    "https://cdn.discordapp.com/attachments/807179568754458684/996849837834260610/unknown.png"
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ProductPage(
              productName: "Test Product 1",
              sizeList: testList,
              colourList: list2,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
