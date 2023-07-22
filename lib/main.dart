
import 'package:clock_app/timing_set.dart';
import 'package:flutter/material.dart';
import 'Home_Screen.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context){
        return Timing() ;
      },
      child: MaterialApp(
        home: Home_Screen(),
      ),
    );
  }
}


