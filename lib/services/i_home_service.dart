import 'package:first_provider/models/post_model.dart';
import 'package:first_provider/models/post_response_model.dart';

abstract class IHomeService {
  Future<PostResponseModel> getPosts();
}
