import 'package:flutter/material.dart';

class QualityAssuranceScreen extends StatefulWidget {
  const QualityAssuranceScreen({Key? key}) : super(key: key);

  @override
  QualityAssuranceScreenState createState() => QualityAssuranceScreenState();
}

class QualityAssuranceScreenState extends State<QualityAssuranceScreen> {
  int questionIndex = 0;
  List<List<Map<String, dynamic>>> questions = [
    [
      {"label": "Merino", "value": 10},
      {"label": "Rambouillet", "value": 9},
      {"label": "Corriedale", "value": 7},
      {"label": "Romney", "value": 6},
      {"label": "Suffolk", "value": 4},
      {"label": "Dorset", "value": 3},
      {"label": "Other/Unknown", "value": 2},
    ],
    [
      {"label": "Less than 18 microns", "value": 10},
      {"label": "18-20 microns", "value": 8},
      {"label": "21-24 microns", "value": 6},
      {"label": "25-28 microns", "value": 4},
      {"label": "29-32 microns", "value": 2},
      {"label": "Over 32 microns", "value": 1},
    ],
    [
      {"label": "Over 10 cm", "value": 10},
      {"label": "8-10 cm", "value": 8},
      {"label": "6-8 cm", "value": 6},
      {"label": "4-6 cm", "value": 4},
      {"label": "2-4 cm", "value": 2},
      {"label": "Under 2 cm", "value": 1},
    ],
    [
      {"label": "Pure White and Uniform", "value": 10},
      {"label": "Slight Color Variation or Non-Uniformity", "value": 7},
      {"label": "Noticeable Color Variation or Non-Uniformity", "value": 5},
      {"label": "Significant Color Variation or Non-Uniformity", "value": 3},
      {"label": "Mixed Colors or Highly Non-Uniform", "value": 1},
    ],
    [
      {"label": "Pristine and Well-Skirted", "value": 10},
      {"label": "Minor Impurities, Requires Some Skirting", "value": 8},
      {"label": "Moderate Impurities, Significant Skirting Needed", "value": 6},
      {"label": "Heavy Impurities, Extensive Skirting Required", "value": 4},
      {"label": "Highly Contaminated, Difficult to Skirt", "value": 2},
      {"label": "Unusable Due to Contamination", "value": 1},
    ],
  ];

  // Initialize selectedValues with default values matching the number of questions in initState.
  List<int?> selectedValues = [];
  int? totalScore;

  @override
  void initState() {
    super.initState();
    selectedValues = List<int?>.filled(questions.length, null);
    totalScore = null;
  }

  void answerQuestion(int? value) {
    setState(() {
      selectedValues[questionIndex] =
          value; // Store the selected value for the current question
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      }
    });
  }

  void goToPreviousQuestion() {
    setState(() {
      if (questionIndex > 0) {
        questionIndex--;
      }
    });
  }

  void calculateWoolQuality() {
    if (selectedValues.contains(null)) {
      // Check if any question was not answered
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Incomplete Assessment"),
            content: const Text(
                "Please answer all questions to calculate wool quality."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      int total = selectedValues.fold(
          0, (prev, element) => prev + (element ?? 0));
      setState(() {
        totalScore = total;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Quality Assurance'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${questionIndex + 1}. ${questionIndex < questions.length
                  ? questions[questionIndex][0]["label"]
                  : "Results"}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: questions[questionIndex].map((question) {
                return ListTile(
                  title: Row(
                    children: [
                      Radio<int?>(
                        value: question["value"],
                        groupValue: selectedValues[questionIndex],
                        onChanged: (int? value) {
                          answerQuestion(value);
                        },
                      ),
                      Text(question["label"]),
                    ],
                  ),
                );
              }).toList(),
            ),
            if (totalScore == null) ...[
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (questionIndex > 0)
                    ElevatedButton(
                      onPressed: goToPreviousQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text('Previous'),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (questionIndex < questions.length - 1) {
                        goToNextQuestion();
                      } else {
                        calculateWoolQuality();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: Text(questionIndex == questions.length - 1
                        ? 'Submit'
                        : 'Next'),
                  ),
                ],
              ),
            ],
            if (totalScore != null) ...[
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Total Score: $totalScore out of 50',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 16),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) =>
            //           QualityAssuranceScreen()), // Navigate to QualityAssuranceScreen
            //     );
            //   },
            //   child: Text('Go to Second Screen'),
            // ),
          ],
        ),
      ),
    );
  }
}
