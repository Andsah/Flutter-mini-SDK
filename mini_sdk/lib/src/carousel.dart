import 'package:flutter/material.dart';

/*
Product page class, fulfills the design pattern found at 
-> https://ui-patterns.com/patterns/Carousel <-
 */
class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    required this.memberList,
  });

  final List<Widget> memberList;

  @override
  State<StatefulWidget> createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
