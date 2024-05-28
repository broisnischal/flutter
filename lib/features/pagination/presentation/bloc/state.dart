part of 'bloc.dart';

abstract class PostState {
  PostState(this.posts);
  final posts;
}

class PostInitial extends PostState {
  PostInitial(super.posts);
}

class PostLoading extends PostState {
  PostLoading(super.posts);
}

class PostLoaded extends PostState {
  PostLoaded({required posts}) : super(posts);
}
