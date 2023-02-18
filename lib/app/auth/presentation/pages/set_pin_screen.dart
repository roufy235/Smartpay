import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/auth/presentation/providers/create_account_controller.dart';
import 'package:smartpay/app/auth/presentation/providers/freezed/create_account_state.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/my_icon_btn.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/router/router.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  State<SetPinScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SetPinScreen> {

  late FocusNode _firstNum, _secondNum, _thirdNum, _fourthNum, _fifthNum;
  late TextEditingController _firstNumController, _secondNumController, _thirdNumController, _fourthNumController, _fifthController;


  @override
  void initState() {
    _firstNum = FocusNode();
    _secondNum = FocusNode();
    _thirdNum = FocusNode();
    _fourthNum = FocusNode();
    _fifthNum = FocusNode();

    _firstNumController = TextEditingController();
    _secondNumController = TextEditingController();
    _thirdNumController = TextEditingController();
    _fourthNumController = TextEditingController();
    _fifthController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _firstNum.dispose();
    _secondNum.dispose();
    _thirdNum.dispose();
    _fourthNum.dispose();
    _fifthNum.dispose();

    _firstNumController.dispose();
    _secondNumController.dispose();
    _thirdNumController.dispose();
    _fourthNumController.dispose();
    _fifthController.dispose();
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
          child: Consumer(
            builder: (BuildContext ctx, WidgetRef ref, Widget? child) {
              final CreateAccountState createAccountController = ref.watch(createAccountControllerProvider);
              return Column(
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
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            style: const TextStyle(
                                color: AppColors.kText
                            ),
                            controller: _firstNumController,
                            autofocus: true,
                            focusNode: _firstNum,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _firstNum.unfocus();
                                FocusScope.of(context).requestFocus(_secondNum);
                              }
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
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
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            style: const TextStyle(
                                color: AppColors.kText
                            ),
                            controller: _secondNumController,
                            autofocus: true,
                            focusNode: _secondNum,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _secondNum.unfocus();
                                FocusScope.of(context).requestFocus(_thirdNum);
                              }
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
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
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            style: const TextStyle(
                                color: AppColors.kText
                            ),
                            controller: _thirdNumController,
                            autofocus: true,
                            focusNode: _thirdNum,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _thirdNum.unfocus();
                                FocusScope.of(context).requestFocus(_fourthNum);
                              }
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
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
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            style: const TextStyle(
                                color: AppColors.kText
                            ),
                            controller: _fourthNumController,
                            autofocus: true,
                            focusNode: _fourthNum,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _fourthNum.unfocus();
                                FocusScope.of(context).requestFocus(_fifthNum);
                              }
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
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
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                            style: const TextStyle(
                                color: AppColors.kText
                            ),
                            controller: _fifthController,
                            autofocus: true,
                            focusNode: _fifthNum,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                _fifthNum.unfocus();
                                _createPinFunc(
                                    ref: ref,
                                    createAccountController: createAccountController
                                );
                              }
                            },
                            keyboardType: TextInputType.number,
                            obscureText: true,
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
                    ],
                  ),
                  SizedBox(height: 50.h),
                  BtnElevated(
                      child: const Text('Create Pin'),
                      onPressed: () {
                        _createPinFunc(
                            ref: ref,
                            createAccountController: createAccountController
                        );
                      }
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

  void _createPinFunc({required WidgetRef ref, required CreateAccountState createAccountController}) async {
    if (_firstNumController.text.isNotEmpty && _secondNumController.text.isNotEmpty && _thirdNumController.text.isNotEmpty && _fourthNumController.text.isNotEmpty && _fifthController.text.isNotEmpty) {
      if (createAccountController.emailVerBtnLoading) return;
      String pin = _firstNumController.text.toString() + _secondNumController.text.toString() + _thirdNumController.text.toString() + _fourthNumController.text.toString() + _fifthController.text.toString();
      bool response = await ref.read(hiveRepositoryProvider).setPin(pin);
      if (response) {
        if(!mounted) return;
        context.go('/${AppScreens.confirmationScreen.toPath}');
      }
    }
  }
}
