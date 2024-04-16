import 'dart:math';
import 'dart:async';
import 'package:rive/rive.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:localization/constants/constants.dart';
import 'package:localization/screens/login_screen.dart';

class RocketScreen extends StatelessWidget {
  const RocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 10),
      (timer) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        timer.cancel();
      },
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(height: 100.h, width: 100.w),
          for (var a = 0; a < 150; a++)
            Positioned(
              top: Random().nextInt(100).toDouble().h,
              left: Random().nextInt(100).toDouble().w,
              child: Center(
                child: Transform.rotate(
                  angle: Random().nextInt(360).toDouble(),
                  child: Icon(
                    iconsList[Random().nextInt(14)],
                    color: Color.fromARGB(
                      Random().nextInt(250),
                      Random().nextInt(250),
                      Random().nextInt(250),
                      Random().nextInt(250),
                    ),
                    size: (Random().nextInt(24).toDouble()).sp,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 100.h,
            width: 100.h,
            child:
                const RiveAnimation.asset('assets/animations/rocket_demo.riv'),
          ),
        ],
      ),
    );
  }
}