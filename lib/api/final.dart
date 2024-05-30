import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vms/app/app.dart';

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   debugPrint('[notificationTapBackground()]');
// }

// @pragma('vm:entry-point')
// Future<void> handleBackgroundMessage(RemoteMessage notification) async {
//   // await mainAppRouter.pushNamed('/complaintsScreen');

//   log('Handling a background notification ${notification.messageId}');

//   log('Title ${notification.notification!.title}');
//   log('Body ${notification.notification!.body}');
//   log('Data ${notification.data}');
// }

// Future<void> selectNotification(String? payload) async {
//   if (payload != null) {
//     debugPrint('notification payload: $payload');
//     mainAppRouter.pushNamed('/massEvents');
//   }
// }

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  log('entry point notification tap background');
  // handle action
}

class FirebaseApi {
  // static final FirebaseApi _instance = FirebaseApi._internal();

  // FirebaseApi._internal();

  final _firebaseMessaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
  );

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<String?> getDeviceToken() async {
    return await _firebaseMessaging.getToken();
  }

  // Future<void> subscribeToTopic(String topic) async {
  //   await _firebaseMessaging.subscribeToTopic(topic);
  // }

  // Future<void> unsubscribeFromTopic(String topic) async {
  //   await _firebaseMessaging.unsubscribeFromTopic(topic);
  // }

  // Future<void> onDidReceiveLocalNotification(
  //   int id,
  //   String? title,
  //   String? body,
  //   String? payload,
  // ) async {
  // showDialog(
  //   // context: navigatorKey.currentContext as BuildContext,
  //   builder: (BuildContext context) => CupertinoAlertDialog(
  //     title: Text(title ?? ''),
  //     content: Text(body ?? ''),
  //     actions: [
  //       CupertinoDialogAction(
  //         isDefaultAction: true,
  //         child: const Text('Ok'),
  //         onPressed: () async {
  //           Navigator.of(context, rootNavigator: true).pop();
  //           await Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => NotificationScreen(payload: payload),
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   ),
  // );
  // }

  Future<void> onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload! as NotificationResponse;

    log('$notificationResponse');

    if (notificationResponse.payload != null) {
      log('notification payload: $payload');
    }

    log('notification payload: $payload');
    // final data = jsonDecode(payload);

    // _handleNotificationClick(payload);
    // navigatorKey.currentState?.pushNamed(
    //   NotificationScreen.routeName,
    //   arguments: jsonDecode(payload.payload!),
    // );
  }

  Future<void> initLocalNotifications() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_launcher');

    const initializationSettingsDarwin = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await _localNotifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {
        // onDidReceiveNotificationResponse(notificationResponse);
        debugPrint(
          '[onDidReceiveNotificationResponse] $notificationResponse',
        );

        if (notificationResponse.payload != null) {
          try {
            final message = RemoteMessage.fromMap(
              jsonDecode(notificationResponse.payload!) as Map<String, dynamic>,
            );

            debugPrint(
              '[onDidReceiveNotificationResponse] nischal ${message.data['path']}',
            );

            // _handleNotificationClick(message);
            await mainAppRouter
                .pushNamed(message.data['path'] as String ?? '/homeScreenMain');
          } catch (e) {
            log('Error decoding payload: $e');
          }
        } else {
          log('Payload is null');
        }

        log('this is the on received message event');
        // await mainAppRouter.pushNamed('/homeScreenMain');
      },
      // onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);

    final result = await _localNotifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // @pragma('vm:entry-point')
  // void notificationTapBackground(NotificationResponse notificationResponse) {
  //   log('tapped in backagorund $notificationResponse');
  //   // handle action
  // }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('testing message listening');

      final notification = message.notification;
      final android = message.notification?.android;

      log('main app router ${message.data['path']}');
      // mainAppRouter
      //     .pushNamed(message.data['path'] as String ?? '/homeScreenMain');

      log('payload: $message');
      log('foreground message of the firebase notification');
      log('Message data: ${message.data}');
      log('Message notif: ${message.notification}');
      log('Message notif: ${message.notification!.body}');
      log('Message notif: ${message.notification!.title}');
      log('Message notif: ${message.notification!.body!}');
      log('Message notif mappppp: ${message.toMap()}');

      if (notification == null) return;

      //  icon =
      //     BitmapFilePathAndroidIcon(MyAssets.icons.homeOrange.path);

      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@drawable/ic_launcher',
            visibility: NotificationVisibility.public,
            // largeIcon: icon,
            // actions: <AndroidNotificationAction>[
            //   const AndroidNotificationAction(
            //     'action_1',
            //     'Action 1',
            //   ),
            //   const AndroidNotificationAction(
            //     'action_2',
            //     'Action 2',
            //   ),
            // ],
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });

    // FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    //   log('main app router ${message.data['path']}');
    //   final notification = message;

    //   log('Handling a background notification ${notification.messageId}');

    //   log('Title ${notification.notification!.title}');
    //   log('Body ${notification.notification!.body}');
    //   log('Data ${notification.data}');
    // });

    await FirebaseMessaging.instance.getInitialMessage().then(
      (value) {
        log('main app router $value');
        // mainAppRouter.pushNamed('/ServicesScreen');
        if (value != null) {
          // handleMessage(value);
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message data from the openeed application: ${message.data}');
      log('Message notif: ${message.notification}');
      log('Message notif: ${message.notification!.body}');
      log('Message notif: ${message.notification!.title}');
      log('Message notif: ${message.notification!.body!}');
      log('Message notif: ${message.data}');
      _handleNotificationClick(message);
    });

    final initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      log('Notification clicked with app fully terminated');
      _handleNotificationClick(initialMessage);
    }

    // FirebaseMessaging.onBackgroundMessage(
    //   (message) async {
    //     log('this is the onbackground message service from the firebase');
    //     log('main app router ${message.data['path']}');
    //   },
    // );

    // FirebaseMessaging.onBackgroundMessage(
    //   (RemoteMessage message) async {
    //     log('CHANGESSSSS router ${message.data['path']}');
    //     // mainAppRouter.pushNamed('/ServicesScreen');
    //   },
    // );

    // void handleMessage(RemoteMessage? message) {
    //   final notificationData = message!.data;

    //   log('payload: $message');

    //   if (notificationData.containsKey('screen')) {
    //     final screen = notificationData['screen'];
    //     // Navigator.of(context).pushNamed(screen);
    //   }
    // }
    //   void handleMessage(RemoteMessage? message) {
    //   if (message == null) return;

    //   log('Message data: ${message.data}');
    //   log('Message notif: ${message.notification}');
    //   log('Message notif: ${message.notification!.body}');
    //   log('Message notif: ${message.notification!.title}');
    //   log('Message notif: ${message.notification!.body!}');
    //   log('Message notif: ${message.data}');
    // }
  }

  void _handleNotificationClick(RemoteMessage message) {
    final notificationData = message.data;

    // mainAppRouter.pushNamed('/howMassWorksRoute');

    mainAppRouter.replaceNamed('/homeScreenMain');
    mainAppRouter
        .pushNamed(message.data['path'] as String ?? '/homeScreenMain');
    log('notification clicks $notificationData');

    if (notificationData.containsKey('screen')) {
      // final screen = notificationData['screen'];
      // Navigator.of(context).pushNamed(screen);
    }
  }

  void showFlutterNotification(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            // TODOadd a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

  Future<void> init() async {
    try {
      await _firebaseMessaging.requestPermission();

      final FCMToken = await getDeviceToken();
      log('$FCMToken----------------this is firebase fcm token');

      await initPushNotification();
      await initLocalNotifications();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Background message received ${message.messageId}');
  await mainAppRouter.pushNamed('/massEvents');
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  debugPrint('Handling a background message: ${message.notification!.title}');
}
