import 'package:flutter/material.dart';
import 'package:sih_wool_app/screens/after_quality_check_screen.dart';

class QualityAssuranceScreen extends StatefulWidget {
  const QualityAssuranceScreen({Key? key}) : super(key: key);

  @override
  QualityAssuranceScreenState createState() => QualityAssuranceScreenState();
}

class QualityAssuranceScreenState extends State<QualityAssuranceScreen> {
  List<String> selectedValues = List.generate(5, (index) => 'Option 1');
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // No app bar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Check Quality of Wool',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Category ${index + 1}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          DropdownButton<String>(
                            value: selectedValues[index],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValues[index] = newValue!;
                              });
                            },
                            items: <String>[
                              'Option 1',
                              'Option 2',
                              'Option 3',
                              'Option 4',
                              'Option 5',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            isExpanded: true,
                            iconSize: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: acceptTerms,
                  onChanged: (bool? newValue) {
                    setState(() {
                      acceptTerms = newValue ?? false;
                    });
                  },
                ),
                const Text('I accept the terms and conditions'),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: acceptTerms
                    ? () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AfterQualityCheckScreen(),
                    ),
                  );
                }
                    : null, // Disable the button if terms are not accepted
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Change the button color to purple
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30, // Adjust horizontal padding
                    vertical: 16, // Adjust vertical padding
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white, // Change the text color to white
                    fontSize: 18, // Adjust the button font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
