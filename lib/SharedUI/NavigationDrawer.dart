import 'package:flutter/material.dart';
import 'package:flutter_app/Model/NavMenu.dart';
import 'package:flutter_app/Screens/HeadLineNew.dart';
import 'package:flutter_app/Screens/HomeScreen.dart';
import 'package:flutter_app/Screens/SocialFeed/InstagramFeed.dart';
import 'package:flutter_app/Screens/SocialFeed/TwitterFeed.dart';
import 'package:flutter_app/Screens/SocialFeed/FacebookFeed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenu> _listNavMenu = [
    NavMenu("Explore", () => HomeScreen()),
    NavMenu("HeadLineNews", () => HeadLineNews()),
    NavMenu("Twitter Feed", () => TwitterFeed()),
     NavMenu("Instagram Feed", () => InstagramFeed()),
      NavMenu("FacebookFeed Feed", () => FacebookFeed()),
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(
          top: 75,
          left: 24,
        ),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  _listNavMenu[position].title,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey.shade700,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              _listNavMenu[position].destination()));
                },
              ),
            );
          },
          itemCount: _listNavMenu.length,
        ),
      ),
    );
  }
}
