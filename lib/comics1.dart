import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:retro/Global/global.dart';

int index1;
bool bool1 = false;
List<String> array = [
  "Tinkle comics played a huge part in developing a reading habit in me, and how could it not? The world in these comics is so rich, so diverse and so funny that it’s a pity some kids now might not know about its existence! I know there have been a few additions here and there, but for me Tinkle will always remain special because of these iconic characters. So let’s take a trip down memory lane and appreciate these guys for making our childhood so much fun.",
  "Spider-Man, comic-book character who was the original everyman superhero. In Spider-Man’s first story, in Marvel Comics’ Amazing Fantasy, no. 15 (1962), American teenager Peter Parker, a poor sickly orphan, is bitten by a radioactive spider. As a result of the bite, he gains superhuman strength, speed, and agility along with the ability to cling to walls. Writer Stan Lee and illustrator Steve Ditko created Spider-Man as a filler story for a canceled anthology series. At the time, a teenage lead hero was unheard of in comic books. However, young readers responded powerfully to Peter Parker, prompting an ongoing title and, ultimately, a media empire, including video games, several animated and one live-action television series, a live-action film franchise, and a Broadway musical."
];

class Comics1 extends StatefulWidget {
  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Comics1> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _listAnimation;
  var currentPage = image3.length - 1.0;

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
    PageController controller = PageController(initialPage: image3.length - 1);
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
                    itemCount: image3.length,
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
                                    image: ExactAssetImage(image3[index]),
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
