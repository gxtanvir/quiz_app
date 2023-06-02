import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  final String answerText;
  final Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 91, 113),
        foregroundColor: const Color.fromARGB(255, 225, 243, 247),
      ),
      onPressed: onTap,
      child: Text(
        answerText,
        style: GoogleFonts.dosis(
          color: const Color.fromARGB(255, 225, 243, 247),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
