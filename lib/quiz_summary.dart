import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 5, 91, 113),
                    shape: const CircleBorder(
                      side: BorderSide(width: 10.5),
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    (((data['question_index'] as int) + 1)).toString(),
                    style: GoogleFonts.dosis(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.dosis(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 212, 245, 252),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.dosis(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 196, 169, 79),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.dosis(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 100, 215, 59),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
