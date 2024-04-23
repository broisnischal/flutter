import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullfluttersetup/di/injection_config.dart';
import 'package:fullfluttersetup/features/profile/presentation/bloc/home_bloc.dart';
import 'package:fullfluttersetup/l10n/l10n.dart';

@RoutePage(name: 'HomePage')
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: FlutterSecure.deleteAll,
            //   child: Text('Logout'),
            // ),
            100.verticalSpace,

            Text(l10n.tenantFamily),

            Text(
              'Calendar ',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final day in [
                  'Sun',
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                ])
                  Text(day),
              ],
            ),
            const SizedBox(height: 10),
            BlocProvider(
              create: (context) => getIt<HomeBloc>()..add(GetCalendarData()),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeError) {
                    return Text(state.message);
                  }

                  return state is HomeLoaded
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                            itemCount: state.calendar.length,
                            itemBuilder: (context, index) {
                              final dayData = state.calendar[index];
                              final date = dayData.date!.split('-').last ?? '';
                              // log(date.split('-').last);
                              final isPast = DateTime.now()
                                  .isAfter(DateTime.parse(dayData.date!));

                              final isToday = DateTime.now().day ==
                                  DateTime.parse(dayData.date!).day;

                              final events = dayData.events;
                              final present = Random().nextBool();

                              // log(present.toString());

                              return GestureDetector(
                                onTap: () {
                                  print(events);
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        height: 200,
                                        color: Colors.white,
                                        child: ListView.builder(
                                          itemCount: events.length,
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                ...events.map<Widget>((event) {
                                                  final inTime = event.inTime;
                                                  final outTime = event.outTime;
                                                  final eventType = event.type;
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 2,
                                                    ),
                                                    child: Text(
                                                      '$eventType: $inTime - $outTime',
                                                    ),
                                                  );
                                                }),
                                              ],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(4),
                                    color: isToday
                                        ? Colors.blue
                                        : isPast
                                            ? present
                                                ? Colors.green
                                                : Colors.red
                                            : Colors.white,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        date,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      // if (present)
                                      //   const Icon(
                                      //     Icons.check_circle,
                                      //     color: Colors.green,
                                      //   ),
                                      // if (!present)
                                      //   const Icon(
                                      //     Icons.cancel,
                                      //     color: Colors.red,
                                      //   ),
                                      // ...events.map<Widget>((event) {
                                      //   final inTime = event.inTime;
                                      //   final outTime = event.outTime;
                                      //   final eventType = event.type;
                                      //   return Padding(
                                      //     padding: const EdgeInsets.symmetric(
                                      //       vertical: 2,
                                      //     ),
                                      //     child: Text(
                                      //       '$eventType: $inTime - $outTime',
                                      //     ),
                                      //   );
                                      // }),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(
                          child: const Text('Loading...'),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
