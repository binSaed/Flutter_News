import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Model/PostModel.dart';

class SinglePost extends StatefulWidget {
  final PostModel postSingle;
  SinglePost(this.postSingle);
  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            floating: true,
            pinned: true,
            backgroundColor: Colors.blue.shade700,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.postSingle.featuredImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              if (position == 0) {
                return _drawPostDetails();
              } else if (position > 0 && position < 9) {
                return _comments();
              } else {
                return _commentEntery();
              }
            }, childCount: 10),
          ),
        ],
      ),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        widget.postSingle.content,
        style: TextStyle(fontSize: 18, height: 1.2, letterSpacing: 1.2),
      ),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/a.jpg'),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("AbdOo"),
                  Text("2 Hour ago"),
                ],
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "This Text to Test The Text,This Text to Test The Text,This Text to Test The Text.",
              style: TextStyle(
                height: 1.1,
                letterSpacing: 1.1
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentEntery() {
    return Container(
      padding: EdgeInsets.all(12),
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Wirte Comment Hire...",
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  "SEND",
                  style: TextStyle(
                    color: Colors.blue,
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
}
