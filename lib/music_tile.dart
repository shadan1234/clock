import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class Music_tile extends StatelessWidget {
  String text;
  bool check;
  Function checkbox;
  // bool song_play_or_not;
  // ,required this.song_play_or_not
  AudioPlayer audioPlayer = AudioPlayer();
void play()async{

  await audioPlayer.play(AssetSource('$text'));
}
void stop()async{
  await audioPlayer.stop();
}
  Music_tile({required this.text,required this.check,required this.checkbox});

  @override
  Widget build(BuildContext context) {
    return ListTile(

        leading: Icon(Icons.music_note_rounded),

    title: TextButton(  onPressed: () {
   //    print(song_play_or_not);
   //    if(song_play_or_not==true) {
   // print('yes');
      if(check==true)
      {
        play();
      }
      // }
      else {
       stop();

      }
      //   print('no');
      // }
    },

    child: Text('$text')),


        trailing: Checkbox(value:check , onChanged: (value)
        {

          checkbox(value);

        },


    )
    );
}
}
