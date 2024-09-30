import 'package:dev_deva_test/controllers/app_controller.dart';
import 'package:dev_deva_test/controllers/home_controller.dart';
import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/utils/app_style.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WidgetDialogEditMenu extends StatelessWidget {
  const WidgetDialogEditMenu({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find<HomeController>();

    return Dialog(
        insetPadding: EdgeInsets.all(0),
        child: Container(
            width: 80.w,
            height: 50.h,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset('assets/icons/icon_calendar_2.png'),
                      WidgetText(
                          data: 'แก้ไขรายการโปรด',
                          size: 18,
                          color: green,
                          weight: FontWeight.w700)
                    ],
                  ),
                  Obx(() {
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: Container(
                                  width: 100.w,
                                  child: Center(
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(
                                          _homeController.serviceList.length,
                                          (index) {
                                        return _menu(
                                            _homeController.serviceList,
                                            index,
                                            _homeController);
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WidgetText(
                                  data: 'ปิด',
                                  size: 16,
                                  color: white,
                                  weight: FontWeight.w700),
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  Padding _menu2(List<Map<String, Object>> favoriteServices, int index) {
    AppController _appController = Get.find<AppController>();

    double height = 120;
    double width = 90;

    double font9 = 9;

    if (_appController.appScreen.value == AppScreen.large) {
      height = 180;
      width = 150;
      font9 = 18;
    }
    if (_appController.appScreen.value == AppScreen.small) {
      height = 120;
      width = 80;
      font9 = 9;
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [appBoxShadow],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black12, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/icons/${favoriteServices[index]['icon']}'),
                const SizedBox(
                  height: 5,
                ),
                WidgetText(
                    data: '${favoriteServices[index]['name']}',
                    textAlign: TextAlign.center,
                    size: font9,
                    color: black,
                    weight: FontWeight.w400)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _menu(List<Map<String, Object>> serviceList, int index,
      HomeController _homeController) {
    AppController _appController = Get.find<AppController>();

    double height = 110;
    double width = 80;

    double font9 = 9;

    if (_appController.appScreen.value == AppScreen.large) {
      height = 180;
      width = 150;
      font9 = 18;
    }
    if (_appController.appScreen.value == AppScreen.small) {
      height = 110;
      width = 70;
      font9 = 9;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          _homeController.onChangeFav(index);
        },
        child: Stack(
          children: [
            Obx(() {
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(16),
                  border: serviceList[index]['isFavorite'] as bool
                      ? Border.all(color: green, width: 2)
                      : Border.all(color: Colors.black12, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            'assets/icons/${serviceList[index]['icon']}'),
                        const SizedBox(
                          height: 5,
                        ),
                        WidgetText(
                            data: '${serviceList[index]['name']}',
                            size: font9,
                            textAlign: TextAlign.center,
                            color: black,
                            weight: FontWeight.w400)
                      ],
                    ),
                  ),
                ),
              );
            }),
            Checkbox(
                activeColor: green,
                value: serviceList[index]['isFavorite'] as bool,
                onChanged: (value) {
                  _homeController.onChangeFav(index);
                }),
          ],
        ),
      ),
    );
  }
}
