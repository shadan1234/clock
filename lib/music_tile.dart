
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Music_tile extends StatefulWidget {
  final String text;
  bool check;
  Function checkbox;

  Music_tile({
    required this.text,
    required this.check,
    required this.checkbox,
  });

  @override
  _Music_tileState createState() => _Music_tileState();
}

class _Music_tileState extends State<Music_tile> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  void play() async {
    await audioPlayer.play(AssetSource(widget.text));
  }

  void stop() async {
    await audioPlayer.stop();
  }

  void toggle() {
    if (widget.check) {
      stop();
    } else {
      play();
    }
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.music_note_rounded),
      title: TextButton(
        onPressed: () {
          widget.checkbox(!widget.check);
          toggle();
        },
        child: Text(widget.text),
      ),
      trailing: Checkbox(
        value: widget.check,
        onChanged: (value) {
          widget.checkbox(value);
          toggle();
        },
      ),
    );
  }
}

//Stateful widget helpful because it does not destroy the entire widget and it changes only the check so audioplayer instance is saved but if i use statless widget it recreates the entire widget although check value will be changed in both but audioplayer instance is destroyed and recreated in statless widget which leads to problem
// provider package on the other hand changes only that part of the UI which is affected with the change and not the entire widget tree but in the code above underestand that music->music_list where music_list is provider so any change in it will be shown to music page who is the consumer now music page being stless will always be rebult everytime i call for checkbox
// to toggle the value but it does not bother us  . whereas music_page shows music_tile which needs to be stful for audioplayer so that it does not get destroyed now
// 4 files are used just to toggle the value of check cuz it will change only a single music tile and not all
//suppose i change the value of check in music tile itself then all the music tile check will be changed so to prevent this 4 files is used for exact demonst check copy
// now checkbox function it takes a bool value but whenever it is pressed onChanged i call a function and using 4 files i change the value of check now the value which is passed like
//  onChanged: (value) {
//           widget.checkbox(value);
// here value is not used at all neither in the function which is called ie checkbox it is given just because it is a syntax but implementaion is done . i have used 4 files to change the value of check but none of it requires (value) parameter although it can be used but not now cuz i don't want to change all the music tile value so i take it in 4 files do the same thing that the value shows and could be done in a single line ie toggle the value of check