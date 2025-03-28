import 'package:flutter/material.dart';
import 'package:new_assignment/Constant/constant.dart';
import 'package:new_assignment/View/homeView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  bool showText = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust speed
    )..repeat(); // Infinite rotation

    // Show text after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        // ✅ Check if widget is still mounted
        setState(() {
          showText = true;
        });
      }
    });

    // Navigate after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        // ✅ Prevent navigation if widget is disposed
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.stop(); // ✅ Stop the animation
    _controller.dispose(); // ✅ Dispose the AnimationController
    super.dispose(); // ✅ Now call super.dispose()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(1, 114, 178, 1),
              Color.fromRGBO(0, 22, 69, 1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showText)
                    Text(
                      "Travel",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  const SizedBox(width: 8),
                  RotationTransition(
                    turns: _controller,
                    child: Image.asset(
                      AppIcon.globeIcon,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Find Your Dream\nDestination With Us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
