import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_exam/data/question_answer.dart';
import 'package:quiz_exam/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  // Increase Question Index Method
  void answerButton(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Display Question Index
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
              // Display Answer Option
              ...questions[currentQuestionIndex]
                  .getShuffledAnswer()
                  .map((answer) {
                return AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerButton(answer);
                    });
              })
            ],
          ),
        ));
  }
}
