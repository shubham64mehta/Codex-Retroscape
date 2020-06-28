import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:retro/Global/global.dart';

class Fashion extends StatefulWidget {
  @override
  _FashionState createState() => _FashionState();
}

class _FashionState extends State<Fashion> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _listAnimation;
  var currentPage = image.length - 1.0;

  var widgetAspectRatio = cardAspectRatio * 1.2;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.40, 0.75, curve: Curves.easeOut)));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: image.length - 1);
    controller.addListener(() {
      currentPage = controller.page;
    });
    var c = MediaQuery.of(context).size.width;
    var d = MediaQuery.of(context).size.height;
    return Scaffold95(
      title: "Retro Clothes",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "70's",
              style: Flutter95.textStyle,
            ),
            Container(
                height: d / 2.5,
                child: Opacity(
                  opacity: _listAnimation.value,
                  child: Swiper(
                    itemCount: image.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    loop: true,
                    layout: SwiperLayout.STACK,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.black,
                        child: Container(
                          width: c / 1.3,
                          height: d / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: ExactAssetImage(image[index]),
                                  fit: BoxFit.fill)),
                        ),
                      );
                    },
                    curve: Curves.easeInOut,
                  ),
                )),
            Text(
              "80's",
              style: Flutter95.textStyle,
            ),
            Container(
                height: d / 2.5,
                child: Opacity(
                  opacity: _listAnimation.value,
                  child: Swiper(
                    itemCount: image1.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    loop: true,
                    layout: SwiperLayout.STACK,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.black,
                        child: Container(
                          width: c / 1.3,
                          height: d / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: ExactAssetImage(image1[index]),
                                  fit: BoxFit.fill)),
                        ),
                      );
                    },
                    curve: Curves.easeInOut,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
