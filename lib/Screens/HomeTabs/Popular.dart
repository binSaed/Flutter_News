import 'package:flutter/material.dart';
import 'package:flutter_app/API/PostsApi.dart';
import 'dart:async';
import 'package:flutter_app/Model/PostModel.dart';
import 'package:flutter_app/Utilities/DataUtilities.dart';

import '../SinglePost.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  PostsApi _postsApiPopular = PostsApi();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _postsApiPopular.fetchPostByCategorie("3"),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return showConnectionError();
            break;
          case ConnectionState.active:
            return loading();
            break;
          case ConnectionState.waiting:
            return loading();
            break;
          case ConnectionState.done:
            if (snapshot.hasError) {
              return showError(snapshot.error);
            } else {
              List<PostModel> _postsPopular = snapshot.data;
              return ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (
                  context,
                  position,
                ) {
                  return Card(
                    child: _drawSingleRow(_postsPopular[position]),
                  );
                },
                itemCount: _postsPopular.length,
              );
            }
            break;
        }
        return loading();
      },
    );
  }

  Widget _drawSingleRow(PostModel _post) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SinglePost(_post);
              },
            ),
          );
        },
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        child: Image(
                          image: NetworkImage(_post.featuredImage),
                          fit: BoxFit.cover,
                        ),
                        width: 124,
                        height: 124),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            _post.title,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("AbdOo Test"),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.access_time),
                                  Text(parseDateTime(_post.dateWritten))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
