import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartpay/app/on_boarding/domain/entities/item_entity.dart';
import 'package:smartpay/config/configs.dart';

class OnBoardingLayoutWidget extends StatelessWidget {
  final ItemEntity itemEntity;
  const OnBoardingLayoutWidget({Key? key, required this.itemEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 30.h,
                left: 0,
                right: 0,
                child: itemEntity.isSvg
                    ? SvgPicture.asset(itemEntity.phoneImage)
                    : Image.asset(itemEntity.phoneImage)
            ),
            Positioned(
                top: 140.h,
                left: 0,
                right: 0,
                child: SvgPicture.asset(itemEntity.img)
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 65.h,
              child: Container(
                padding: EdgeInsets.only(
                  top: 50.h
                ),
                color: AppColors.kScaffoldBg,
                child: Column(
                  children: [
                    Text(itemEntity.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w900,
                          color: AppColors.kText,
                          fontSize: 23.sp
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(itemEntity.content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: AppColors.kTextLight,
                          fontSize: 14.sp
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
