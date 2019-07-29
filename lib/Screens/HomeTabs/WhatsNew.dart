import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/API/PostsApi.dart';
import 'package:flutter_app/Model/PostModel.dart';
import 'package:flutter_app/Screens/SinglePost.dart';
import 'package:flutter_app/Utilities/DataUtilities.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsApi _postsApi = PostsApi();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _imgHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _imgHeader() {
    return FutureBuilder(
      future: _postsApi.fetchPostByCategorie("1"),
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
              if (snapshot.hasData) {
                List<PostModel> _postHeaderList = snapshot.data;
                Random _random = Random();
                PostModel _postHeaderModel =
                    _postHeaderList[_random.nextInt(_postHeaderList.length)];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (
                          context,
                        ) {
                          return SinglePost(_postHeaderModel);
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(_postHeaderModel.featuredImage),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Text(
                              _postHeaderModel.title.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Text(
                              _postHeaderModel.content.replaceRange(
                                  80, _postHeaderModel.content.length, "...."),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return noData();
              }
            }
            break;
        }
        return loading();
      },
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              top: 8,
            ),
            child: _drawSectionTitle("Top Stories"),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: Card(
              child: FutureBuilder(
                future: _postsApi.fetchPostByCategorie("1"),
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
                      if (snapshot.error != null) {
                        return showError(snapshot.error);
                      } else {
                        if (snapshot.hasData) {
                          List<PostModel> _listPost = snapshot.data;
                          if (_listPost.length >= 3) {
                            PostModel _post0 = snapshot.data[0];
                            PostModel _post1 = snapshot.data[1];
                            PostModel _post2 = snapshot.data[2];
                            return Column(
                              children: <Widget>[
                                drawSingleRow(_post0),
                                drawSingleRow(_post1),
                                drawSingleRow(_post2),
                              ],
                            );
                          } else {
                            return noData();
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                  return loading();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawSingleRow(PostModel _post) {
    return GestureDetector(
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
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Card(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        child: Image.network(
                          _post.featuredImage,
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

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }

  Widget _drawRecentUpdatesCard(Color c, PostModel _postRecent) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SinglePost(_postRecent);
            },
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_postRecent.featuredImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                padding:
                    EdgeInsets.only(top: 2, bottom: 2, left: 24, right: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: c,
                ),
                child: Text(
                  "Sport",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Text(
                _postRecent.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
                top: 8,
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time),
                  Text(parseDateTime(_postRecent.dateWritten)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: FutureBuilder(
        future: _postsApi.fetchPostByCategorie("2"),
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _drawSectionTitle(" Recent Updates"),
                    ),
                    _drawRecentUpdatesCard(Colors.deepOrange, snapshot.data[0]),
                    _drawRecentUpdatesCard(Colors.amber, snapshot.data[1]),
                    _drawRecentUpdatesCard(Colors.blue, snapshot.data[2]),
                    SizedBox(
                      height: 24,
                    )
                  ],
                );
              }
              break;
          }
          return loading();
        },
      ),
    );
  }
}
