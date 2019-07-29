import 'dart:convert';
import 'package:flutter_app/Model/PostModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/Utilities/ApiUtilities.dart';

class PostsApi {
  Future<List<PostModel>> fetchPostByCategorie(String id) async {
    String _whatsNewUrl = baseUrl + categoriesPostsApi + id;
    List<PostModel> _posts = List<PostModel>();
    var response = await http.get(_whatsNewUrl);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        PostModel post = PostModel(
          id: item["id"].toString(),
          title: item["title"].toString(),
          content: item["content"].toString(),
          dateWritten: item["date_written"].toString(),
          featuredImage: item["featured_image"].toString(),
          votesUp: item["votes_up"],
          votesDown: item["votes_down"],
          userId: item["user_id"],
          categoryId: item["category_id"],
          votersUp: (item["voters_up"] == null)
              ? List<int>()
              : jsonDecode(item["voters_up"]),
          votersDown: (item["voters_down"] == null)
              ? List<int>()
              : jsonDecode(item["voters_down"]),
        );
        _posts.add(post);
      }
    }
    return _posts;
  }


}
