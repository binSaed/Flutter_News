import 'dart:math';

import 'package:flutter/material.dart';

class Favourits extends StatefulWidget {
  @override
  _FavouritsState createState() => _FavouritsState();
}

class _FavouritsState extends State<Favourits> {
  List<Color> _listColors = [
    Colors.blue,
    Colors.pink,
    Colors.amberAccent,
    Colors.purpleAccent,
    Colors.lightGreenAccent,
    Colors.deepOrangeAccent
  ];
  Random _random = Random();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, position) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                _authorRow(),
                SizedBox(
                  height: 16,
                ),
                _newsItemRow(),
              ],
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage('assets/images/testimg.jpg'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(
                right: 16,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "AbdOo Test",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "15 Min .",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Live Style",
                      style: TextStyle(
                        color: _colorRandom(),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        IconButton(
          color: Colors.grey,
          icon: Icon(
            Icons.bookmark_border,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage('assets/images/testimg.jpg'),
                fit: BoxFit.cover),
          ),
          height: 100,
          width: 100,
          margin: EdgeInsets.only(
            right: 16,
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "Test Text To Test The Text, Test Text To Test The Text",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                "Test Text To Test The Text, Test Text To Test The Text, Test Text To Test The Text",
                style: TextStyle(fontSize: 16, height: 1.2, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _colorRandom() {
    return _listColors[_random.nextInt(_listColors.length)];
  }
}
