import 'dart:developer';

import 'package:dev_deva_test/controllers/app_controller.dart';
import 'package:dev_deva_test/screens/login/login_screen.dart';
import 'package:dev_deva_test/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  _detectScreenSize(BuildContext context) {
    AppController _appController = Get.put(AppController(), permanent: true);

    double screenWidth = MediaQuery.of(context).size.width;

    log('screenWidth : $screenWidth');

    if (screenWidth < 380) {
      // mini mobile
      _appController.appScreen.value = AppScreen.small;
    } else if (screenWidth >= 380 && screenWidth < 600) {
      // medium mobile
      _appController.appScreen.value = AppScreen.medium;
    } else {
      // tablet
      _appController.appScreen.value = AppScreen.large;
    }

    log('Screen size: ${_appController.appScreen.value}');
  }

  @override
  Widget build(BuildContext context) {
    _detectScreenSize(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                dividerColor: red),
            home: LoginScreen()),
      );
    });
  }
}
