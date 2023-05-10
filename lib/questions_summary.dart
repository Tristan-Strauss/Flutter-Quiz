import 'package:advanced_fundamentals/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionsSummany extends StatelessWidget {
  const QuestionsSummany(this.summaryData, this.selectedAnswers, {super.key});

  final List<Map<String, Object>> summaryData;

  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    const Color incorrectColor = Colors.red;
    const Color correctColor = Colors.blue;
    Color color;

    Color answerColor(int i) {
      if (questions[i].answers[0] == selectedAnswers[i]) {
        color = correctColor;
      } else {
        color = incorrectColor;
      }

      return color;
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  CircleAvatar(
                    backgroundColor: answerColor(data["question_index"] as int),
                    radius: 16,
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data["user_answer"] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 182, 90, 196)),
                        ),
                        Text(
                          data["correct_answer"] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 236, 73, 220),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
