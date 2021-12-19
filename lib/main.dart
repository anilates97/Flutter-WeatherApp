import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_weatherapp_with_riverpod/screens/weather_screen.dart';
import 'package:flutter_weatherapp_with_riverpod/services/firebase_notification_service.dart';
import 'package:flutter_weatherapp_with_riverpod/services/notification_service.dart';
import 'package:flutter_weatherapp_with_riverpod/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'screens/home_screen.dart';
import 'package:path_provider/path_provider.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    importance: Importance.high, playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("1 mesaj görüntülendi: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  tz.initializeTimeZones();

  await MyWeatherPreferences.init();

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? prefSehir;

  double? temp = 0;

  double? feelsLikeTemp = 0;

  String? weatherState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Shared Preferences

    //Firebase Messaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    color: Colors.blue,
                    playSound: true,
                    icon: '@mipmap/ic_launcher')));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Yeni bir mesaj var");
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> showNotification() async {
    final String largeIconPath = await _downloadAndSaveFile(
        'https://cdn-icons.flaticon.com/png/512/3093/premium/3093390.png?token=exp=1637461285~hmac=c550266391503fae79ab8fd5a3a3b00c',
        'largeIcon');

    flutterLocalNotificationsPlugin.show(
        0,
        prefSehir!.toUpperCase(),
        "Bugün hava $weatherState\nsıcaklık: $temp °C\nhissedilen sıcaklık: $feelsLikeTemp °C",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Colors.blue,
                largeIcon: FilePathAndroidBitmap(largeIconPath),
                playSound: true,
                styleInformation: BigTextStyleInformation(""),
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    prefSehir = MyWeatherPreferences.getCityName() ?? "";
    //print("mainnnnnnnnn ŞEHİRRRRRRRRRRR: " + prefSehir.toString());

    temp = MyWeatherPreferences.getTemp() ?? 0;
    //print("sıcaklık:::::: $avgTemp");

    feelsLikeTemp = MyWeatherPreferences.getFeelsLikeTemp() ?? 0;
    print("hissedilen : +$feelsLikeTemp");

    weatherState = MyWeatherPreferences.getWeatherState() ?? "";
    print("hava durum: " + weatherState!);
    if (temp != 0.0 && weatherState != "" && feelsLikeTemp != 0.0) {
      showNotification();
    }

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hava Durumu',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: prefSehir == ""
              ? HomeScreen()
              : WeatherScreen(
                  sehir: prefSehir,
                ));
    });
  }
}
