import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_exam/data/question_answer.dart';
import 'package:quiz_exam/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  // Increase Index
  void answerButton() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                questions[currentQuestionIndex].questionText,
                style: GoogleFonts.dosis(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 225, 243, 247),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              ...questions[currentQuestionIndex].answers.map((answer) {
                return AnswerButton(answerText: answer, onTap: answerButton);
              })
            ],
          ),
        ));
  }
}
