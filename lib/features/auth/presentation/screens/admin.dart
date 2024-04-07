import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'Admin')
class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CachedNetworkImage(
              progressIndicatorBuilder: (context, url, progress) {
                if (progress.progress != null) {
                  final percent = progress.progress! * 100;
                  return Text('$percent%');
                }

                return Text('$url%');
              },
              imageUrl:
                  'https://images.pexels.com/photos/1519753/pexels-photo-1519753.jpeg?cs=srgb&dl=pexels-tom-fisk-1519753.jpg&fm=jpg',
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text('Admin')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.home),
      ),
    );
  }
}
