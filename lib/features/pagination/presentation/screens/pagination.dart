import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullfluttersetup/features/pagination/domain/post_repo.dart';
import 'package:fullfluttersetup/features/pagination/presentation/bloc/bloc.dart';

@RoutePage(name: 'PaginationScreen')
class PaginationScreen extends StatelessWidget {
  const PaginationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PostRepo>(
      create: (context) => PostRepo(),
      child: BlocProvider(
        create: (context) =>
            PostBloc(context.read<PostRepo>())..add(PostFetchEvent()),
        child: const PaginationView(),
      ),
    );
  }
}

class PaginationView extends StatelessWidget {
  const PaginationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagination')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostLoaded) {
            final posts = state.posts as List;
            return Scrollbar(
              child: ListView.builder(
                controller: context.read<PostBloc>().scrollController,
                itemCount: context.read<PostBloc>().isLoadingMore
                    ? posts.length + 1
                    : posts.length,
                itemBuilder: (context, index) {
                  if (index >= posts.length) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else {
                    final post = posts[index];

                    return Card(
                      child: ListTile(
                        title: Text(post['title']['rendered'] as String),
                      ),
                    );
                  }
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
