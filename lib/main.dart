import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_articles/app/configs/colors.dart';
import 'package:ny_articles/app/routes/app_pages.dart';

import 'app/configs/strings.dart';
import 'app/utils/color_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Added for hiding keyboard -> Can be used in future
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          fontFamily: 'Cairo',
          primarySwatch: ColorUtils.getMaterialColor(AppColors.primary),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primary,
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Cairo'),
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
          ),
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
