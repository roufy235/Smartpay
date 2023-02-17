import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smartpay/app/on_boarding/domain/entities/item_entity.dart';
import 'package:smartpay/app/on_boarding/presentation/providers/common.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/dot_indicator_widget.dart';
import 'package:smartpay/app/on_boarding/presentation/widgets/onboarding_layout_widget.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/common/widgets/btn_text.dart';
import 'package:smartpay/config/configs.dart';
import 'package:smartpay/router/router.dart';

class OnBoardingScreen extends ConsumerStatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends ConsumerState<OnBoardingScreen> {

  final PageController pageController = PageController(initialPage: 0);
  int _pageIndex = 0;
  late List<ItemEntity> items;

  @override
  void initState() {
    items = ref.read(getDataUseCaseProvider).call();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15.w, top: 5.h),
              child: Align(
                alignment: Alignment.topRight,
                child: BtnText(
                  useFlexibleWith: true,
                  onPressed: () => context.go('/${AppScreens.loginScreen.toPath}'),
                  child: const Text(AppStrings.kSkip),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: items.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return OnBoardingLayoutWidget(itemEntity: items[index]);
                  }
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
          top: 15.h
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15.w
        ),
        color: AppColors.kScaffoldBg,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(items.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: DotIndicatorWidget(isActive: index == _pageIndex),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 10.h),
                BtnElevated(
                  child: const Text(AppStrings.kGetStarted),
                  onPressed: () => context.go('/${AppScreens.loginScreen.toPath}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
