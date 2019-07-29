import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/HomeTabs/Favourits.dart';
import 'package:flutter_app/Screens/HomeTabs/Popular.dart';
import 'package:flutter_app/Screens/HomeTabs/WhatsNew.dart';
import 'package:flutter_app/Screens/Menu/AboutUs.dart';
import 'package:flutter_app/Screens/Menu/Contact.dart';
import 'package:flutter_app/Screens/Menu/Help.dart';
import 'package:flutter_app/Screens/Menu/Settings.dart';
import 'package:flutter_app/SharedUI/NavigationDrawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum _enumPop { ABOUT, CONTACT, HELP, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
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
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popUpMunu(context)
        ],
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [
          WhatsNew(),
          Popular(),
          Favourits(),
        ],
      ),
    );
  }

  Widget _popUpMunu(BuildContext context) {
    return PopupMenuButton<_enumPop>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<_enumPop>(
            value: _enumPop.ABOUT,
            child: Text('ABOUT'),
          ),
          PopupMenuItem<_enumPop>(
            value: _enumPop.CONTACT,
            child: Text('CONTACT'),
          ),
          PopupMenuItem<_enumPop>(
            value: _enumPop.HELP,
            child: Text('HELP'),
          ),
          PopupMenuItem<_enumPop>(
            value: _enumPop.SETTINGS,
            child: Text('SETTINGS'),
          ),
        ];
      },
      onSelected: (_enumPop menu) {
        switch (menu) {
          case _enumPop.ABOUT:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AboutUS();
                },
              ),
            );
            break;
          case _enumPop.SETTINGS:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Settings();
                },
              ),
            );

            break;
          case _enumPop.CONTACT:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Contact();
                },
              ),
            );
            break;
          case _enumPop.HELP:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Help();
                },
              ),
            );
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
