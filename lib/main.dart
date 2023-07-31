import 'dart:developer';
import 'package:clock_app/music_dir/music_list.dart';
import 'music_dir/music_page.dart';
import 'alarm/timing_set.dart';
import 'package:flutter/material.dart';
import 'Home_Screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_10y.dart' as tz;

FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
  );
  InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
  );
  bool? initialized = await notificationsPlugin.initialize(
      initializationSettings, onDidReceiveNotificationResponse: (response) {
    log(response.payload.toString());
    // Alarm_Row(play_or_not: 1,);

    // audioPlayer.stop();
  });
  log("notification :$initialized");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Timing();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return Music_list();
          },
        ),
      ],
      child: MaterialApp(
          theme: ThemeData().copyWith(primaryColor: Color(0xffF7F7F7)),
          initialRoute: '/home_screen',
          routes: {
            '/home_screen': (context) => Home_Screen(),
            '/music_screen': (context) => Music_Page(),
          }
          // home: Home_Screen(),
          ),
    );
  }
}
