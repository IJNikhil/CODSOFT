import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/questionslist.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<Questions> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<Questions> {
  var index = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      index++;
    });
  }

  @override
  Widget build(context) {
    final question = questionsList[index];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: const Color.fromARGB(255, 220, 146, 255),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.text,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...question.shuffledAnswers().map((answer) {
                return CustomAnswerButton(
                  text: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnswerButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const CustomAnswerButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple), // Custom button color
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, // Text color
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
