import 'package:first_provider/services/home_service_impl.dart';
import 'package:first_provider/services/post_service.dart';
import 'package:get_it/get_it.dart';

import '../views/home/home_provider.dart';

final injector = GetIt.instance;

void configureInjection() {
  injector.registerLazySingleton(
    () {
      return HomeProvider(
        service: injector.get<PostServiceImp>(),
      );
    },
  );
  injector.registerLazySingleton(
    () => HomeServiceImplement(),
  );
  injector.registerLazySingleton(
    () => PostServiceImp(),
  );
}
