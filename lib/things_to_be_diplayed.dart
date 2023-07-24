import 'dart:developer';

import 'package:clock_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:timezone/timezone.dart' as tz;

class Things extends StatefulWidget {
  final int hours;
  final int minutes;
  final String am_or_pm;
  String button_state;
  bool font;
  // final int play_or_not;

  Things(
      {required this.hours,
      required this.minutes,
      required this.am_or_pm,
      required this.button_state,
      required this.font});

  @override
  State<Things> createState() => _ThingsState();
}

class _ThingsState extends State<Things> {
  @override
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> playDelayedSound() async {
    DateTime currentTime = DateTime.now();
    int currentHour = currentTime.hour;
    int currentMinute = currentTime.minute;
    int delayInMilliseconds =
        ((widget.hours - currentHour) * 60 + (widget.minutes - currentMinute)) *
            60 *
            1000;

    if (delayInMilliseconds >= 0) {
      await Future.delayed(Duration(milliseconds: delayInMilliseconds));
      await audioPlayer.play(AssetSource('Luke-Bergs-Bliss.mp3'));
    }
  }
  // void PlaySound(int number)
  // {
  //
  //   final player=AudioPlayer();
  //   player.play(AssetSource('Luke-Bergs-Bliss.mp3'));
  // }

  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'bello',
      'heelllo',
      priority: Priority.max,
      importance: Importance.max,
      // sound: RawResourceAndroidNotificationSound('lukebergsbliss'),
      // playSound: true,
    );
    DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosDetails,
    );

    DateTime currentTime = DateTime.now();
    int currentHour = currentTime.hour;
    int currentMinute = currentTime.minute;
    int delayInMilliseconds =
        ((widget.hours - currentHour) * 60 + (widget.minutes - currentMinute)) *
            60 *
            1000;

    DateTime scheduleDate =
        DateTime.now().add(Duration(milliseconds: delayInMilliseconds));
    await notificationsPlugin.zonedSchedule(
        0,
        'Get Up ',
        'this is your last warning mf u will die',
        tz.TZDateTime.from(scheduleDate, tz.local),
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        payload: "stop the song");
  }

  void checkForNotification() async {
    NotificationAppLaunchDetails? details =
        await notificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null) {
      if (details.didNotificationLaunchApp) {
        NotificationResponse? response = details.notificationResponse;
        if (response != null) {
          String? payload = response.payload;
          log("notification Payload: $payload");
        }
      }
    }
  }

  void stopSound() {
    // if(widget.play_or_not==1)?
    audioPlayer.stop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.button_state == 'on') {
      showNotification();
      playDelayedSound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 20, right: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    '${widget.hours}:${widget.minutes.toString().padLeft(2, '0')}',
                    style: widget.font
                        ? TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.lerp(
                                FontWeight.w300, FontWeight.w400, .7))
                        : TextStyle(fontSize: 38, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.am_or_pm,
                    style: widget.font
                        ? TextStyle(fontWeight: FontWeight.w300)
                        : TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: TextButton(
                  onPressed: () {
                    // Noti.showBigTextNotification(title: 'wow', body: 'mf u will lose', fln: flutterLocalNotificationsPlugin);
                    setState(() {
                      if (widget.button_state == 'on') {
                        widget.button_state = 'off';
                        widget.font = false;
                        stopSound();
                      } else {
                        showNotification();
                        playDelayedSound();
                        widget.button_state = 'on';
                        widget.font = true;
                      }
                    });
                  },
                  child:
                      Image.asset('assets/${widget.button_state}-button.png'))),
        ],
      ),
    );
  }
}

// FontWeight.w300
