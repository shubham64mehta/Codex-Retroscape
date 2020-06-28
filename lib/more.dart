import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';
import 'package:retro/retrofashion.dart';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "More",
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
                "Retro Clothes",
                style: Flutter95.textStyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Fashion()));
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
                "Vintage Books",
                style: Flutter95.textStyle,
              ),
              onTap: () {},
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 13,
          ),
          Elevation95(
            type: Elevation95Type.up,
            child: Button95(
              child: Text(
                "Vintage Collections",
                style: Flutter95.textStyle,
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
