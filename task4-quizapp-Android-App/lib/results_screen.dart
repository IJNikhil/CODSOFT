import 'package:flutter/material.dart';
import 'package:quizapp/questions_summary.dart';
import 'package:quizapp/questionslist.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.changeScreen,
  });

  final List<String> chosenAnswer;
  final void Function() changeScreen;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionsList[i].text,
        'correct_answer': questionsList[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestion = chosenAnswer.length;
    final correctAnswer = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Results',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'You answered $correctAnswer questions correctly out of $totalQuestion.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 30),
              QuestionsSummary(summaryData: getSummaryData()),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: changeScreen,
                icon: Icon(Icons.refresh),
                label: Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
