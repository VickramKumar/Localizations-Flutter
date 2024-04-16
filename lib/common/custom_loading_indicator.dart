// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomLoadingIndicator extends StatelessWidget {
  Color? color;
  double? strokeWidth;

  CustomLoadingIndicator({
    super.key,
    this.color,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RiveAnimation.asset('assets/animations/hexasphere_loading.riv'),
    );
  }
}
