import 'timing_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'time_list.dart';

class SetAlarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int hours = 2;
    int minutes = 2;
    String am_or_pm = 'AM';
    String paths = 'Luke-Bergs-Bliss.mp3';
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: TextButton(
                    onPressed: () async {
                      dynamic pat = (await Navigator.pushNamed(
                          context, '/music_screen'))!;
                      paths = pat;
                    },
                    child: Text(
                      'Select Ringtone',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                )),
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoPicker(
                      looping: true,
                      itemExtent: 26,
                      onSelectedItemChanged: (value) {
                        hours = value + 1;
                      },
                      children: [
                        for (int i = 0; i < 12; i++) Text('${Time().hour[i]}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      looping: true,
                      itemExtent: 27,
                      onSelectedItemChanged: (value) {
                        minutes = value;
                      },
                      children: [
                        for (int i = 0; i <= 59; i++)
                          Text('${Time().minutes[i]}'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                      itemExtent: 27,
                      onSelectedItemChanged: (value) {
                        if (value == 0)
                          am_or_pm = 'AM';
                        else
                          am_or_pm = 'PM';
                      },
                      children: [
                        for (int i = 0; i <= 1; i++)
                          Text('${Time().am_or_pm[i]}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/close.png',
                          height: 20,
                        )),
                    Text(
                      'New Alarm',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    TextButton(
                        onPressed: () {
                          Provider.of<Timing>(context, listen: false)
                              .addTime(hours, minutes, am_or_pm, paths);
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/tick.png',
                          height: 20,
                        )),
                  ],
                ),
              ),
            ),
            // Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
