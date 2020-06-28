import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro/Global/global.dart';
import 'package:retro/Global/audio.dart';
import 'package:retro/game.dart';
import 'package:retro/google.dart';
import 'package:retro/main.dart';
import 'package:retro/more.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: 'Once upon a time!',
      toolbar: Toolbar95(actions: [
        Item95(
          label: 'Notifications',

          onTap: (context) {},
// TODO: WIP
//          menu: [
//            MenuItem95(
//              value: 1,
//              label: 'New',
//            ),
//          ],
        ),
        Item95(
          label: '   Help',
          onTap: (context) {},
        ),
        Item95(
          label: '  Settings',
          onTap: (context) {},
        ),
        Item95(
          label: '  Logout',
          onTap: (context) async {
            signOutGoogle();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('already');
            prefs.remove('name');
            prefs.remove('image');
            prefs.remove('email');
            Navigator.popAndPushNamed(context, '/Home1');
          },
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Column(
          children: <Widget>[
            SizedBox(height: 17),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 60.0,
            ),
            const SizedBox(height: 14),
            Text('WELCOME ' + name, style: Flutter95.textStyle),
            SizedBox(height: 5),
            Text('"Where modern meets retro"', style: Flutter95.textStyle),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.green,
                  backgroundImage: ExactAssetImage('images/audio.png'),
                  radius: 60.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  backgroundImage: ExactAssetImage(
                    'images/videopic.png',
                  ),
                  radius: 60.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Button95(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Audio1()));
                    },
                    child: Text('Audios'),
                  ),
                  Button95(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Text('Videos'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: ExactAssetImage('images/gamesnew.png'),
                  radius: 60.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: ExactAssetImage('images/retro.png'),
                  radius: 60.0,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Button95(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Game()));
                    },
                    child: Text('Games'),
                  ),
                  Button95(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => More()));
                    },
                    child: Text('Click for more'),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build a ListView wrapping it in [Elevation95] with [Elevation95Type.down].
  /// This will create a "deep" container.
  /// Then wrap each item with [Elevation95Type.up] to create an up effect.

}

class ScreenThatCanPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: 'Screen that can pop',
      body: Container(),
    );
  }
}
