import 'package:audioplayers/audioplayers.dart';
import 'music_list.dart';
import 'package:clock_app/music_dir/music_tile.dart';
import 'package:clock_app/components/button_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Music_Page extends StatefulWidget {
  @override
  State<Music_Page> createState() => _Music_PageState();
}

class _Music_PageState extends State<Music_Page> {
  String? path;

  String? selectedMusicText;

  AudioPlayer audioPlayer = AudioPlayer();
  bool fabvisible = false;
  void updateFabVisibility(String? newPath) {
    setState(() {
      fabvisible = newPath != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO as soon as the user selects a song it should appear
      floatingActionButton: Visibility(
        visible: fabvisible,
        child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.check,
              color: Colors.black,
            ),
            // child: Icon(Icons),

            onPressed: () async {

              audioPlayer.stop();
              if (selectedMusicText != null) {
                path = (selectedMusicText! + 'd');
              } else if (selectedMusicText == null && path != null) {
                path = (path! + 'c');
              } else {
                path = null;
              }

              // print('ye hai path from musicpage $path');

              print('ye hai path from musicpage fab $path');
              Navigator.pop(context, path);
            }),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              audioPlayer.stop();
              if (selectedMusicText != null) {
                path = (selectedMusicText! + 'd');
    // (checkboxState) {
    //          musiclist.update(music);
              } else if (selectedMusicText == null && path != null) {
                path = (path! + 'c')!;
              } else {
                path = null;
              }

              print('ye hai path from musicpage $path');
              Navigator.pop(context, path);
            },
            icon: Icon(
              Icons.arrow_back,
            )),
        title: Text('Ringtone'),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            // padding: EdgeInsets.only(left: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 10),
                  child: Text(
                    'Custom ',
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ),
                // SizedBox(height: 15,),
                ListTile(
                  leading: TextButton(
                      child: Text('Select from files',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      // onPressed: Button_functions().onPress,
                      onPressed: () async {
                        String? newPath = await Button_functions().onPress();
                        updateFabVisibility(newPath);
                        path=newPath;
                      }),
                  trailing: IconButton(
                    onPressed: () async {
                      String? newPath = await Button_functions().onPress();
                      updateFabVisibility(newPath);
                      path=newPath;
                    },
                    icon: Icon(Icons.navigate_next),
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 10, bottom: 10),
            child: Text(
              'System Ringtones',
              style: TextStyle(color: Colors.black45),
            ),
          ),
          Expanded(
            child: Consumer<Music_list>(
                builder: (BuildContext context, musiclist, Widget? child) {
              return ListView.builder(
                itemCount: musiclist.count(),
                itemBuilder: (context, index) {
                  final music = musiclist.musics[index];
                  return Music_tile(
                    text: music.text,
                    check: music.check,
                    audioPlayer: audioPlayer,
                    checkbox: (checkboxState) {
                      musiclist.update(music);

                      if (checkboxState) {
                        setState(() {
                          selectedMusicText = music.text;
                          updateFabVisibility(selectedMusicText);
                        });
                      } else {
                        setState(() {
                          selectedMusicText = null;
                          updateFabVisibility(null);
                        });
                      }
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
