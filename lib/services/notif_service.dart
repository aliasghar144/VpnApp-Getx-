import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
    const AndroidInitializationSettings('logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  // Future<void> showOngoingNotification() async {
  //   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(‘channel_id’, ‘Channel Name’, ‘Channel Description’,
  //   importance: Importance.Max,
  //   priority: Priority.High,
  //   ongoing: true,
  //   autoCancel: false);
  //   const NotificationDetails notificationDetails = NotificationDetails(androidNotificationDetails, null);
  //   await flutterLocalNotificationsPlugin.show(0, ‘Flutter Local Notification’, ‘Flutter Ongoing Notification’, notificationDetails, payload: ‘Destination Screen(Ongoing Notification)’);
  // }

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max,
        ongoing: true,
          enableVibration: false
        ),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  Future cancelNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.cancel(0);
  }
}