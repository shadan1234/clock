import 'package:clock_app/database_handler.dart';
import 'package:flutter/material.dart';
import 'set_of_time.dart';
import 'package:sqflite/sqflite.dart';

class Timing extends ChangeNotifier
{
  final DatabaseHandler db= DatabaseHandler();
  Timing()
  {
    fetchTimesFromDatabase();

  }
  Future<void> fetchTimesFromDatabase() async {
    times = (await db.fetchFromDatabase())!;
    notifyListeners(); // Notify listeners after populating the list
  }

  List<Set_of_time> times = [];  // Initialize as an empty list

  // List<Set_of_time> times=[
  //   Set_of_time(hour: 2, minute:03 , am_pm: 'AM',button: 'off',font: false, path: 'Luke-Bergs-Bliss.mp3'),
  //   Set_of_time(hour: 2, minute:04 , am_pm: 'AM',button: 'off',font: false, path: 'Luke-Bergs-Bliss.mp3'),
  //   Set_of_time(hour: 2, minute:05 , am_pm: 'AM',button: 'off',font: false, path: 'Luke-Bergs-Bliss.mp3'),
  //
  // ];

  // Future<void> fetchFromDatabase() async {
  //   final db = await DatabaseHandler().openDB();
  //   if (db != null) {
  //     final List<Map<String, dynamic>>? maps = await db.query('set_of_times');
  //
  //     if (maps != null) {
  //       times = List.generate(maps.length, (i) {
  //         return Set_of_time(
  //           hour: maps[i]['hour'],
  //           minute: maps[i]['minute'],
  //           am_pm: maps[i]['am_pm'],
  //           button: maps[i]['button'],
  //           font: maps[i]['font'] == 1,
  //           path: maps[i]['path'],
  //         );
  //       });
  //     }
  //   }
  //
  //   notifyListeners();  // Notify listeners after populating the list
  // }




  void addTime (int hour,int minute,String am_pm,String path) async
  {
    final set=Set_of_time(hour: hour, minute: minute, am_pm: am_pm,button: 'on',font: true, path: path,);
    times.add(set);
    final db=DatabaseHandler();

    await db.saveToDatabase(set);
    notifyListeners();
  }
  void delTime(int index) async
  {
    if(times[index].id!=null)
   await db.deleteAlarm(times[index].id!);

    times.removeAt(index);

    notifyListeners();
  }
  void changeTime(int index,int hour,int minute,String am_pm,String path)async
  {
    times[index].hour=hour;
    times[index].minute=minute;
    times[index].am_pm=am_pm;
    times[index].path=path;
    times[index].button;
    times[index].font=true;
  await db.updateSetOfTime(index,times[index]);
    notifyListeners();

  }
  int get counting
  {
    return times.length;
  }
  void update(Set_of_time time) async{
    time.toggle();
  await db.updateSetOfTime(times.indexOf(time),time);
    notifyListeners();
  }
  // Future<Database?>openDB ()async{
  //   _database=(await DatabaseHandler().openDB())!;
  //   return _database;
}

