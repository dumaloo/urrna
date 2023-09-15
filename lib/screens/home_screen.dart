import 'package:flutter/material.dart';
import 'package:sih_wool_app/provider/auth_provider.dart';
import 'package:sih_wool_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:sih_wool_app/screens/wool_education_screen.dart';
import 'package:sih_wool_app/screens/wool_news_screen.dart';
import 'package:sih_wool_app/screens/quality_assurance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    WoolNewsScreen(),
    const QualityAssuranceScreen(),
    WoolEducationScreen(),
    const ExampleScreen(),
    const ExampleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("SIH Wool App"),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey, // Set the unselected item color
        selectedItemColor: Colors.purple, // Set the selected item color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article), // Wool News icon
            label: 'Wool News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check), // Quality Assurance icon
            label: 'Quality Assurance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school), // Wool Education icon
            label: 'Wool Education',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Example icon
            label: 'Example 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Example icon
            label: 'Example 2',
          ),
        ],
      ),
    );
  }
}

//Example Screen
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Your Example screen content goes here
    return const Center(
      child: Text("Example Screen"),
    );
  }
}
