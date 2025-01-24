import 'package:flutter/material.dart';
import 'package:myapp/data/quizz.dart'; // Assuming your data and questions are here
import 'start_screen.dart'; // Make sure this import points to your StartScreen.

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.selectedAnswers, super.key});

  final List<String> selectedAnswers;

  int getCorrectAnswers() {
    // Example: Assuming 'correctAnswer' is the correct answer for each question
    int correctAnswers = 0;
    for (int i = 0; i < selectedAnswers.length; i++) {
      if (selectedAnswers[i] == questions[i].correctAnswer) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers = getCorrectAnswers();
    int totalQuestions = questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display score
              Text(
                'You answered $correctAnswers out of $totalQuestions questions correctly!',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Restart quiz button with icon
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const StartScreen()),
                  );
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
