import 'package:clock_app/alarm_row.dart';
import 'package:flutter/material.dart';
import 'set_alarm.dart';
import 'timing_set.dart';
class Home_Screen extends StatelessWidget {

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context)=>SetAlarm());
      },backgroundColor: Colors.black54,child: Icon(Icons.add),),
      appBar: AppBar(

        backgroundColor: Colors.white10,
        toolbarHeight: 130,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              'Alarm',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Alarm will ring in 49 min',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
        actions: [
          PopupMenuButton<int>(
            color: Colors.black26,
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Logout')),
              PopupMenuItem<int>(value: 1, child: Text('Settings')),
            ],
          ),
        ],
      ),
      body: Alarm_Row(),
    );
  }
}



