import 'package:dev_deva_test/controllers/app_controller.dart';
import 'package:dev_deva_test/controllers/login_controller.dart';
import 'package:dev_deva_test/screens/home/home_screen.dart';
import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/utils/app_style.dart';
import 'package:dev_deva_test/widgets/%20widget_input_thai_id.dart';
import 'package:dev_deva_test/widgets/widget_btn_cf.dart';
import 'package:dev_deva_test/widgets/widget_input_password.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController _loginController = Get.put(LoginController());
    AppController _appController = Get.find<AppController>();

    double headerHeight = 15.h;
    double imageHeight = 30.h;
    double paddingHeight = 40.h;

    if (_appController.appScreen.value == AppScreen.small) {
      headerHeight = 10.h;
      imageHeight = 25.h;
      paddingHeight = 30.h;
    } else if (_appController.appScreen.value == AppScreen.medium) {
      headerHeight = 15.h;
      imageHeight = 30.h;
      paddingHeight = 40.h;
    } else {
      headerHeight = 15.h;
      imageHeight = 30.h;
      paddingHeight = 40.h;
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: 100.w,
              height: headerHeight,
              color: green,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: WidgetText(
                        data: 'เข้าสู่ระบบ',
                        size: 18,
                        color: white,
                        weight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Container(
                width: 100.w,
                height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_hos.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: paddingHeight),
              child: Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [appBoxShadow],
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Padding(
                    padding: _appController.appScreen.value == AppScreen.large
                        ? EdgeInsets.symmetric(horizontal: 200, vertical: 15)
                        : EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        _spaceHeight(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetText(
                                data: 'ยินดีต้อนรับ',
                                size: 22,
                                color: green,
                                weight: FontWeight.w700),
                          ],
                        ),
                        _spaceHeight(15),
                        _label('เลขบัตรประจำตัวประชาชน'),
                        Obx(() {
                          return WidgetInputThaiId(
                            controller: _loginController.cid,
                            hasError: _loginController.hasCidError.value,
                          );
                        }),
                        _label('รหัสผ่าน'),
                        WidgetInputPassword(
                            controller: _loginController.password),
                        _spaceHeight(25),
                        WidgetBtnCf(
                          title: 'เข้าสู่ระบบ',
                          onPressed: () {
                            if (_loginController.cid.text.length != 13) {
                              _loginController.hasCidError.value = true;
                            } else {
                              _loginController.hasCidError.value = false;
                              Get.offAll(HomeScreen());
                            }
                          },
                        ),
                        _spaceHeight(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                WidgetText(
                                    data: 'หากยังไม่มีบัญชี',
                                    size: 14,
                                    color: text_grey,
                                    weight: FontWeight.w400),
                                SizedBox(
                                  width: 8,
                                ),
                                WidgetText(
                                    data: 'ลงทะเบียน',
                                    size: 14,
                                    color: green,
                                    weight: FontWeight.w700)
                              ],
                            ),
                            WidgetText(
                                data: 'ลืมรหัสผ่าน ?',
                                size: 14,
                                color: Colors.blue,
                                weight: FontWeight.w400)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _label(String text) {
    AppController _appController = Get.find<AppController>();

    double fontSize = 14;

    if (_appController.appScreen.value == AppScreen.small) {
      fontSize = 14;
    } else if (_appController.appScreen.value == AppScreen.medium) {
      fontSize = 14;
    } else {
      fontSize = 18;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5),
      child: Row(
        children: [
          WidgetText(
              data: text,
              size: fontSize,
              color: text_grey,
              weight: FontWeight.w400)
        ],
      ),
    );
  }

  SizedBox _spaceHeight(double height) {
    return SizedBox(
      height: height,
    );
  }
}
