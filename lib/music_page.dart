import 'package:clock_app/music_list.dart';
import 'package:clock_app/music_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Music_Page extends StatefulWidget {


  @override
  State<Music_Page> createState() => _Music_PageState();
}

class _Music_PageState extends State<Music_Page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  leading: IconButton(onPressed: () {  }, icon:Icon( Icons.arrow_back,)),
  title: Text('Select from files'),
  elevation: 0,
  backgroundColor: Colors.black,
),
      body: Consumer<Music_list>(
        builder:(BuildContext context, musiclist, Widget? child)
    {
      return ListView.builder(itemCount: musiclist.count(),itemBuilder:(context,index) {
        final music=musiclist.musics[index];
        return Music_tile(text: music.text,check: music.check,checkbox: (checkboxState){
          musiclist.update(music);
          // print('yes');
        },);
      },
      );
    }

            ),
      );

      }
}



// song_play_or_not: music.song_play_or_not,