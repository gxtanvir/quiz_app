import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_exam/data/question_answer.dart';
import 'package:quiz_exam/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.restartButton});
  final List<String> chosenAnswer;
  final void Function() restartButton;
  
  // Answer store method
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].questionText,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    final summary = getSummaryData();
    final noTotalQuestions = questions.length;
    final noCorrectAnswer = summary.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You have answered $noCorrectAnswer out of $noTotalQuestions questions correctly!",
              style: GoogleFonts.dosis(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 225, 243, 247),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            QuizSummary(summaryData: summary),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: const Color.fromARGB(255, 5, 91, 113),
              ),
              onPressed: restartButton,
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Color.fromARGB(255, 225, 243, 247),
              ),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
