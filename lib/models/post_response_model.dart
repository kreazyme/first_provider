import 'package:first_provider/models/post_model.dart';

class PostResponseModel {
  const PostResponseModel({
    required this.posts,
  });

  final List<PostModel> posts;

  factory PostResponseModel.fromJson(List<dynamic> json) => PostResponseModel(
        posts: List<PostModel>.from(json.map((x) => PostModel.fromJson(x))),
      );
}
