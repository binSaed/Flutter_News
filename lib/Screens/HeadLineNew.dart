import 'package:flutter/material.dart';
import 'package:flutter_app/SharedUI/NavigationDrawer.dart';

import 'HomeTabs/Favourits.dart';
import 'HomeTabs/Popular.dart';
import 'HomeTabs/WhatsNew.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              indicatorColor: Colors.white,
              controller: _tabController,
              tabs: [
                Tab(
                  text: "WHAT'S NEW",
                ),
                Tab(
                  text: "POPUULAR",
                ),
                Tab(
                  text: "FAVOURITES",
                )
              ]),
          title: Text("HeadLineNews"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
          ],
        ),
        drawer: NavigationDrawer(),
        body: TabBarView(controller: _tabController, children: [
          Favourits(),
          Popular(),
          Favourits(),
        ]));
  }
}
