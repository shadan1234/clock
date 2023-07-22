import 'package:flutter/material.dart';
import 'set_of_time.dart';
class Timing extends ChangeNotifier
{
  List<Set_of_time> times=[
    Set_of_time(hour: '2', minute:'45' , am_pm: 'AM',button: 'off'),
    Set_of_time(hour: '2', minute:'45' , am_pm: 'AM',button: 'off'),
    Set_of_time(hour: '2', minute:'45' , am_pm: 'AM',button: 'off'),

  ];

  void addTime(String hour,String minute,String am_pm)
  {
    final set=Set_of_time(hour: hour, minute: minute, am_pm: am_pm,button: 'on');
    times.add(set);
    notifyListeners();
  }
  int get counting
  {
    return times.length;
  }
}