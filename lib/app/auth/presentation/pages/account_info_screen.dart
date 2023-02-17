import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/my_icon_btn.dart';
import 'package:smartpay/common/widgets/app_input_widget.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/router/router.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({Key? key}) : super(key: key);

  @override
  State<AccountInfoScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AccountInfoScreen> {

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
                    onPressed: () {},
                    iconData: Icons.arrow_back_ios
                ),
                SizedBox(height: 30.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Hey there! tell us a bit about',
                        style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            color: AppColors.kText,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(text: ' yourself',
                        style: GoogleFonts.montserrat(
                            fontSize: 18.sp,
                            color: AppColors.kInputBorder,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 30.h),
                const AppInputWidget(
                    text: 'First name',
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 20.h),
                const AppInputWidget(
                    text: 'Username',
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true, // optional. Shows phone code before the country name.
                      onSelect: (Country country) {
                        print('Select country: ${country.displayName}');
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.h,
                      horizontal: 12.w
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.kScaffoldBg,
                      borderRadius: BorderRadius.circular(AppDimens.kBorderRadius.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Nigeria'),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                AppInputWidget(
                    suffixIcon: const FaIcon(FontAwesomeIcons.eye),
                    iconOnPressed: () {},
                    text: 'Password',
                    obscureText: true,
                    textInputType: TextInputType.text
                ),
                SizedBox(height: 20.h),
                BtnElevated(
                    child: const Text('Sign Up'),
                    onPressed: () => context.go('/${AppScreens.setPinScreen.toPath}')
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
