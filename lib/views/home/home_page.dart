import 'package:first_provider/helpers/app_enum.dart';
import 'package:first_provider/injection/injection.dart';
import 'package:first_provider/services/home_service_impl.dart';
import 'package:first_provider/views/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(
        service: injector.get<HomeServiceImplement>(),
      ),
      child: Consumer<HomeProvider>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Builder(
            builder: (context) {
              if (value.loadingState == LoadingStatus.success) {
                return ListView.builder(
                  itemCount: context.watch<HomeProvider>().posts.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.posts.posts[index].title),
                      subtitle: Text(value.posts.posts[index].body),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
