
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

class Things extends StatefulWidget {
  final String hours;
  final String minutes;
  final String am_or_pm;

  String button_state ;
  Things({required this.hours,required this.minutes,required this.am_or_pm,required this.button_state});

  @override
  State<Things> createState() => _ThingsState();
}

class _ThingsState extends State<Things> {


  bool color_of_text=true;

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
                    '${widget.hours}:${widget.minutes.padLeft(2,'0')}',
                    style: color_of_text?TextStyle(fontSize: 38,fontWeight:FontWeight.lerp(FontWeight.w300, FontWeight.w400, .7) ):TextStyle(fontSize: 38,fontWeight: FontWeight.w200),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(widget.am_or_pm,style: color_of_text?TextStyle(fontWeight: FontWeight.w300):TextStyle(fontWeight: FontWeight.w200),),
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
                      if (widget.button_state == 'on')
                      {widget.button_state = 'off';
                      color_of_text=false;}
                      else {
                        widget.button_state = 'on';
                        color_of_text = true;
                      }

                    });

                  },
                  child: Image.asset('assets/${widget.button_state}-button.png'))),
        ],
      ),
    );
  }
}

// FontWeight.w300