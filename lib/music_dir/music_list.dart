import 'package:flutter/cupertino.dart';

import 'music.dart';

class Music_list extends ChangeNotifier {
  List<Music> musics = [
    Music(text: 'cinematic-documentary-story-main-10050.mp3'),
    Music(
        text:
            'cinematic-violin-uplifting-music-147713.mp3'),
    Music(
        text:
            'cinematic-epic-trailer-clock-trailer-141369.mp3'),
   Music(text: 'the-clock-is-ticking-159702.mp3'),
    Music(text: 'travel-through-time-154666.mp3'),
    Music(
        text:
            'clock-9323.mp3'),
    Music(text: 'clock-news-countdown-160438.mp3'),
    Music(text: 'countdown-action-trailer-157359.mp33'),
    Music(
        text:
            'li-jali-cucu-8466.mp3'),

    Music(
        text:
            'thinking-time-148496.mp3'),
    Music(
        text:
            'zero-countdown-aggressive-trailer-countdown-147665.mp3'),


  ];

  void update(Music music) {
    music.toggle();
    notifyListeners();
  }
  // void update2(Music music) {
  //   music.toggle2();
  //   notifyListeners();
  // }

  int count() {
    return musics.length;
  }
}
