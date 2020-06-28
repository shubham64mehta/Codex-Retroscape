import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutterretroapp/thumbnail.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoenglish extends StatefulWidget {
  const Videoenglish({Key key}) : super(key: key);
  @override
  _VideoenglishState createState() => _VideoenglishState();
}

class _VideoenglishState extends State<Videoenglish>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String videoURL = "https://www.youtube.com/watch?v=oMcPFFMIe6Y";
  YoutubePlayerController _controller;
  YoutubeMetaData _videoMetaData;
  PlayerState _playerState;
  bool _isPlayerReady = false;
  List<Tab> tabList = List();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=oMcPFFMIe6Y"),
    )..addListener(listener);
    _videoMetaData = YoutubeMetaData();
    tabList.add(
      Tab(
        icon: Icon(Icons.video_library, color: Colors.blueGrey),
        text: "All videos",
      ),
    );
    tabList.add(
      Tab(
        icon: Icon(Icons.favorite, color: Colors.blueGrey),
        text: "Favorites",
      ),
    );
    tabList.add(
      Tab(icon: Icon(Icons.search, color: Colors.blueGrey), text: "Search"),
    );
    tabList.add(
      Tab(icon: Icon(Icons.language, color: Colors.blueGrey), text: "Trivia"),
    );

    _tabController = TabController(length: 4, vsync: this);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                YoutubePlayer(
                  controller: _controller,
                ),
                Container(
                  height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(_controller.metadata.title),
                  ),
                ),
                Container(
                  color: Colors.white70,
                  child: TabBar(
                    labelColor: Colors.purple,
                    controller: _tabController,
                    indicatorColor: Colors.purple,
                    tabs: tabList,
                  ),
                ),
                Container(
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    // children: tabList.map((Tab tab){
                    //   return _getPage(tab);
                    // } ).toList(),
                    children: [
                      AllvideosE(),
                      FavoritesE(),
                      SearchE(),
                      TriviaE(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AllvideosE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Video 1-',
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
              subtitle: Text('Extra info about video'),
              leading: Icon(
                Icons.play_circle_filled,
                color: Colors.redAccent,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star,
                  color: Colors.indigo,
                ),
              ]),
            ),
            ListTile(
              title: Text('Video 2', style: TextStyle(fontSize: 22)),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VideonextpageE()));
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
            ListTile(
              title: Text(
                'Video 3',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(Icons.file_download, color: Colors.black),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
            ListTile(
              title: Text(
                'Video 4',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
            ListTile(
              title: Text(
                'Video 5',
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
            ),
            ListTile(
              title: Text(
                'Another video',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SearchE extends StatefulWidget {
  @override
  _SearchEState createState() => _SearchEState();
}

class _SearchEState extends State<SearchE> {
  List<Icon> icons = List();
  List<String> titles = [
    "Search video",
    "Lyrics",
  ];

  @override
  void initState() {
    icons.add(Icon(Icons.search, color: Colors.purple));
    icons.add(Icon(Icons.library_books, color: Colors.purple));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: icons.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          leading: icons[index],
          title: Text(titles[index]),
          trailing: Icon(Icons.arrow_forward),
        );
      },
    );
  }
}

class TriviaE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              color: Colors.blue,
              child: Text(
                " Click here for more interesting facts",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideonextpageE extends StatefulWidget {
  const VideonextpageE({Key key}) : super(key: key);
  @override
  _VideonextpageEState createState() => _VideonextpageEState();
}

class _VideonextpageEState extends State<VideonextpageE>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String videoURL = "https://www.youtube.com/watch?v=-tJYN-eG1zk";
  YoutubePlayerController _controller;
  YoutubeMetaData _videoMetaData;
  PlayerState _playerState;
  bool _isPlayerReady = false;
  List<Tab> tabList = List();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
          "https://www.youtube.com/watch?v=-tJYN-eG1zk"),
    )..addListener(listener);
    _videoMetaData = YoutubeMetaData();
    tabList.add(
      Tab(
        icon: Icon(Icons.video_library, color: Colors.blueGrey),
        text: "All videos",
      ),
    );
    tabList.add(
      Tab(
        icon: Icon(Icons.favorite, color: Colors.blueGrey),
        text: "Favorites",
      ),
    );
    tabList.add(
      Tab(icon: Icon(Icons.search, color: Colors.blueGrey), text: "Search"),
    );
    tabList.add(
      Tab(icon: Icon(Icons.language, color: Colors.blueGrey), text: "Trivia"),
    );

    _tabController = TabController(length: 4, vsync: this);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                YoutubePlayer(
                  controller: _controller,
                ),
                Container(
                  height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(_controller.metadata.title),
                  ),
                ),
                Container(
                  color: Colors.white70,
                  child: TabBar(
                    labelColor: Colors.purple,
                    controller: _tabController,
                    indicatorColor: Colors.purple,
                    tabs: tabList,
                  ),
                ),
                Container(
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    // children: tabList.map((Tab tab){
                    //   return _getPage(tab);
                    // } ).toList(),
                    children: [
                      Allvideostwoe(),
                      Favoritestwoe(),
                      Searchtwoe(),
                      Triviatwoe(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Allvideostwoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Video 1-',
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
              subtitle: Text('Extra info about video'),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star,
                  color: Colors.indigo,
                ),
              ]),
            ),
            ListTile(
              title: Text('Video 2', style: TextStyle(fontSize: 22)),
              leading: Icon(
                Icons.play_circle_filled,
                color: Colors.redAccent,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (context) => Thumbnailput()));
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
            ListTile(
              title: Text(
                'Video 3',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(Icons.file_download, color: Colors.black),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
            ListTile(
              title: Text(
                'Video 4',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
            ListTile(
              title: Text(
                'Video 5',
                style: TextStyle(fontSize: 22, color: Colors.black45),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
            ),
            ListTile(
              title: Text(
                'Another video',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.play_circle_outline,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.file_download,
                  color: Colors.black,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoenglish()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Favoritestwoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Searchtwoe extends StatefulWidget {
  @override
  _SearchtwoeState createState() => _SearchtwoeState();
}

class _SearchtwoeState extends State<Searchtwoe> {
  List<Icon> icons = List();
  List<String> titles = [
    "Search video",
    "Lyrics",
  ];

  @override
  void initState() {
    icons.add(Icon(Icons.search, color: Colors.purple));
    icons.add(Icon(Icons.library_books, color: Colors.purple));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: icons.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          leading: icons[index],
          title: Text(titles[index]),
          trailing: Icon(Icons.arrow_forward),
        );
      },
    );
  }
}

class Triviatwoe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              color: Colors.blue,
              child: Text(
                " Click here for more interesting facts",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
