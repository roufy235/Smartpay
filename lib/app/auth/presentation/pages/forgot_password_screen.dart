import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/common/widgets/app_input_widget.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/generated/assets.dart';
import 'package:smartpay/router/router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(
              horizontal: 20.w
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              SvgPicture.asset(Assets.svgForgotIcon),
              SizedBox(height: 20.h),
              Text('Password Recovery',
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.h),
              const Text('Enter your registered email below to receive password instructions'),
              SizedBox(height: 30.h),
              const AppInputWidget(
                  text: 'Email',
                  textInputType: TextInputType.emailAddress
              ),
              SizedBox(height: 20.h),
              BtnElevated(
                  child: const Text('Send me email'),
                  onPressed: () => context.go('/${AppScreens.loginScreen.toPath}/${AppScreens.forgotPasswordScreen.toPath}/${AppScreens.verifyIdentityScreen.toPath}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
