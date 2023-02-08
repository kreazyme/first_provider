import 'package:first_provider/helpers/app_enum.dart';
import 'package:first_provider/models/post_response_model.dart';
import 'package:first_provider/services/home_service.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {
  late HomeService _service;
  HomeProvider({required HomeService service}) {
    _service = service;
    init();
  }

  LoadingStatus loadingState = LoadingStatus.initial;
  PostResponseModel posts = const PostResponseModel(posts: []);

  Future<void> init() async {
    loadingState = LoadingStatus.loading;
    notifyListeners();

    posts = await _service.getPosts();
    loadingState = LoadingStatus.success;
    notifyListeners();
  }
}
