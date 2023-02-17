import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/common/widgets/loading_animation.dart';
import 'package:smartpay/config/configs.dart';

class BtnElevated extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool useFlexibleWith;
  final VoidCallback? onPressed;
  final double btnHeight, btnWidth, btnRadius;
  final bool isLoading;
  const BtnElevated({
    Key? key,
    required this.child,
    this.btnHeight = AppDimens.kDefaultBtnHeight,
    this.useFlexibleWith = false,
    this.btnRadius = AppDimens.kDefaultBtnRadius,
    this.btnWidth = double.infinity,
    this.isLoading = false,
    this.backgroundColor,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      height: btnHeight.h,
      width: useFlexibleWith == true ? null : btnWidth.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(btnRadius),
              ),
              backgroundColor: backgroundColor
          ),
          onPressed: isLoading ? null : onPressed,
          child: isLoading ? LoadingAnimation(color: primaryColor) : child
      ),
    );
  }
}
