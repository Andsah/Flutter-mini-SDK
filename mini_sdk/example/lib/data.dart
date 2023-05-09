import 'package:flutter/material.dart';

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

  String productDescription = """Amigo XL is one of those wonderful types of yarn that is so easy to work with that it flies over the needle or hook. It is soft and comfortable and is produced in 100% HB acrylic of a very high quality and comes in an enormous selection of colors.

HB stands for High-bulk. It is a production technique that uses steam and pressure to make the fibers contract a little and curl so that they become fuller. The result is a light and soft yarn that is both comfortable to work with and to wear on the body.

Amigo XL has double the thickness of Amigo, and can therefore be knitted or crocheted on a size 5 mm needle or hook. You will see quick results. The soft yarn is suitable for lots of creative, colorful projects. It definitely does not scratch, and is therefore great to use for blankets, sweaters, hats, scarves, etc. The airy yarn will keep you warm and won’t get too heavy.

The entire Amigo series is distinguished by its light volume, uniform structure and great durability. It can be machine washed at 30°C, perfect for everyday use. Colors and shape will hold up to wash after wash. If you’re allergic to wool, or if you want to opt out of animal fibers for other reasons, you can replace it with Amigo for a soft and lovely result.

The yarn is OEKO-TEX® certified (no. 2076-311). Find more information about the certification on the https://www.oeko-tex.com/en/ """;

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
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-19-700xauto.jpg"
    ],
    "green": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-03-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg"
    ],
    "beige": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-07-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg"
    ],
    "black": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-09-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
    ],
    "red": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-27-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "flax": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-28-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "maroon": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-41-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "094": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-38-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "092": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-40-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "107": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-60-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "salmon": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-24-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "curry": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-39-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "emerald": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-04-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "navy": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "lime": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-14-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "sunflower": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-15-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "tawny": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-18-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "varigated": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-36-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "midnight": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-20-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "terracotta": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-19-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "jade": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-33-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "grey": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-37-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ]
  };

  Map<String, List<String>> list3 = {
    
    "beige": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-07-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg"
    ],
    "black": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-09-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
    ],
    "red": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-27-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "flax": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-28-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "maroon": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-41-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "094": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-38-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "092": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-40-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "107": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-60-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ]
  };

  Map<String, List<String>> list4 = {
    
    "beige": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-07-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg"
    ],
    "black": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-09-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
    ],
    "red": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-27-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "flax": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-28-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "maroon": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-41-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ]
  };

  Map<String, List<String>> list5 = {
    
    "beige": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-07-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg"
    ],
    "black": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2022/2/hobbii-amigo-xl-09-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
    ],
    "red": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-27-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ],
    "flax": [
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2020/10/hobbii-amigo-xl-28-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-januarudsalg-1-1-picture-sylwia-winter-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/amigoxl-1-1-picture-sylwia-springflowers-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/9/ami-xl-pu-10-700xauto.jpg",
      "https://d2tk9av7ph0ga6.cloudfront.net/image/catalog/2021/2/1614238006-amigo-700xauto.jpg"
    ]
  };

List<Text> textList = [
    const Text("Hejsan", textAlign: TextAlign.center),
    const Text("Vill", textAlign: TextAlign.center),
    const Text("Du", textAlign: TextAlign.center),
    const Text("Åka", textAlign: TextAlign.center),
    const Text("På", textAlign: TextAlign.center),
    const Text("En", textAlign: TextAlign.center),
    const Text("Karosell", textAlign: TextAlign.center)];

List<Widget> widgetList = [Container(color: Colors.red, height: 300, width: 300),
    Container(color: Colors.yellow, height: 300, width: 100),
    Container(color: Colors.blue, height: 500, width: 200),
    Container(color: Colors.purple, height: 100, width: 700),
    Container(color: Colors.green, height: 200, width: 200),
    Container(color: Colors.pink, height: 600, width: 50),
    Container(color: Colors.black, height: 400, width: 400),
    Container(color: Colors.grey.shade100, height: 400, width: 100),];