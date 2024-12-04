import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/features/auth/presentation/views/splash/splash_view.dart';
import 'package:to_do_app/features/task/presentation/manager/task/task_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getThemeLightData(),
              darkTheme: getThemeDarkData(),
              themeMode: BlocProvider.of<TaskCubit>(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SplashView(),
            );
          },
        );
      },
    );
  }
}
