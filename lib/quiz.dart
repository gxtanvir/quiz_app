import 'package:flutter/material.dart';
import 'package:quiz_exam/data/question_answer.dart';
import 'package:quiz_exam/start_screen.dart';
import 'package:quiz_exam/question_screen.dart';
import 'package:quiz_exam/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswer = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(
      screenChange: switchScreen,
    );
  }

  // Switch Screen Method
  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chosenAnswer,
      );
    });
  }

  // Restart Quiz Method
  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = QuestionScreen(onSelectAnswer: chosenAnswer);
    });
  }

  // Method For Storing Answers
  void chosenAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          chosenAnswer: selectedAnswer,
          restartButton: restartQuiz,
        );
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 19, 110, 133),
                Color.fromARGB(255, 66, 142, 161),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
