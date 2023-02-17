import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartpay/config/configs.dart';

class AppInputWidget extends StatelessWidget {
  final TextEditingController? textController;
  final VoidCallback? iconOnPressed;
  final FaIcon? suffixIcon;
  final String text;
  final bool obscureText;
  final TextInputType textInputType;
  const AppInputWidget({Key? key,
    required this.text,
    this.suffixIcon,
    required this.textInputType,
    this.obscureText = false,
    this.textController,
    this.iconOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kScaffoldBg,
        borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
      ),
      child: TextFormField(
        style: const TextStyle(
            color: AppColors.kText
        ),
        controller: textController,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: AppColors.kScaffoldBg,
          focusColor: AppColors.kInputBorder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r)
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 13.h
          ),
          labelText: text,
          suffixIcon: suffixIcon != null ? IconButton(
            onPressed: iconOnPressed,
            icon: suffixIcon!,
          ) : null
        ),
        //The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $text';
          }
          return null;
        },
      ),
    );
  }
}
