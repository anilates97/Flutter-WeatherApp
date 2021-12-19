import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  static final FirebaseNotificationService _firebaseNotificationService =
      FirebaseNotificationService._internal();

  factory FirebaseNotificationService() {
    return _firebaseNotificationService;
  }

  FirebaseNotificationService._internal();

 
 
}
