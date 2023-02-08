import 'dart:convert';

import 'package:first_provider/models/post_response_model.dart';
import 'package:first_provider/services/home_service.dart';
import 'package:http/http.dart' as http;

class HomeServiceImplement implements HomeService {
  @override
  Future<PostResponseModel> getPosts() async {
    var result = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    );
    if (result.statusCode == 200) {
      return PostResponseModel.fromJson(
        json.decode(result.body),
      );
    } else {
      return const PostResponseModel(
        posts: [],
      );
    }
  }
}
