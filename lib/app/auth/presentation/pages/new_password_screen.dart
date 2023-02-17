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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<NewPasswordScreen> {

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
                    onPressed: () => context.pop(),
                    iconData: Icons.arrow_back_ios
                ),
                SizedBox(height: 30.h),
                Text('Create New Password',
                  style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 5.h),
                const Text('Please, enter a new password below different from the previous password'),
                SizedBox(height: 30.h),
                AppInputWidget(
                    suffixIcon: const FaIcon(FontAwesomeIcons.eye),
                    iconOnPressed: () {},
                    text: 'Password',
                    obscureText: true,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 20.h),
                AppInputWidget(
                    suffixIcon: const FaIcon(FontAwesomeIcons.eye),
                    iconOnPressed: () {},
                    text: 'Confirm Password',
                    obscureText: true,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 40.h),
                BtnElevated(
                    child: const Text('Create new password'),
                    onPressed: () {}
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
