import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feed"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(4),
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              children: <Widget>[
                _CardHeader(),
                _CardBody(),
                _drawLine(),
                _CardFoter(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _CardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "AbdOo Saed",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "@abdo",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Fri, 12 may 2019 . 14:30",
              style: TextStyle(color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

  Widget _CardBody() {
    return Padding(
        padding: EdgeInsets.only(bottom: 8, left: 16, right: 16, top: 8),
        child: Text(
          "Test Text To Test The Text, Test Text To Test The Text, Test Text To Test The Text",
          style: TextStyle(
            fontSize: 16,
            height: 1.2,
            color: Colors.grey.shade900,
          ),
        ));
  }

  Widget _CardFoter() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.repeat),
                color: Colors.blue,
                iconSize: 30,
                onPressed: () {},
              ),
              Text(
                "12",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  "SHARE",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  "OPEN",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 8),
    );
  }
}
