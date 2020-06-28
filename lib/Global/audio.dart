import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

List<String> song = [
  "Lacalin",
  "They dont really care about us",
  "Summer of 69",
  "one Love"
];
List profile = [];

class Audio1 extends StatefulWidget {
  @override
  _Audio1State createState() => _Audio1State();
}

class _Audio1State extends State<Audio1> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
        title: "Audio",
        body: Expanded(
          child: Container(
              // height: MediaQuery.of(context).size.height / 2,
              child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Button95(
                      child: Text(
                        "Search",
                        style: Flutter95.textStyle,
                      ),
                      onTap: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 25,
                // color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/lacalin.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer
                                  .open(Audio('audio/Lacalin.mp3'));
                            }),
                        IconButton(
                            icon: Icon(Icons.pause),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.pause();
                            }),
                        IconButton(
                            icon: Icon(Icons.stop),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.stop();
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "song :" + "Lacalin",
                style: Flutter95.textStyle,
              ),
              Card(
                elevation: 25,
                // color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/miachel.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.open(Audio('audio/really.mp3'));
                            }),
                        IconButton(
                            icon: Icon(Icons.pause),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.pause();
                            }),
                        IconButton(
                            icon: Icon(Icons.stop),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.stop();
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "song :" + "They don't Really care about us",
                style: Flutter95.textStyle,
              ),
              Card(
                elevation: 25,
                // color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/summer.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer
                                  .open(Audio('audio/summerof69.mp3'));
                            }),
                        IconButton(
                            icon: Icon(Icons.pause),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.pause();
                            }),
                        IconButton(
                            icon: Icon(Icons.stop),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.stop();
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "song :" + "Summer of 69",
                style: Flutter95.textStyle,
              ),
              Card(
                elevation: 25,
                // color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage("images/bob.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.play_arrow),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.open(Audio('audio/retro.mp3'));
                            }),
                        IconButton(
                            icon: Icon(Icons.pause),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.pause();
                            }),
                        IconButton(
                            icon: Icon(Icons.stop),
                            color: Colors.white,
                            onPressed: () {
                              assetsAudioPlayer.stop();
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                "song :" + "One Love",
                style: Flutter95.textStyle,
              ),
            ],
          )),
        ));
  }
}

class DataSearch extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData.light();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app backgroundColor
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leadin icon on the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty
        ? profile
        : song.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: RichText(
              text: TextSpan(
                  text: suggestionlist[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: suggestionlist[index].substring(query.length),
                        style: TextStyle(color: Colors.black))
                  ]),
            ),
          );
        });
  }
}
