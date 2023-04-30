import 'package:flutter/foundation.dart';
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
  int currentIndex =
      0; // strangely this seems to be saved between carousels which causes index overflow in the ones with fewer images.

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(children: [
        //Text(widget.memberList.toString()),
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // row will contain the three panes of the carousel,
              children: [widget.memberList[currentIndex]],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex -= 1;
                      currentIndex = currentIndex % widget.memberList.length;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        backgroundBlendMode: BlendMode.multiply,
                        color: Colors.grey.withAlpha(200)),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex += 1;
                      currentIndex = currentIndex % widget.memberList.length;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50)),
                        backgroundBlendMode: BlendMode.multiply,
                        color: Colors.grey.withAlpha(200)),
                    child: const Icon(Icons.arrow_forward_ios_rounded,
                        color: Colors.white, size: 50),
                  ),
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}
