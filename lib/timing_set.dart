import 'package:flutter/material.dart';
import 'set_of_time.dart';
class Timing extends ChangeNotifier
{
  List<Set_of_time> times=[
    Set_of_time(hour: 2, minute:03 , am_pm: 'AM',button: 'off',font: false),
    Set_of_time(hour: 2, minute:04 , am_pm: 'AM',button: 'off',font: false),
    Set_of_time(hour: 2, minute:05 , am_pm: 'AM',button: 'off',font: false),

  ];

  void addTime(int hour,int minute,String am_pm)
  {
    final set=Set_of_time(hour: hour, minute: minute, am_pm: am_pm,button: 'on',font: true);
    times.add(set);
    notifyListeners();
  }
  int get counting
  {
    return times.length;
  }
}