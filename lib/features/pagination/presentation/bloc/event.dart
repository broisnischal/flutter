part of 'bloc.dart';

abstract class PostEvent {}

class PostFetchEvent extends PostEvent {}

class LoadMoreEvent extends PostEvent {}
