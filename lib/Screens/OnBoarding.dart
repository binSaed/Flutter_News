import 'package:flutter/material.dart';
import 'package:flutter_app/Model/SrartPageModel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'HomeScreen.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

List<StartPageModel> listPage = List<StartPageModel>();
List<Colors> listColor = List<Colors>();
int _currentIndex = 0;
ValueNotifier<int> _notifier = ValueNotifier(_currentIndex);

class _OnboardingState extends State<Onboarding> {
  void _setList() {

    listPage.add(StartPageModel('assets/images/a.jpg',
        Icons.airplanemode_active, "f", "f", Color(0xFF6200EA)));
    listPage.add(StartPageModel(
        'assets/images/b.jpg', Icons.ac_unit, "f", "f", Color(0xFF2206EA)));
    listPage.add(StartPageModel(
        'assets/images/d.jpg', Icons.access_time, "f", "f", Color(0xFF1200EA)));
  }

  @override
  Widget build(BuildContext context) {
    _setList();
    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage(
                          listPage[index].strImages,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          listPage[index].strIcon,
                          color: Colors.white,
                          size: 150,
                        ),
                        offset: Offset(0, -100),
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 48,
                          right: 48,
                          top: 12,
                        ),
                        child: Text(
                          "Hi My Firnd I am Hare Hi My Firnd I am Hare Hi My Firnd I am Hare Hi My Firnd I am Hare",
                          style: TextStyle(
                            color: Colors.grey.shade200,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: listPage.length,
            onPageChanged: (index) {
              _currentIndex = index;
              _notifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 0),
          child: Align(
            alignment: Alignment.center,
            child: _widget(listPage.length),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 24,
              left: 16,
              right: 16,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: RaisedButton(
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 1.3,
                  ),
                ),
                color: listPage[_currentIndex].color,
                onPressed: () {
                  _updateSeen();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
//                  setState(
//                    () {}
//                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _widget(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _notifier,
      length: length,
      normalBuilder: (animationController, index) =>
          Circle(
            size: 8.0,
            color: Colors.grey,
          ),
      highlightedBuilder: (animationController, index) =>
          ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.red,
            ),
          ),
    );
  }
  Future _updateSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("seen", true);
  }
}
