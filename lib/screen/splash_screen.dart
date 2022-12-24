import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[800],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SpinKitSpinningLines(
              color: Colors.white,
              size: 60.0,
            ),
            SizedBox(height: 10),
            Text(
              "Loading...",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
