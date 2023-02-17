import 'package:flutter/material.dart';
import 'package:smartpay/config/configs.dart';

class DotIndicatorWidget extends StatelessWidget {
  final bool isActive;
  const DotIndicatorWidget({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 5,
      width: isActive ? 40 : 5,
      decoration: BoxDecoration(
        color: isActive ? AppColors.kPrimary : AppColors.kDot,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }
}
