import 'package:flutter/material.dart';
import 'package:flutter95/flutter95.dart';

class Collection extends StatefulWidget {
  @override
  _CollectionState createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold95(
      title: "Collection",
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 3),
          Text(
            "Comming Soon........",
            style: Flutter95.textStyle,
          ),
        ],
      ),
    );
  }
}
