import 'package:flutter/material.dart';
import 'package:sih_wool_app/provider/auth_provider.dart';
import 'package:sih_wool_app/screens/home_screen.dart';
import 'package:sih_wool_app/screens/login_screen.dart';
import 'package:sih_wool_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/8d9366123d8e11ee900f463033eedcd5.png",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome to ऊर्णा",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "ऊन उत्पादने विश्वस्य सर्वेषां सुखम्",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                // Custom buttons
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () async {
                      if (ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              ),
                            );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      }
                    },
                    text: "Explore in English",
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                    onPressed: () async {
                      if (ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(
                              () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              ),
                            );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      }
                    },
                    text: "Explore in Hindi",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
