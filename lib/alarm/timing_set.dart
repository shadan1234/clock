import 'package:flutter/material.dart';
import 'set_of_time.dart';
class Timing extends ChangeNotifier
{
  List<Set_of_time> times=[
    Set_of_time(hour: 2, minute:03 , am_pm: 'AM',button: 'off',font: false, path: 'Luke-Bergs-Bliss.mp3'),
    Set_of_time(hour: 2, minute:04 , am_pm: 'AM',button: 'off',font: false, path: 'Luke-Bergs-Bliss.mp3'),
    Set_of_time(hour: 2, minute:05 , am_pm: 'AM',button: 'off',font: false, path: 'Luke-Bergs-Bliss.mp3'),

  ];

  void addTime(int hour,int minute,String am_pm,String path)
  {
    final set=Set_of_time(hour: hour, minute: minute, am_pm: am_pm,button: 'on',font: true, path: path,);
    times.add(set);
    notifyListeners();
  }
  void delTime(int index)
  {
    times.removeAt(index);
    notifyListeners();
  }
  int get counting
  {
    return times.length;
  }
  void update(Set_of_time time) {
    time.toggle();
    notifyListeners();
  }
}