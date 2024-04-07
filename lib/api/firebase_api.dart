// import 'dart:convert';
// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebaseapp/main.dart';
// import 'package:firebaseapp/page/notfication.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   log("Handling a background message: ${message.messageId}");
//   log(message.notification!.title!);
//   log(message.notification!.body!);
//   log(message.data.toString());
//   // log(message.notification!.)
// }

// class FirebaseApi {
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   final _androidChannel = const AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'High Importance Notifications', // title
//     description:
//         'This channel is used for important notifications.', // description
//     importance: Importance.defaultImportance,
//   );

//   // final _localNotifications = otificationsPlugin();
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();

//   void handleMessage(RemoteMessage? message) {
//     if (message != null) {
//       navigatorKey.currentState?.pushNamed(
//         NotificationScreen.routeName,
//         arguments: message,
//       );
//     }
//   }

//   void onDidReceiveNotificationResponse(
//       NotificationResponse notificationResponse) async {
//     final payload = notificationResponse.payload as NotificationResponse;
//     if (notificationResponse.payload != null) {
//       log('notification payload: $payload');
//     }
//     // navigatorKey.currentState?.pushNamed(
//     //   NotificationScreen.routeName,
//     //   arguments: jsonDecode(payload.payload!),
//     // );
//   }

//   Future initPushNotification() async {
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );

//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     FirebaseMessaging.onMessage.listen((message) {
//       final notification = message.notification;
//       if (notification == null) return;

//       _localNotifications.show(
//         notification.hashCode,
//         notification.title,
//         notification.body,
//         NotificationDetails(
//           android: AndroidNotificationDetails(
//             _androidChannel.id,
//             _androidChannel.name,
//             channelDescription: _androidChannel.description,
//             icon: '@drawable/ic_launcher',
//           ),
//         ),
//         payload: jsonEncode(message.toMap()),
//       );
//     });
//   }

//   void onDidReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) async {
//     showDialog(
//       context: navigatorKey.currentContext as BuildContext,
//       builder: (BuildContext context) => CupertinoAlertDialog(
//         title: Text(title ?? ''),
//         content: Text(body ?? ''),
//         actions: [
//           CupertinoDialogAction(
//             isDefaultAction: true,
//             child: const Text('Ok'),
//             onPressed: () async {
//               Navigator.of(context, rootNavigator: true).pop();
//               await Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NotificationScreen(payload: payload),
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }

//   Future initLocalNotifications() async {
//     const initializationSettingsAndroid =
//         AndroidInitializationSettings('@drawable/ic_launcher');

//     final DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//     );
//     final initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//     );

//     await _localNotifications.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
//       // onDidReceiveBackgroundNotificationResponse: handleBackgroundMessage,
//     );

//     final platform = _localNotifications.resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>();

//     await platform?.createNotificationChannel(_androidChannel);

//     final result = await _localNotifications
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(
//           alert: true,
//           badge: true,
//           sound: true,
//         );
//   }

//   void notificationTapBackground(NotificationResponse notificationResponse) {
//     // handle action
//   }

//   Future<String?> getDeviceToken() async {
//     return await _firebaseMessaging.getToken();
//   }

//   Future<void> init() async {
//     await _firebaseMessaging.requestPermission();
//     final fcmtoken = await getDeviceToken();
//     log("fcmtoken: $fcmtoken");
//     // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     initPushNotification();
//     initLocalNotifications();
//   }
// }
