import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/generated/assets.dart';
import 'package:smartpay/router/router.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({Key? key}) : super(key: key);

  @override
  State<VerifyIdentityScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<VerifyIdentityScreen> {

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
              SvgPicture.asset(Assets.svgVerifySvg),
              SizedBox(height: 20.h),
              Text('Verify your identity',
                style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 5.h),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Where would you like ',
                      style: TextStyle(
                        color: AppColors.kTextLight
                      )
                    ),
                    TextSpan(
                        text: 'Smartpay ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: AppColors.kInputBorder
                        )
                    ),
                    TextSpan(
                        text: ' to send your security code?',
                        style: TextStyle(
                            color: AppColors.kTextLight
                        )
                    )
                  ]
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 10.w
                ),
                decoration: BoxDecoration(
                  color: AppColors.kScaffoldBg,
                  borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                ),
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.solidCircleCheck, color: AppColors.kInputBorder),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',
                            style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text('A*******@mail.com',
                            style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                color: AppColors.kText
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    const FaIcon(FontAwesomeIcons.envelope, color: AppColors.kGrey)
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              BtnElevated(
                  child: const Text('Continue'),
                  onPressed: () => context.go('/${AppScreens.loginScreen.toPath}/${AppScreens.forgotPasswordScreen.toPath}/${AppScreens.verifyIdentityScreen.toPath}/${AppScreens.newPasswordScreen.toPath}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
