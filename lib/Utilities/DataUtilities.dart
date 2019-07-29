 import 'package:flutter/material.dart';
 import 'package:timeago/timeago.dart' as timeago;
  Widget showError(var errorMass) {
    return Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child: Text(
          errorMass.toString(),
          style: TextStyle(
            color: Colors.red,
          ),
        ));
  }

  Widget showConnectionError() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Text("No Internet Connection"),
    );
  }

  Widget noData() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Text("No Data Avalible"),
    );
  }
    Widget loading() {
    return Container(
      padding: EdgeInsets.all(24),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
    String parseDateTime(String _date) {
    return timeago.format(
      DateTime.now().subtract(
        DateTime.now().difference(
          DateTime.parse(_date),
        ),
      ),
    );
  }
