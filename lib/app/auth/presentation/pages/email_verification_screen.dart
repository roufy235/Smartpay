import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/my_icon_btn.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/router/router.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<EmailVerificationScreen> {

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
                SizedBox(height: 10.h),
                MyIconBtn(
                    onPressed: () => context.pop(),
                    iconData: Icons.arrow_back_ios
                ),
                SizedBox(height: 30.h),
                Text('Verify it’s you',
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5.h),
                const Text('We send a code to ( *****@mail.com ). Enter it here to verify your identity'),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kScaffoldBg,
                          borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                              color: AppColors.kText
                          ),
                          controller: null,
                          keyboardType: TextInputType.number,
                          obscureText: false,
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
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kScaffoldBg,
                          borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                              color: AppColors.kText
                          ),
                          controller: null,
                          keyboardType: TextInputType.number,
                          obscureText: false,
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
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kScaffoldBg,
                          borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                              color: AppColors.kText
                          ),
                          controller: null,
                          keyboardType: TextInputType.number,
                          obscureText: false,
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
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kScaffoldBg,
                          borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                              color: AppColors.kText
                          ),
                          controller: null,
                          keyboardType: TextInputType.number,
                          obscureText: false,
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
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.kScaffoldBg,
                          borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                        ),
                        child: TextFormField(
                          style: const TextStyle(
                              color: AppColors.kText
                          ),
                          controller: null,
                          keyboardType: TextInputType.number,
                          obscureText: false,
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
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                const Center(child: Text('Resend Code 30 secs')),
                SizedBox(height: 50.h),
                BtnElevated(
                    child: const Text('Confirm'),
                    onPressed: () => context.go('/${AppScreens.loginScreen.toPath}/${AppScreens.signUpScreen.toPath}/${AppScreens.emailVerificationScreen.toPath}/${AppScreens.accountInfoScreen.toPath}')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
