import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/my_icon_btn.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/router/router.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  State<SetPinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SetPinScreen> {

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
                Text('Set your PIN code',
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5.h),
                const Text('We use state-of-the-art security measures to protect your information at all times'),
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
                SizedBox(height: 50.h),
                BtnElevated(
                    child: const Text('Create Pin'),
                    onPressed: () => context.go('/${AppScreens.confirmationScreen.toPath}')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
