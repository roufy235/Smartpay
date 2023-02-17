import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/generated/assets.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40.w
          ),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(Assets.imagesConfirmation),
              SizedBox(height: 20.h),
              Text('Congratulations, James',
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.h),
              const Text('You’ve completed the onboarding, you can start using',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              BtnElevated(
                  child: const Text('Get Started'),
                  onPressed: () {}
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
