// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'cubit/db/firebase_db/firebasedb.dart';
import 'cubit/task.dart';
import 'firebase_options.dart';
import 'notification_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationHelper {
  static Future<void> init() async {
    await FirebaseMessaging.instance.requestPermission();
    final notificationToken = await FirebaseMessaging.instance.getToken();
    print("notificationToken");
    print(notificationToken);

    // Listening for foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      if (navigatorKey.currentContext != null) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) {
            return AlertDialog(
              title: Text(message.notification?.title ?? 'Notification'),
              content: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      message.notification?.android?.imageUrl ??
                          'https://via.placeholder.com/150',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Text(message.notification?.body ?? ''),
                ],
              ),
            );
          },
        );
      }
    });

    // listen to messages when the app comes to the foreground from a background state
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Received a background message:");
      print(message.notification?.title);
      print(message.notification?.body);
      if (message.notification?.body != null &&
          navigatorKey.currentContext != null) {
        Navigator.push(
          navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => NotificationScreen()),
        );
      }
    });

    // do something with RemoteMessage when the app is in terminated state

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }
}

@pragma('vm:entry-point')
Future<void> _backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
  Firebasedb.addTask(
    Task(
      id: message.messageId ?? "0010",
      title: message.notification?.title ?? "",
      description: message.notification?.body ?? "",
    ),
  );
}
