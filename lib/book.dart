import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:retro/Global/global.dart';

int index1;
bool bool1 = false;
List<String> array = [
  "Twelve-year-old Percy Jackson is on the most dangerous quest of his life. With the help of a satyr and a daughter of Athena, Percy must journey across the United States to catch a thief who has stolen the original weapon of mass destruction — Zeus’ master bolt. Along the way, he must face a host of mythological enemies determined to stop him. Most of all, he must come to terms with a father he has never known, and an Oracle that has warned him of betrayal by a friend.",
  "When Thalia’s tree is mysteriously poisoned, the magical borders of Camp Half-Blood begin to fail. Now Percy and his friends have just days to find the only magic item powerful to save the camp before it is overrun by monsters. The catch: they must sail into the Sea of Monsters to find it. Along the way, Percy must stage a daring rescue operation to save his old friend Grover, and he learns a terrible secret about his own family, which makes him question whether being the son of Poseidon is an honor or a curse."
];

class Book extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _listAnimation;
  var currentPage = image2.length - 1.0;

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
    PageController controller = PageController(initialPage: image2.length - 1);
    controller.addListener(() {
      currentPage = controller.page;
    });
    var c = MediaQuery.of(context).size.width;
    var d = MediaQuery.of(context).size.height;
    return Scaffold95(
      title: "Old Novels",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                height: d / 2,
                child: Opacity(
                  opacity: _listAnimation.value,
                  child: Swiper(
                    itemCount: image2.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    loop: true,
                    layout: SwiperLayout.STACK,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.black,
                        child: InkWell(
                          child: Container(
                            width: c / 1.3,
                            height: d / 2.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: ExactAssetImage(image2[index]),
                                    fit: BoxFit.fill)),
                          ),
                          onTap: () {
                            setState(() {
                              index1 = index;
                              bool1 = true;
                            });
                          },
                          onDoubleTap: () {
                            setState(() {
                              bool1 = false;
                            });
                          },
                        ),
                      );
                    },
                    curve: Curves.easeInOut,
                  ),
                )),
            if (bool1 == true) Text(array[index1], style: Flutter95.textStyle),
            if (bool1 == true)
              Button95(
                child: Text(
                  "Read More",
                  style: Flutter95.textStyle,
                ),
                onTap: () {},
              )
          ],
        ),
      ),
    );
  }
}
