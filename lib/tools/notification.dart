import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationSettings {
  static const IOSNotificationDetails iOSPlatformChannelSpecifics =
      IOSNotificationDetails(sound: 'money'); //TODO doesn't work

  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'rdd',
    'Reddcoin',
    'Notification channel for Reddcoin app',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
    sound: RawResourceAndroidNotificationSound('money'),
  );

  static NotificationDetails get platformChannelSpecifics {
    return NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
  }
}
