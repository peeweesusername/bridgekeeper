import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class QuestionAudio extends StatelessWidget {
  final int questionIndex;

  QuestionAudio(this.questionIndex);

  final questionAudio = const [
    {
      "soundfn": "whatisyourname.mp3",
    },
    {
      "soundfn": "whatisyourquest.mp3",
    },
    {
      "soundfn": "whatisyourfavoritecolor.mp3",
    },
    {
      "soundfn": "whatisthecapitalofassyria.mp3",
    },
    {
      "soundfn": "whatistheairspeedvelocity.mp3",
    }
  ];

  playQuestionSound() {
    AudioCache player = AudioCache();
    String soundfn = questionAudio[questionIndex]['soundfn'];

    print("playing sound ${soundfn}");
    player.play(soundfn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: playQuestionSound());
  }
}
