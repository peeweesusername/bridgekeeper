import 'dart:ffi';

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton( //was RaisedButton
        //  style: ButtonStyle(
        //    backgroundColor: MaterialStateProperty.all(Colors.lime),
        //    foregroundColor: MaterialStateProperty.all(Colors.black),
        //),
        style: ElevatedButton.styleFrom(
            primary: Colors.grey, onPrimary: Colors.black),
        child: Text(answerText),
        onPressed: selectHandler,
      ),
    );
  }
}
