import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Model/CategorieModel.dart';
import 'package:flutter_app/Utilities/ApiUtilities.dart';

class CategoriesApi{

  String _allCategorieUrl = baseUrl + allCategoriesApi;
  List<CategorieModel> _listCategorie = List<CategorieModel>();

  Future<List<CategorieModel>> fetchAllCategorie() async {
    _listCategorie.clear();
    var response = await http.get(_allCategorieUrl);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var _item in data) {
        CategorieModel _categorieModel = CategorieModel(
            _item["id"].toString(),
            _item["title"].toString());
        _listCategorie.add(_categorieModel);
      }
  
    }
    return _listCategorie;
  }
}
