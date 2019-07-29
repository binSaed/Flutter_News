import 'dart:convert';

import 'package:flutter_app/Model/AuthorModel.dart';
import 'package:flutter_app/Utilities/ApiUtilities.dart';
import 'package:http/http.dart' as http;

class AuthorApi {
  String _allAuthorsUrl = baseUrl + allAuthorsApi;
  List<AuthorModel> _listAuthor = List<AuthorModel>();

  Future<List<AuthorModel>> fetchAllUser() async {
    _listAuthor.clear();
    var response = await http.get(_allAuthorsUrl);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var _item in data) {
        AuthorModel _authorModel = AuthorModel(
            _item["id"].toString(),
            _item["name"].toString(),
            _item["email"].toString(),
            _item["avatar"].toString());
        _listAuthor.add(_authorModel);
      }
    }
    return _listAuthor;
  }
}
