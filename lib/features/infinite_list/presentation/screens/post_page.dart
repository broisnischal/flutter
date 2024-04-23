import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullfluttersetup/features/infinite_list/presentation/bloc/post/post_bloc.dart';
import 'package:fullfluttersetup/features/infinite_list/presentation/screens/post_list.dart';
import 'package:http/http.dart' as http;

@RoutePage(name: 'PostPageRoute')
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
