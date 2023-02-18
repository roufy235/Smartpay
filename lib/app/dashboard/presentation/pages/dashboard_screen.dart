import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smartpay/app/dashboard/domain/entities/dashboard_entity.dart';
import 'package:smartpay/app/dashboard/presentation/providers/common.dart';
import 'package:smartpay/common/providers/states.dart';
import 'package:smartpay/common/widgets/btn_elevated.dart';
import 'package:smartpay/router/router.dart';



class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context);
    AsyncValue<DashboardEntity> response = ref.watch(getMessageProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Center(
          child: response.when(
              data: (DashboardEntity dashboardEntity) {
                if (dashboardEntity.status != null && dashboardEntity.status! && dashboardEntity.data != null) {
                  return Text(dashboardEntity.data!.secret.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  );
                }
                return Text(dashboardEntity.message.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                );
              },
              error: (error,  stk) {
                return Text(error.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                );
              },
              loading: () => const Text('loading...')
          )
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30.h, left: 10.w, right: 10.w),
        child: BtnElevated(
          child: const Text('Logout'),
          onPressed: () {
            ref.read(hiveRepositoryProvider).setUserAuthToken('');
            context.go('/${AppScreens.onboarding.toPath}');
          },
        ),
      ),
    );
  }
}
