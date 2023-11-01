import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              color: Colors.white.withOpacity(0.1),
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
