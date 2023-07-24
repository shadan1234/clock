import 'dart:math';

import 'package:clock_app/timing_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'time_list.dart';

class SetAlarm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int hours=2;
    int minutes=2;
    String am_or_pm='AM';
    return Container(
      color: Color(0xff757575),
      child: Container(
        // padding: EdgeInsets.all(20),
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
              flex: 16,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (value) {
                          hours=value;
                        },
                        children: [
                          for(int i=0;i<=12;i++)

                            Text('${Time().hour[i]}'),

                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (value) {
                          minutes=value;
                        },
                        children: [
                          for(int i=0;i<=59;i++)

                            Text('${Time().minutes[i]}'),

                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 28,
                        onSelectedItemChanged: (value) {
                          if(value==0)
                            am_or_pm='AM';
                          else
                            am_or_pm='PM';
                        },
                        children: [
                          for(int i=0;i<=1;i++)

                            Text('${Time().am_or_pm[i]}'),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
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
                        Provider.of<Timing>(context,listen: false).addTime(hours, minutes, am_or_pm);
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/tick.png',
                        height: 20,
                      )),
                ],
              ),
            ),
            Expanded(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
