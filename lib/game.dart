import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:url_launcher/url_launcher.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> array = [
    "images/game.png",
    "images/game1.jpg",
    "images/game3.jpg",
    "images/game4.png",
    "images/game5.jpg",
    "images/game6.png",
    "images/game7.png",
    "images/game8.jpg",
    "images/game9.png"
  ];
  List<String> array1 = [
    "Super Mario Bros",
    "Super Mario Bros 2",
    "Super Mario Bros 3",
    "Contra",
    "Contra 2",
    "Contra 3",
    "Adventure Island",
    "Adventure Island 2",
    "Adventure Island 3"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Game Collection",
      body: Expanded(
        child: Container(
          child: GridView.builder(
              shrinkWrap: false,
              itemCount: array.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 0.0,
                        child: Container(
                            width: 190,
                            height: MediaQuery.of(context).size.height / 6,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: ExactAssetImage(array[index]),
                                  fit: BoxFit.fill),
                            )),
                      ),
                    ),
                    Button95(
                      child: Text(
                        array1[index],
                        style: Flutter95.textStyle,
                      ),
                      onTap: () {
                        _launchURL();
                      },
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.playretrogames.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
