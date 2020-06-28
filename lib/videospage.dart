import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutterretroapp/thumbnail.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videoonepage extends StatefulWidget {
  const Videoonepage({Key key}) : super(key: key);
  @override
  _VideoonepageState createState() => _VideoonepageState();
}

class _VideoonepageState extends State<Videoonepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String videoURL = "https://www.youtube.com/watch?v=2G_UUDdzHiQ";
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
          "https://www.youtube.com/watch?v=2G_UUDdzHiQ"),
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
                      Allvideos(),
                      Favorites(),
                      Search(),
                      Trivia(),
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

class Allvideos extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => Videonextpage()));
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
                    MaterialPageRoute(builder: (context) => Videotwopage()));
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
                    MaterialPageRoute(builder: (context) => Videoonepage()));
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
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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

class Trivia extends StatelessWidget {
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

class Videonextpage extends StatefulWidget {
  const Videonextpage({Key key}) : super(key: key);
  @override
  _VideonextpageState createState() => _VideonextpageState();
}

class _VideonextpageState extends State<Videonextpage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String videoURL = "https://www.youtube.com/watch?v=iooYwAcjyQg";
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
          "https://www.youtube.com/watch?v=iooYwAcjyQg"),
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
                      Allvideostwo(),
                      Favoritestwo(),
                      Searchtwo(),
                      Triviatwo(),
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

class Allvideostwo extends StatelessWidget {
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
                    MaterialPageRoute(builder: (context) => Videotwopage()));
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
                    MaterialPageRoute(builder: (context) => Videoonepage()));
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
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Favoritestwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Searchtwo extends StatefulWidget {
  @override
  _SearchtwoState createState() => _SearchtwoState();
}

class _SearchtwoState extends State<Searchtwo> {
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

class Triviatwo extends StatelessWidget {
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

class Videotwopage extends StatefulWidget {
  const Videotwopage({Key key}) : super(key: key);
  @override
  _VideotwopageState createState() => _VideotwopageState();
}

class _VideotwopageState extends State<Videotwopage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  String videoURL = "https://www.youtube.com/watch?v=4LmIyMyAuN0";
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
          "https://www.youtube.com/watch?v=4LmIyMyAuN0"),
    )..addListener(listener);
    _videoMetaData = YoutubeMetaData();
    tabList.add(
      Tab(
        icon: Icon(Icons.library_books, color: Colors.purple),
        text: "Lectures",
      ),
    );
    tabList.add(
      Tab(
        icon: Icon(Icons.explore, color: Colors.purple),
        text: "Formulae",
      ),
    );
    tabList.add(
      Tab(icon: Icon(Icons.attach_file, color: Colors.purple), text: "Notes"),
    );
    tabList.add(
      Tab(icon: Icon(Icons.forum, color: Colors.purple), text: "Doubt"),
    );
    tabList.add(
      Tab(icon: Icon(Icons.assignment, color: Colors.purple), text: "Test"),
    );
    _tabController = TabController(length: 5, vsync: this);
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
                      Lecturestwo(),
                      Formulaetwo(),
                      Notestwo(),
                      Doubttwo(),
                      Testtwo(),
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

class Lecturestwo extends StatelessWidget {
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
                'Section 1-',
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
              contentPadding: EdgeInsets.only(left: 17, top: 8),
              leading: Icon(
                Icons.playlist_play,
                color: Colors.black,
                size: 30,
              ),
            ),
            ListTile(
              title: Text('Introduction', style: TextStyle(fontSize: 22)),
              leading: Icon(
                Icons.filter_1,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.picture_as_pdf,
                  color: Colors.red,
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.star,
                  color: Colors.indigo,
                ),
              ]),
              onTap: () {
                //Navigator.push(context,
                // MaterialPageRoute(builder: (context) => Thumbnailput()));
                // Update the state of the app
                // ...
                // Then close the drawer
              },
            ),
            ListTile(
              title: Text(
                'Lecture name-2',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.filter_2,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
            ListTile(
              title: Text(
                'Lecture name-3',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.filter_3,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
            ListTile(
              title: Text(
                'Section 2-',
                style: TextStyle(fontSize: 20, color: Colors.black45),
              ),
              contentPadding: EdgeInsets.only(left: 17, top: 8),
              leading: Icon(
                Icons.playlist_play,
                color: Colors.black,
                size: 30,
              ),
            ),
            ListTile(
              title: Text(
                'Another video',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.filter_4,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
            ListTile(
              title: Text(
                'Another video',
                style: TextStyle(fontSize: 22),
              ),
              leading: Icon(
                Icons.filter_5,
                color: Colors.black,
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(
                  Icons.check_circle_outline,
                ),
                Icon(
                  Icons.star_border,
                ),
              ]),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Videoonepage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Formulaetwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Notestwo extends StatefulWidget {
  @override
  _NotestwoState createState() => _NotestwoState();
}

class _NotestwoState extends State<Notestwo> {
  List<Icon> icons = List();
  List<String> titles = [
    "Announcements",
    "Resources",
    "Share this Course",
    "Downloads",
    "Add Something",
    "Add Something"
  ];

  @override
  void initState() {
    icons.add(Icon(Icons.announcement, color: Colors.purple));
    icons.add(Icon(Icons.import_contacts, color: Colors.purple));
    icons.add(Icon(Icons.share, color: Colors.purple));
    icons.add(Icon(Icons.file_download, color: Colors.purple));
    icons.add(Icon(Icons.attach_file, color: Colors.purple));
    icons.add(Icon(Icons.attach_file, color: Colors.purple));
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

class Doubttwo extends StatelessWidget {
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
                " Public",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              onPressed: null,
              color: Colors.blue,
              child: Text(
                " Private",
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

class Testtwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              color: Colors.blue,
              child: Text(
                "MCQ",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              onPressed: null,
              color: Colors.purple,
              child: Text(
                " Previous Year Questions",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              onPressed: null,
              color: Colors.blue,
              child: Text(
                " NCERT Questions",
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
