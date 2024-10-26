import 'package:flutter/material.dart';
import 'starting_page.dart'; // Update this import
import 'swipe_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/paulIII.png', // Your image path
              fit: BoxFit.cover, // Ensures the image fills the entire screen
            ),
          ),

          // The button on top of the image
          Positioned(
            bottom: 50, // Adjust this value to place the button higher or lower
            left: 20, // Centering the button horizontally
            right: 20,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SwipeButton(
                onSwipeComplete: () {
                  // Navigate to CategoriesPage when swipe is complete
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const StartingPage(),
                    ),
                  );
                },
              ),
              // child: ElevatedButton(
              //   onPressed: () {
              //     // Navigate to CategoriesPage when button is clicked
              //     Navigator.of(context).pushReplacement(
              //       MaterialPageRoute(
              //         builder: (context) => const StartingPage(),
              //       ),
              //     );
              //   },
              //   child: const Text('Coach me how to eat, move and be healthy'),
              //   style: ElevatedButton.styleFrom(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              //     shape: RoundedRectangleBorder(
              //       borderRadius:
              //           BorderRadius.circular(40), // Fully rounded button
              //     ),
              //     elevation: 10, // Small shadow to lift the button
              //     textStyle: const TextStyle(
              //       fontSize: 14,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
