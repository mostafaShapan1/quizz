import 'package:flutter/material.dart';
import 'package:quizz/result.dart';

class QuizPage extends StatefulWidget {
  final String name;
  const QuizPage({super.key, required this.name});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, Object>> _questions = [
    {
      'question': 'What is Flutter?',
      'answers': [
        ' A web browser',
        'Home Tool Markup Language',
        'A mobile operating system',
        'An open-source UI software development kit'
      ],
      'correctAnswer': 'An open-source UI software development kit',
    },
    {
      'question': 'Which programming language is used to develop apps in Flutter?',
      'answers': ['Java', 'Python', 'Ruby', 'Dart'],
      'correctAnswer': 'Dart',
    },
    {
      'question': 'What is the primary purpose of the Flutter framework?',
      'answers': [
        'To build native desktop applications',
        'To create cross-platform mobile applications',
        'To develop web applications',
        'To enhance gaming performance'
      ],
      'correctAnswer': 'To create cross-platform mobile applications',
    }
  ];

  void _answerQuestion(String answer) {
    if (answer == _questions[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }

    if (_currentQuestionIndex == _questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex == _questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: _score, name: widget.name),
        ),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'QUIZ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Ellipse1.png',
                height: 150,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFA7F585),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 11,
                      offset: Offset(0,5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${_currentQuestionIndex + 1}/${_questions.length}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _questions[_currentQuestionIndex]['question'] as String,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (_questions[_currentQuestionIndex]['answers']
                              as List<String>)
                          .map((answer) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _answerQuestion(answer),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                              ),
                              child: Text(
                                answer,
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              _currentQuestionIndex == _questions.length - 1
                                  ? 'FINISH'
                                  : 'NEXT',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
