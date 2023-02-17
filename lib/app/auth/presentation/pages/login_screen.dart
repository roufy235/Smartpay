import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/my_icon_btn.dart';
import 'package:smartpay/common/widgets/app_input_widget.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/common/widgets/btn_text.dart';
import 'package:smartpay/config/colors.dart';
import 'package:smartpay/generated/assets.dart';
import 'package:smartpay/router/router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _key = GlobalKey<FormState>();

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
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyIconBtn(
                    onPressed: () {},
                    iconData: Icons.arrow_back_ios
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Text('Hi There!',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 3.w),
                    const Icon(Icons.waving_hand, color: Colors.amber)
                  ],
                ),
                SizedBox(height: 5.h),
                const Text('Welcome back, Sign in to your account'),
                SizedBox(height: 30.h),
                const AppInputWidget(
                    text: 'Email',
                    textInputType: TextInputType.emailAddress
                ),
                SizedBox(height: 20.h),
                AppInputWidget(
                    suffixIcon: const FaIcon(FontAwesomeIcons.eye),
                    iconOnPressed: () {},
                    text: 'Password',
                    obscureText: true,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 10.h),
                BtnText(
                    useFlexibleWith: true,
                    onPressed: () => context.go('/${AppScreens.loginScreen.toPath}/${AppScreens.forgotPasswordScreen.toPath}'),
                    child: const Text('Forgot Password?')
                ),
                SizedBox(height: 20.h),
                BtnElevated(
                    child: const Text('Sign In'),
                    onPressed: () {}
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.w,
                  ),
                  child: Row(
                    children: [
                      const Expanded(child: Divider(color: AppColors.kLine)),
                      SizedBox(width: 5.w),
                      const Text('OR',
                        style: TextStyle(
                          color: AppColors.kTextLight
                        ),
                      ),
                      SizedBox(width: 5.w),
                      const Expanded(child: Divider(color: AppColors.kLine)),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 1, color: AppColors.kDot)
                        ),
                        child: SvgPicture.asset(Assets.svgGoogle),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 1, color: AppColors.kDot)
                        ),
                        child: SvgPicture.asset(Assets.svgApple),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don’t have an account?'),
            BtnText(
                useFlexibleWith: true,
                child: const Text('Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.kInputBorder
                  ),
                ),
                onPressed: () {}
            )
          ],
        ),
      ),
    );
  }
}
