import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ResultAudio extends StatelessWidget {

  final int resultScore;

  ResultAudio(this.resultScore);

  playResultAudio() {
    AudioCache player = AudioCache();

    if (resultScore >= 100) {
      player.play("bridgekeepercastintogorge.mp3");
    } else if (resultScore >= 10) {
      player.play("AHHG.mp3");
    } else {
      player.play("offyougo.mp3");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: playResultAudio());
  }
}