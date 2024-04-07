import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String title,
  required String content,
}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        showCloseIcon: true,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Row(
              children: [
                // const Icon(
                //   Icons.info_outline,
                //   color: Colors.white,
                // ),
                const SizedBox(height: 8),
                Text(content),
              ],
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // clipBehavior: Clip.hardEdge,
        dismissDirection: DismissDirection.horizontal,
        padding: const EdgeInsets.all(16),
        // margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 5),
        // behavior: SnackBarBehavior.floating,
        hitTestBehavior: HitTestBehavior.translucent,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.82,
          right: 24,
          left: 24,
        ),
      ),
    );
}
