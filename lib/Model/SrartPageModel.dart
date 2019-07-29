import 'package:flutter/material.dart';

class StartPageModel {
  String _strImages;
  IconData _strIcon;
  String _strTitle;
  String _strDes;
  Color _color;

  StartPageModel(this._strImages, this._strIcon, this._strTitle, this._strDes,
      this._color);

  Color get color => _color;

  set color(Color value) {
    _color = value;
  }

  String get strDes => _strDes;

  set strDes(String value) {
    _strDes = value;
  }

  String get strTitle => _strTitle;

  set strTitle(String value) {
    _strTitle = value;
  }

  IconData get strIcon => _strIcon;

  set strIcon(IconData value) {
    _strIcon = value;
  }

  String get strImages => _strImages;

  set strImages(String value) {
    _strImages = value;
  }
}
