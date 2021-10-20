import 'package:flutter/material.dart';
import './questionaudio.dart';

class Question extends StatelessWidget {
  final String questionText;
  final int  questionIndex;

  Question(this.questionText, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          child: Text(
            questionText,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        QuestionAudio(questionIndex),
      ],
    );
  }
}

