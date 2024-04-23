import 'package:flutter/material.dart';
import 'package:fullfluttersetup/features/infinite_list/domain/entity/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(post.title),
      subtitle: Text(post.body),
    );
  }
}
