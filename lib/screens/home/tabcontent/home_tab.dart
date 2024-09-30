import 'package:dev_deva_test/controllers/app_controller.dart';
import 'package:dev_deva_test/controllers/home_controller.dart';
import 'package:dev_deva_test/screens/home/widget_home/widget_dialog_edit_menu.dart';
import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/utils/app_style.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find<HomeController>();
    AppController _appController = Get.find<AppController>();

    // var unFavoriteServices = _homeController.serviceList
    //     .where((service) => service['isFavorite'] == false)
    //     .toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          _appointment(_homeController),
          Obx(() {
            return _homeController.isShowFavorite.value
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: _label(context),
                  )
                : const SizedBox();
          }),
          Obx(() {
            var favoriteServices = _homeController.serviceList
                .where((service) => service['isFavorite'] == true)
                .toList();

            return _homeController.isShowFavorite.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: 100.w,
                      height: _appController.appScreen.value == AppScreen.large
                          ? 180
                          : 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: favoriteServices.length + 1,
                          itemBuilder: (context, index) {
                            if (index != favoriteServices.length) {
                              return _menu(favoriteServices, index);
                            } else {
                              return _addFav(context);
                            }
                          }),
                    ),
                  )
                : const SizedBox();
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _homeController.onTapSwitchFavorite();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black12, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Obx(() {
                        return WidgetText(
                            data: _homeController.isShowFavorite.value
                                ? 'ซ่อนรายการโปรด'
                                : 'แสดงรายการโปรด',
                            size: _appController.appScreen.value ==
                                    AppScreen.large
                                ? 20
                                : 10,
                            color: text_grey,
                            weight: FontWeight.w400);
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                width: 100.w,
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(_homeController.serviceList.length,
                        (index) {
                      return _menu(_homeController.serviceList, index);
                    }),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _addFav(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        child: Center(
            child: DottedBorder(
          borderType: BorderType.Circle,
          dashPattern: [3, 3, 3, 3],
          color: Colors.black26,
          strokeWidth: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (builder) {
                      return WidgetDialogEditMenu();
                    });
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black12,
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 32,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }

  SizedBox _appointment(HomeController _homeController) {
    AppController _appController = Get.find<AppController>();

    double height = 170;
    double font10 = 10;
    double font11 = 11;
    double font12 = 12;
    double font14 = 14;

    if (_appController.appScreen.value == AppScreen.large) {
      font10 = 20;
      font11 = 22;
      font12 = 24;
      font14 = 28;
      height = 210;
    }

    return SizedBox(
      width: 100.w,
      height: height,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () {
                _homeController.onTapTab(2);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(color: Colors.black12, width: 2),
                    right: BorderSide(color: Colors.black12, width: 2),
                  ),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/icon_calendar.png'),
                    const SizedBox(
                      height: 10,
                    ),
                    WidgetText(
                        data: 'นัดหมายล่วงหน้า',
                        size: font11,
                        color: black,
                        weight: FontWeight.w400)
                  ],
                )),
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Container(
                color: lightgreen,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_month_outlined,
                            color: green,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          WidgetText(
                              data: 'ตารางนัดหมายที่จะถึง',
                              size: font12,
                              color: green,
                              weight: FontWeight.w600)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            WidgetText(
                                data: '16 มกราคม 2566 , 10:30',
                                size: font14,
                                color: black,
                                weight: FontWeight.w600)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          WidgetText(
                              data: 'แผนกรังสีคลินิกพิเศษ',
                              size: font12,
                              color: text_green,
                              weight: FontWeight.w400)
                        ],
                      ),
                      Row(
                        children: [
                          WidgetText(
                              data: 'นพ.ยุทธภพ ใต้หล้า',
                              size: font12,
                              color: text_green,
                              weight: FontWeight.w400)
                        ],
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          WidgetText(
                              data: 'ดูตารางนัดหมายของฉัน',
                              size: font10,
                              color: text_green,
                              weight: FontWeight.w400),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: text_green,
                            size: font12,
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Padding _menu(List<Map<String, Object>> favoriteServices, int index) {
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
}

SizedBox _label(BuildContext context) {
  AppController _appController = Get.find<AppController>();

  double height = 170;
  double font10 = 10;
  double font11 = 11;
  double font12 = 12;
  double font14 = 14;

  if (_appController.appScreen.value == AppScreen.large) {
    font10 = 20;
    font11 = 22;
    font12 = 24;
    font14 = 28;
    height = 210;
  }

  return SizedBox(
    width: 100.w,
    height: 4.h,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 100.h,
              width: 6,
              color: green,
            ),
            const SizedBox(
              width: 5,
            ),
            WidgetText(
                data: 'รายการโปรด',
                size: font14,
                color: text_grey,
                weight: FontWeight.w700),
          ],
        ),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (b) {
                  return WidgetDialogEditMenu();
                });
          },
          child: WidgetText(
              data: 'แก้ไข >',
              size: font12,
              color: text_grey,
              weight: FontWeight.w400),
        )
      ],
    ),
  );
}
