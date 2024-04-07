import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fullfluttersetup/router/router.gr.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage(name: 'IntroductionPage')
class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Title of custom body page',
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click on '),
              Icon(Icons.edit),
              Text(' to edit a post'),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        ),
        PageViewModel(
          title: 'Title of custom body page',
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click on '),
              Image(
                width: 50,
                image: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
              ),
              Icon(Icons.edit),
              Text(' to edit a post'),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        ),
        PageViewModel(
          title: 'Title of custom body page',
          bodyWidget: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Click on '),
              Icon(Icons.edit),
              Text(' to edit a post'),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        ),
      ],
      showSkipButton: true,
      showNextButton: false,
      skip: const Text('Skip'),
      done: const Text('Done'),
      onDone: () {
        // store the data
        // push the route

        AutoRouter.of(context)
            .pushAndPopUntil(const HomePage(), predicate: (route) => false);
        // On button pressed
      },
    );
  }
}
