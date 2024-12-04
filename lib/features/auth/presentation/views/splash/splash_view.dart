import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/database/cache/cached_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/features/auth/presentation/views/onbordering_screens/onbordering_screens.dart';
import 'package:to_do_app/features/task/presentation/views/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void navigator() {
    bool? isOnboarding =
        getIt<CachedHelper>().getdata(key: AppString.onBoardingKey) ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnboarding == true) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const HomeView()));
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const OnborderingScreens()));
      }
    });
  }

  @override
  void initState() {
    navigator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.logo),
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppString.appname,
              style: TextStyle(
                fontFamily: GoogleFonts.lato().fontFamily,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
