import 'package:first_provider/helpers/app_enum.dart';
import 'package:first_provider/models/post_response_model.dart';
import 'package:first_provider/services/home_service.dart';
import 'package:flutter/widgets.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    init();
  }

  LoadingStatus loadingState = LoadingStatus.initial;
  PostResponseModel posts = const PostResponseModel(posts: []);
  int count = 0;

  Future<void> init() async {
    loadingState = LoadingStatus.loading;
    notifyListeners();

    final result = await HomeService().getPosts();
    loadingState = LoadingStatus.success;
    posts = result;
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }
}
