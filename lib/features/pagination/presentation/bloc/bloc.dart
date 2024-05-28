import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullfluttersetup/features/pagination/domain/post_repo.dart';

part 'event.dart';
part 'state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(this.repo) : super(PostInitial(null)) {
    scrollController.addListener(() {
      add(LoadMoreEvent());
    });

    on<PostFetchEvent>((event, emit) async {
      emit(PostLoading(null));
      final posts = await repo.fetchPost(page);
      emit(PostLoaded(posts: posts));
    });

    on<LoadMoreEvent>((event, emit) async {
      if (_isBottom && !isLoadingMore) {
        page++;
        isLoadingMore = true;
        // emit(PostLoading(null));
        final posts = await repo.fetchPost(page) as List;
        emit(PostLoaded(posts: [...state.posts as List, ...posts]));
      }
    });
  }
  PostRepo repo;
  int page = 1;
  bool isLoadingMore = false;
  ScrollController scrollController = ScrollController();

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.7);
  }
}
