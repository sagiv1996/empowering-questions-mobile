import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;

  const QuestionWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(3),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Liked!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text('Like'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
