import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'timing_set.dart';
import 'things_to_be_diplayed.dart';
// import 'package:clock_app/things_to_be_displayed.dart';
class Alarm_Row extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return  Consumer<Timing>(
      builder: (BuildContext context, timi, Widget? child) {
        return ListView.builder(itemCount:timi.counting,itemBuilder: (context,index)
        {
          final tim=timi.times[index];
          return Things(hours: tim.hour, minutes: tim.minute, am_or_pm: tim.am_pm,button_state: tim.button,);



        },

        );
      },

    );
  }
}
