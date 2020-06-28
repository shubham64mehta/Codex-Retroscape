import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro/book.dart';
import 'package:retro/comics1.dart';

class Comics extends StatefulWidget {
  @override
  _ComicsState createState() => _ComicsState();
}

class _ComicsState extends State<Comics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Books",
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: Button95(
              child: Text(
                "Old Comics",
                style: Flutter95.textStyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Comics1()));
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 18,
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: Button95(
              child: Text(
                "Old Novels",
                style: Flutter95.textStyle,
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Book()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
