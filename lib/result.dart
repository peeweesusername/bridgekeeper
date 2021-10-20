import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './resultaudio.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback restartHandler;

  Result(this.resultScore, this.restartHandler);

  String get resultPhrase {
    var resultText =
        'You walk across the bridge over the Gorge of Eternal Peril';

    if (resultScore >= 10) {
      resultText = 'You are cast into the Gorge of Eternal Peril';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ResultAudio(resultScore),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            //was OutlineButton
            style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.grey,
                side: BorderSide(color: Colors.black),
            ),
            onPressed: restartHandler,
            child: Text('Restart Quest'),
          ),
        ],
      ),
    );
  }
}
