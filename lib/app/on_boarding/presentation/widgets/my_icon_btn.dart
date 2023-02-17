import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay/config/configs.dart';

class MyIconBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  const MyIconBtn({Key? key, required this.onPressed, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1, color: AppColors.kDot)
      ),
      child: IconButton(
        icon: Icon(iconData),
        onPressed: onPressed,
      ),
    );
  }
}
