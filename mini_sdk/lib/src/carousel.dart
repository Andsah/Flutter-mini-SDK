import 'package:flutter/material.dart';

/*
Product page class, fulfills the design pattern found at 
-> https://ui-patterns.com/patterns/Carousel <-
 */
class Carousel extends StatefulWidget {
  const Carousel(
      {super.key,
      required this.memberList,
      this.width = 390,
      this.dotColour = const Color.fromRGBO(189, 189, 189, 1)});

  final List<Widget> memberList;
  final double width;
  final Color dotColour;

  @override
  State<StatefulWidget> createState() => CarouselState();
}

class CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  double get offsetValue => (widget.width + 10) / widget.width;

  late final AnimationController carouselController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 320))
    ..addListener(() {
      setState(() {});
    });

  bool timeToReverse = false;

  late final Animation<Offset> offsetAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(offsetValue, 0)).animate(
          CurvedAnimation(
              parent: carouselController, curve: Curves.fastOutSlowIn));

  late final Animation<Offset> resetAnimation =
      Tween<Offset>(begin: Offset.zero, end: Offset(-offsetValue, 0)).animate(
          CurvedAnimation(
              parent: carouselController, curve: Curves.fastOutSlowIn));

  @override
  void dispose() {
    carouselController.dispose();
    currentIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width + 22,
      child: ClipRect(
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Visibility(
                visible: carouselController.isAnimating,
                child: Transform.translate(
                  offset: Offset(-widget.width - 10, 0),
                  child: SlideTransition(
                      position:
                          timeToReverse ? resetAnimation : offsetAnimation,
                      child: widget.memberList[
                          (currentIndex - 1) % widget.memberList.length]),
                ),
              ),
              Visibility(
                visible: carouselController.isAnimating,
                child: Transform.translate(
                  offset: Offset(widget.width + 10, 0),
                  child: SlideTransition(
                      position:
                          timeToReverse ? resetAnimation : offsetAnimation,
                      child: widget.memberList[
                          (currentIndex + 1) % widget.memberList.length]),
                ),
              ),
              SlideTransition(
                  position: timeToReverse ? resetAnimation : offsetAnimation,
                  child: widget.memberList[currentIndex]),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        carouselController.forward().then((value) {
                          setState(() {
                            currentIndex -= 1;
                            currentIndex =
                                currentIndex % widget.memberList.length;
                          });
                        }).then((value) => carouselController.reset());
                        timeToReverse = false;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            backgroundBlendMode: BlendMode.multiply,
                            color: Colors.grey.withAlpha(200)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        carouselController.forward().then((value) {
                          setState(() {
                            currentIndex += 1;
                            currentIndex =
                                currentIndex % widget.memberList.length;
                          });
                        }).then((value) => carouselController.reset());
                        timeToReverse = true;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            backgroundBlendMode: BlendMode.multiply,
                            color: Colors.grey.withAlpha(200)),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.white, size: 50),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            // wow this one took like 5 min of me brainstorming wow
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.memberList.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: CircleAvatar(
                      backgroundColor: widget.dotColour,
                      radius: index == currentIndex ? 8 : 4),
                );
              }),
            ),
          )
        ]),
      ),
    );
  }
}
