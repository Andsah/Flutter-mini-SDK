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
      this.height = 0,
      this.dotColor = const Color(0xFFBDBDBD),  
      this.alphaColor = const Color(0xFF9E9E9E),
      this.onAlphaColor = const Color(0xFFFFFFFF),});

  final List<Widget> memberList;
  final double width;
  final Color dotColor;
  final Color alphaColor;
  final Color onAlphaColor;
  final double height;

  @override
  State<StatefulWidget> createState() => CarouselState();
}

class CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  /// offset value bakes in a margin of size 10 on either side and makes sure the animation is seamless
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width + 22,
      height: widget.height == 0 ? null : widget.height,
      child: ClipRect(
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            // hide the first two children when not animating, the third child is the center child, so it always renders on top
            children: [
              Visibility(
                // hide one of the side widgets even when animating if it will never come into view
                visible: carouselController.isAnimating && timeToReverse ? carouselController.status == AnimationStatus.reverse : carouselController.status == AnimationStatus.forward,
                child: SizedBox(
                  width: widget.width,
                  height: widget.height == 0 ? null : widget.height,
                  child: Transform.translate(
                    offset: Offset(-widget.width - 10, 0),
                    child: SlideTransition(
                        // depending on the direction the widgets should move in, play either animation
                        position: timeToReverse ? resetAnimation : offsetAnimation,
                        child: widget.memberList[
                            (currentIndex - 1) % widget.memberList.length]),
                  ),
                ),
              ),
              Visibility(
                // hide one of the side widgets even when animating if it will never come into view
                visible: carouselController.isAnimating && timeToReverse ? carouselController.status == AnimationStatus.forward : carouselController.status == AnimationStatus.reverse,
                child: SizedBox(
                  width: widget.width,
                  child: Transform.translate(
                    offset: Offset(widget.width + 10, 0),
                    child: SlideTransition(
                        position:
                            // depending on the direction the widgets should move in, play either animation
                            timeToReverse ? resetAnimation : offsetAnimation,
                        child: widget.memberList[
                            (currentIndex + 1) % widget.memberList.length]),
                  ),
                ),
              ),
              SizedBox(
                width: widget.width,
                child: SlideTransition(
                    // depending on the direction the widgets should move in, play either animation
                    position: timeToReverse ? resetAnimation : offsetAnimation,
                    child: widget.memberList[currentIndex]),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: widget.memberList.length > 1 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // left arrow
                    GestureDetector(
                      onTap: () {
                        // play animation forward, then update current index then blink back to original position seamlessly
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
                            color: widget.alphaColor.withAlpha(200)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: widget.onAlphaColor,
                            size: 50,
                          ),
                        ),
                      ),
                    ),

                    // right arrow
                    GestureDetector(
                      onTap: () {
                        // play animation forward, then update current index then blink back to original position seamlessly
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
                            color: widget.alphaColor.withAlpha(200)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              color: widget.onAlphaColor, size: 50),
                        ),
                      ),
                    )
                  ],
                ) : const SizedBox(),
              )
            ],
          ),

          // Row with a list of dots to indicate position in the carousel
          widget.memberList.length > 1 ? SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.memberList.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
                  child: CircleAvatar(
                      backgroundColor: widget.dotColor,
                      // current index dot is bigger
                      radius: index == currentIndex ? 8 : 4),
                );
              }),
            ),
          ) : const SizedBox()
        ]),
      ),
    );
  }
}
