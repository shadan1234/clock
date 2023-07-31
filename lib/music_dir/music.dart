class Music{
  String text;
  bool check;
  // bool song_play_or_not;
  Music({this.check=false,required this.text,});
  void toggle()
  { check = !check;

  }
  // void toggle2()
  // { song_play_or_not=!song_play_or_not;
  // }
}
// this.song_play_or_not=false