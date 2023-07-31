import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:clock_app/music_list.dart';
import 'package:clock_app/music_tile.dart';
import 'package:file_picker/file_picker.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.music_note_rounded),
        onPressed: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null && result.files.isNotEmpty) {
            path = result.files.single.path;
            if (path != null) {
              File file = File(path!);
              // Rest of your code with the 'file' object
            } else {
              // Handle the case when the path is null
              path = 'Luke-Bergs-Bliss.mp3';
            }
          } else {
            // User canceled the picker or no file was selected
            path = 'Luke-Bergs-Bliss.mp3';
          }
          // Source source=path as Source;

          // await audioPlayer.play(DeviceFileSource(path!));
        },
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {

              audioPlayer.stop();
              if(selectedMusicText!=null)
                {
                  path=(selectedMusicText!+'d');
                }
              else
                {
                  path=(path!+'c')!;
                }

              print('music_page ka path $path');
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
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null && result.files.isNotEmpty) {
                        path = result.files.single.path;
                        if (path != null) {
                          File file = File(path!);
                          // Rest of your code with the 'file' object
                        } else {
                          // Handle the case when the path is null
                          path = 'Luke-Bergs-Bliss.mp3';
                        }
                      } else {
                        // User canceled the picker or no file was selected
                        path = 'Luke-Bergs-Bliss.mp3';
                      }
                      // Source source=path as Source;

                      // await audioPlayer.play(DeviceFileSource(path!));
                    },
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();

                      if (result != null && result.files.isNotEmpty) {
                        path = result.files.single.path;
                        if (path != null) {
                          File file = File(path!);
                          // Rest of your code with the 'file' object
                        } else {
                          // Handle the case when the path is null
                          path = 'Luke-Bergs-Bliss.mp3';
                        }
                      } else {
                        // User canceled the picker or no file was selected
                        path = 'Luke-Bergs-Bliss.mp3';
                      }
                      // Source source=path as Source;

                      // await audioPlayer.play(DeviceFileSource(path!));
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

                      print('yes');
                      if (checkboxState) {
                        setState(() {
                           selectedMusicText = music.text;
                        });
                      } else {
                        setState(() {
                          selectedMusicText = null;
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
