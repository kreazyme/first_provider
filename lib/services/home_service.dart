import 'package:first_provider/models/post_response_model.dart';

abstract class HomeService {
  Future<PostResponseModel> getPosts();
}
