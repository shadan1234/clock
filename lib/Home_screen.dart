import 'package:clock_app/alarm_row.dart';
import 'package:flutter/material.dart';
import 'set_alarm.dart';
import 'timing_set.dart';

class Home_Screen extends StatelessWidget {
  void handleClick(int item) {
    switch (item) {
      case 0:
        {
          // TODO try to show a list of music and the user can select from it
          break;
        }
      case 1:
        {
          // TODO try to delete some of the alarm which was previously fetched
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => SetAlarm());
        },
        backgroundColor: Colors.black54,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
          Theme(
            data: Theme.of(context).copyWith(

            popupMenuTheme: PopupMenuThemeData(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            )

            ),
            child: PopupMenuButton<int>(
              offset: Offset(0,85),
              icon: Icon(Icons.more_vert,
              color: Colors.black,),
              onSelected: (item) => handleClick(item),

              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Select Music',)),
                PopupMenuItem<int>(value: 1, child: Text('Edit')),
              ],
            ),
          ),
        ],
      ),
      body: Alarm_Row(),
    );
  }
}
