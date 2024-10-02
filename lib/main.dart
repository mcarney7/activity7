// Importing necessary Flutter material package
import 'package:flutter/material.dart';

// The main function that runs the app
void main() {
  // Runs the MyApp widget, which is the root of the app
  runApp(MyApp());
}

// Creating a stateless widget for the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MaterialApp as the base for the app
    return MaterialApp(
      // Setting the home screen to the FadingTextAnimation widget
      home: FadingTextAnimation(),
    );
  }
}

// Creating a stateful widget to handle the fading text animation
class FadingTextAnimation extends StatefulWidget {
  @override
  _FadingTextAnimationState createState() => _FadingTextAnimationState();
}

// The state class where the animation logic is defined
class _FadingTextAnimationState extends State<FadingTextAnimation> {
  // Boolean variable to track whether the text is visible or not
  bool _isVisible = true;

  // Function to toggle the visibility of the text
  void toggleVisibility() {
    setState(() {
      // Inverting the visibility state on button press or tap
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Building the scaffold of the app
    return Scaffold(
      // App bar with a title
      appBar: AppBar(
        title: Text('Fading Text Animation'),
      ),
      // Main content of the app
      body: Center(
        // GestureDetector to handle tapping on the text to toggle visibility
        child: GestureDetector(
          onTap: toggleVisibility, // Toggles visibility when the text is tapped
          child: AnimatedOpacity(
            // The opacity of the text depends on _isVisible variable
            opacity: _isVisible ? 1.0 : 0.0,
            // Duration of the fade animation
            duration: const Duration(seconds: 1),
            // Adding a curve to the animation for a smoother effect
            curve: Curves.easeInOut,
            // The text that will fade in and out
            child: const Text(
              'Hello, Flutter!',
              // Styling the text
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
      // Floating action button to toggle the fade animation
      floatingActionButton: FloatingActionButton(
        onPressed: toggleVisibility, // Calls the toggleVisibility function
        child: Icon(Icons.play_arrow), // Icon displayed on the button
      ),
    );
  }
}