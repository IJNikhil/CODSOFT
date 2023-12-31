import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Divider( // Add a Divider between items
                    color: Colors.blue, // Set the color of the Divider
                    thickness: 1, // Set the thickness of the Divider
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                (data['correct_answer'] as String) ==
                                    (data['user_answer'] as String)
                                    ? const Color.fromARGB(255, 239, 75, 130)
                                    : Colors.blueAccent)),
                        onPressed: () {},
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data['question'] as String),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              (data['correct_answer'] as String),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 239, 75, 130),
                              ),
                            ),
                            Text(
                              (data['user_answer'] as String),
                              style: const TextStyle(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );

          }).toList(),
        ),
      ),
    );
  }
}
