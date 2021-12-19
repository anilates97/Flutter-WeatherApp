import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        _sabah7Bildirim(),
        //tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds))
        const NotificationDetails(
            android: AndroidNotificationDetails('main_channel', 'Main Channel',
                channelDescription: 'Main channel desc',
                importance: Importance.high,
                priority: Priority.max,
                icon: '@mipmap/ic_launcher'),
            iOS: IOSNotificationDetails(
                sound: 'default.wav',
                presentAlert: true,
                presentBadge: true,
                presentSound: true)),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}

tz.TZDateTime _sabah7Bildirim() {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime.now(tz.local).add(Duration(seconds: 2));
  tz.TZDateTime scheduledDate1 =
      tz.TZDateTime(tz.local, now.year, now.month, now.day, 7);
  print("aaaaaaaaaaaaaaa: " + scheduledDate1.toString());
  if (scheduledDate1.isBefore(now)) {
    scheduledDate1 = scheduledDate1.add(const Duration(days: 1));
  }
  return scheduledDate;
}


  /*
   tz.TZDateTime _sabah7Bildirim() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 7);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
  */
