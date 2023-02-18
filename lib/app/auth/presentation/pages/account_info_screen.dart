import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/auth/presentation/providers/create_account_controller.dart';
import 'package:smartpay/app/auth/presentation/providers/freezed/create_account_state.dart';
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
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstnameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            child: Consumer(
              builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
                final CreateAccountState createAccountController = ref.watch(createAccountControllerProvider);
                return Column(
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
                    AppInputWidget(
                        text: 'First name',
                        textController: _firstnameController,
                        textInputType: TextInputType.text
                    ),
                    SizedBox(height: 20.h),
                    AppInputWidget(
                        text: 'Username',
                        textController: _usernameController,
                        textInputType: TextInputType.text
                    ),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            ref.read(createAccountControllerProvider.notifier).updateSelectedCountryName(
                              countryName: country.name,
                              countryCode: country.countryCode
                            );
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
                          children: [
                            Text(createAccountController.selectedCountry),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppInputWidget(
                        textController: _passwordController,
                        suffixIcon: createAccountController.isPasswordVisible ? const FaIcon(FontAwesomeIcons.eye) : const FaIcon(FontAwesomeIcons.eyeSlash),
                        iconOnPressed: () {
                          ref.read(createAccountControllerProvider.notifier).updatePasswordVisibility = !createAccountController.isPasswordVisible;
                        },
                        text: 'Password',
                        obscureText: !createAccountController.isPasswordVisible,
                        textInputType: TextInputType.text
                    ),
                    SizedBox(height: 10.h),
                    if(createAccountController.errorStr.isNotEmpty)...[
                      Text(createAccountController.errorStr)
                    ],
                    SizedBox(height: 20.h),
                    BtnElevated(
                        isLoading: createAccountController.isSignUpBtnLoading == true,
                        child: const Text('Sign Up'),
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            bool response = await ref.read(createAccountControllerProvider.notifier).register(
                                firstName: _firstnameController.text,
                                username: _usernameController.text,
                                password: _passwordController.text
                            );
                            if (response) {
                              if (!mounted) return;
                              context.go('/${AppScreens.setPinScreen.toPath}');
                            }
                          }

                        }
                    ),
                    SizedBox(height: 30.h),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
