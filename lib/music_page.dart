import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:clock_app/music_list.dart';
import 'package:clock_app/music_tile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Music_Page extends StatelessWidget {


AudioPlayer audioPlayer=AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.music_note_rounded),
        onPressed: ()async{
          String? path;
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null && result.files.isNotEmpty) {
             path = result.files.single.path;
            if (path != null) {
              File file = File(path);
              // Rest of your code with the 'file' object
            } else {
              // Handle the case when the path is null
            }
          } else {
            // User canceled the picker or no file was selected
          }
          // Source source=path as Source;
         await audioPlayer.play(DeviceFileSource(path!));

        },
      ),
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