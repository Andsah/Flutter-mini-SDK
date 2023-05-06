import 'package:flutter/material.dart';
import 'package:mini_sdk/mini_sdk.dart';
import 'package:google_fonts/google_fonts.dart';

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
        primarySwatch: Colors.indigo,
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

  Map<String, List<String>> list1 = {
    "blue": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-19-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
  };

  Map<String, List<String>> list2 = {
    "blue": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-19-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "green": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-03-700xauto.jpg"
    ],
    "beige": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-07-700xauto.jpg"
    ],
    "black": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-09-700xauto.jpg"
    ],
    "red": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-27-700xauto.jpg"
    ],
    "flax": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-28-700xauto.jpg"
    ],
    "maroon": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-41-700xauto.jpg"
    ],
    "094": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-38-700xauto.jpg"
    ],
    "092": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-40-700xauto.jpg"
    ],
    "107": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-60-700xauto.jpg"
    ],
    "salmon": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-24-700xauto.jpg"
    ],
    "curry": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-39-700xauto.jpg"
    ],
    "emerald": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-04-700xauto.jpg"
    ],
    "navy": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-10-700xauto.jpg"
    ],
    "lime": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-14-700xauto.jpg"
    ],
    "sunflower": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-15-700xauto.jpg"
    ],
    "tawny": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-18-700xauto.jpg"
    ],
    "varigated": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-36-700xauto.jpg"
    ],
    "midnight": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-20-700xauto.jpg"
    ],
    "terracotta": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-19-700xauto.jpg"
    ],
    "jade": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-33-700xauto.jpg"
    ],
    "grey": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-37-700xauto.jpg"
    ]
  };

  String testid = "init";
  String testname = "init";
  int testquantity = 0;
  String testcolour = "init";
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ProductPage(
                price: 19.99,
                priceText: "\$19.99",
                productId: "ag2FGt390Fk4",
                productName: "Hobbii Amigo XL",
                productDescription:
                    """Amigo XL är ett av dessa ljuvligt fantastiska garner som är så enkla att arbeta med, att de flyger fram över stickorna och virknålen. Det är mjukt och behagligt och är producerat i 100% HB akryl i en riktigt god kvalité i ett stort urval av färger.
                            
HB står för High-bulk. Det är ett garn som bearbetas med ånga och press som får fibrerna att krympa lite och locka sig så att det blir fylligare. Resultatet är ett lätt och mjukt garn, som både är behagligt att arbeta med och att klä sig i.
                            
Amigo XL är dubbelt så tjockt som Amigo, och kan därför stickas eller virkas på 5 mm. Här ser du snabbt resultat. Det mjuka garnet är perfekt till många kreativa, färgrika projekt. Det kliar absolut inte och är därför skönt till filtar, tröjor, mössor, halsdukar m.m. Det luftiga garnet håller dig varm och blir inte för tungt.
                           
Hele Amigo-serien utmärker sig genom sin lätta volym, den enhetliga strukturen och den goda hållbarheten. Det kan maskintvättas på 30°C, perfekt till vardagsbruk. Färg och form håller sig tvätt efter tvätt. Tåler du inte ull, eller vill du av andra orsaker avstå animaliska fibrer, då kan du med fördel ersätta ull med Amigo och få ett mjukt och härligt resultat.

Garnet är OEKO-TEX®-certifierat (nr. 2076-311). Se mer information om certifieringen på """,
                //sizeList: testList,
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
                accentColor: Colors.indigo,
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
