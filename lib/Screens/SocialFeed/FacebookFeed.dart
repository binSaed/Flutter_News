import 'package:flutter/material.dart';

class FacebookFeed extends StatefulWidget {
  FacebookFeed({Key key}) : super(key: key);

  _FacebookFeedState createState() => _FacebookFeedState();
}

class _FacebookFeedState extends State<FacebookFeed> {
  TextStyle _styleHashTag =
      TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Feed"),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawHeader(),
                _drawTitle(),
                _drawHashTag(),
                _drawBofy(),
                _drawFooter(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                Text(
                  "AbdOo Saed",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Fri, 12 may 2019 . 14:30",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-12, 0),
              child: Text(
                "25",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        "Test Text To Test The Text, Test Text To Test The Text, Test Text To Test The Text",
        style: TextStyle(
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _drawHashTag() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            child: Text(
              "#sport",
              style: _styleHashTag,
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Text(
              "#sport",
              style: _styleHashTag,
            ),
            onPressed: () {},
          ),
          FlatButton(
            child: Text(
              "#sport",
              style: _styleHashTag,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Widget _drawBofy() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: ExactAssetImage('assets/images/testimg.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          child: Text(
            "10 COMMENTS",
            style: _styleHashTag,
          ),
          onPressed: () {},
        ),
        Row(
          children: <Widget>[
            FlatButton(
              child: Text(
                "SHARE",
                style: _styleHashTag,
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Text(
                "OPEN",
                style: _styleHashTag,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
