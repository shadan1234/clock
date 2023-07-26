import 'package:flutter/cupertino.dart';

import 'music.dart';

class Music_list extends ChangeNotifier {
  List<Music> musics = [
    Music(text: '01   Bhaag D.K. Bose, Aandhi Aayi (Delhi Belly).mp3'),
    Music(
        text:
            '2_Chainz___Wiz_Khalifa_-_We_Own_It__Fast___Furious___Official_Lyric_Video_(128kbps).mp3'),
    Music(
        text:
            '05  Khawaja Mere Khawaja (Instrumental) - www.downloadming.com.mp3'),
    Music(text: '06 - Afreen Afreen - S09E02.mp3'),
    Music(
        text:
            '12_Saal___Bilal_Saeed___Twelve___Punjabi_Songs___Speed_Records(128kbps).mp3'),
    Music(text: '19 Zindagi Ek Safar Hai Suhana.mp3'),
    Music(text: '38---Jiyein-Kyun-(Dum-Maaro-Dum)-(LeBeWafa.Com).mp3'),
    Music(
        text:
            '_Make_Some_Noise_For_Desi_Boyz__Title_Song___Desi_Boyz___Akshay_Kumar,_John_Abraham(128kbps).mp3'),
    Music(text: '_Pyar Diwana Hota Hai(PagalWorld.com).mp3'),
    Music(
        text:
            '_Tose_Naina_Mickey_Virus__Arijit_Singh_Latest_Song___Mickey_Virus(128k).mp3'),
    Music(
        text:
            'Andy_Grammer_-_Honey,_I\'m_Good._(Official_Music_Video)(256k).mp3'),
    Music(
        text:
            'Autobots_Reunite__Transformers__Age_of_Extinction_EP_(256k).mp3'),
    Music(text: 'Avicii_-_The_Nights(256k).mp3'),
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
