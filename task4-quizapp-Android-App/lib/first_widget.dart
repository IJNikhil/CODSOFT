import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {
  FirstWidget(this.switchScreen, {super.key});

  void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Welcome to the Quiz App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CupertinoButton(
            onPressed: switchScreen,
            borderRadius: BorderRadius.circular(30),
            color: Colors.deepPurple, // Button color
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white, // Icon color
                ),
                SizedBox(width: 10),
                Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
