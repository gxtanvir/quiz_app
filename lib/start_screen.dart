import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.screenChange});
  final void Function() screenChange;

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz.png',
            width: 200,
            color: const Color.fromARGB(255, 225, 243, 247),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Your Quiz For Today',
            style: GoogleFonts.dosis(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 225, 243, 247),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 5, 91, 113),
              foregroundColor: const Color.fromARGB(255, 225, 243, 247),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
            ),
            onPressed: screenChange,
            icon: const Icon(Icons.arrow_right_sharp),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
