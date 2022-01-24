import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart';
import 'dart:math';
import './quiz.dart';
import './result.dart';

void main() => runApp(BridgeKeeper());

class BridgeKeeper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BridgeKeeper();
  }
}

class _BridgeKeeper extends State<BridgeKeeper> {
  var _questionIndex = 0;
  var _questionCount = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What is your name?',
      'answers': [
        {'text': 'Sir Galahad of Camelot', 'score': 1},
        {'text': 'Sir Robin of Camelot', 'score': 1},
        {'text': 'Arthur, King of the Britons', 'score': 1},
      ]
    },
    {
      'questionText': 'What is your quest?',
      'answers': [
        {'text': 'To bravely turn my tail and flee', 'score': 10},
        {'text': 'To seek the Holy Grail', 'score': 1},
        {'text': 'To burn more witches', 'score': 10},
      ]
    },
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Blue. No, yellow!', 'score': 10},
        {'text': 'Red', 'score': 1},
      ]
    },
    {
      'questionText': 'What is the capital of Assyria?',
      'answers': [
        {'text': 'Aššur,', 'score': 1},
        {'text': 'Huh? I-- I don\'t know that!', 'score': 10},
        {'text': 'Dur-Athara', 'score': 10},
      ]
    },
    {
      'questionText': 'What is the air-speed velocity of an unladen swallow?',
      'answers': [
        {'text': 'Huh? I-- I don\'t know that!', 'score': 10},
        {'text': '42!', 'score': 10},
        {
          'text': 'What do you mean? An African or European swallow?',
          'score': 100
        },
      ]
    },
  ];

  void _restartQuest() {
    setState(() {
      _questionIndex = 0;
      _questionCount = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
      _questionCount = _questionCount + 1;
      if(_questionCount > 1) {
        final rnd = new Random();
        _questionIndex = 2 + rnd.nextInt(3);
      }
      if (_questionIndex >= _questions.length) {
        //_questionIndex = 0;
      }
    });
    print("Index is: $_questionIndex");
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(
        title: Text('Bridge Keeper'),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bridgekeeper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ((_questionCount < 3) && (_totalScore < 10))
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _restartQuest),
      ),
    ));
  }
}

