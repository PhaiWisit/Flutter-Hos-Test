import 'package:dev_deva_test/controllers/app_controller.dart';
import 'package:dev_deva_test/controllers/home_controller.dart';
import 'package:dev_deva_test/screens/home/tabcontent/home_tab.dart';
import 'package:dev_deva_test/screens/home/tabcontent/info_tab.dart';
import 'package:dev_deva_test/screens/home/tabcontent/noti_tab.dart';
import 'package:dev_deva_test/screens/home/tabcontent/pr_tab.dart';
import 'package:dev_deva_test/screens/home/tabcontent/setting_tab.dart';
import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/utils/app_style.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.put(HomeController());

    List<Widget> _tabOptions = <Widget>[
      HomeTab(),
      PrTab(),
      NotiTab(),
      InfoTab(),
      SettingTab(),
    ];

    _homeController.checkNoti();

    return Scaffold(
      body: Column(
        children: [
          // Patient info bar
          _patientInfo(),
          // Content
          Obx(() {
            return Expanded(
                child:
                    _tabOptions.elementAt(_homeController.selectedTab.value));
          })
        ],
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'หน้าแรก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement_outlined),
              activeIcon: Icon(Icons.announcement_rounded),
              label: 'ประชาสัมพันธ์',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.notifications_none),
                  if (_homeController.hasNotification.value)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              activeIcon: Stack(
                children: [
                  Icon(Icons.notifications),
                  if (_homeController.hasNotification.value)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              label: 'แจ้งเตือน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              activeIcon: Icon(Icons.person_2_rounded),
              label: 'ข้อมูลของฉัน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'ตั้งค่า',
            ),
          ],
          currentIndex: _homeController.selectedTab.value,
          selectedItemColor: green,
          unselectedItemColor: grey,
          onTap: _homeController.onTapTab,
        );
      }),
    );
  }

  Container _patientInfo() {
    return Container(
      width: 100.w,
      height: 20.h,
      color: green,
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 10, left: 10, right: 10),
        child: Row(
          children: [_cardInfo(), _cardNumber()],
        ),
      ),
    );
  }

  Expanded _cardInfo() {
    AppController _appController = Get.find<AppController>();

    double avatarSize = 50;
    double font11 = 11;
    double font12 = 12;
    double dividerWidth = 145;

    if (_appController.appScreen.value == AppScreen.large) {
      avatarSize = 80;
      font11 = 22;
      font12 = 24;
      dividerWidth = 245;
    }
    if (_appController.appScreen.value == AppScreen.small) {
      avatarSize = 40;
      font11 = 11;
      font12 = 12;
      dividerWidth = 130;
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: avatarSize,
                  height: avatarSize,
                  child: CircleAvatar(
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.black26,
                      ),
                    ),
                  )),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WidgetText(
                      data: 'นายสมบูรณ์ แข็งแรงดี',
                      size: font12,
                      color: white,
                      weight: FontWeight.w500),
                  WidgetText(
                      data: 'HN : 12354544',
                      size: font11,
                      color: white,
                      weight: FontWeight.w500),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        Container(
                          width: dividerWidth,
                          height: 2,
                          color: Colors.black26,
                        )
                      ],
                    ),
                  ),
                  WidgetText(
                      data: 'ชาย - เกิด 23/12/1987',
                      size: font11,
                      color: white,
                      weight: FontWeight.w500),
                  WidgetText(
                      data: '(32 ปี 4 เดือน 25 วัน)',
                      size: font11,
                      color: white,
                      weight: FontWeight.w500),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Expanded _cardNumber() {
    AppController _appController = Get.find<AppController>();

    double height = 80;
    double font11 = 11;
    double font14 = 14;
    double font24 = 24;
    double font6 = 6;
    double font8 = 8;

    if (_appController.appScreen.value == AppScreen.large) {
      height = 150;
      font11 = 25;
      font14 = 30;
      font24 = 40;
      font6 = 20;
      font8 = 24;
    }

    return Expanded(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 100.w,
            height: height,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [appBoxShadow]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WidgetText(
                          data: 'หมายเลข',
                          size: font11,
                          color: text_grey,
                          weight: FontWeight.w500),
                      WidgetText(
                          data: 'A123',
                          size: font24,
                          color: green,
                          weight: FontWeight.w800)
                    ],
                  ),
                  VerticalDivider(
                    thickness: 2,
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WidgetText(
                                data: 'แตะเพื่อดูรายละเอียด',
                                size: font6,
                                color: text_grey,
                                weight: FontWeight.w400)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            WidgetText(
                                data: 'จำนวนคิวที่เหลือ',
                                size: font8,
                                color: text_grey,
                                weight: FontWeight.w700),
                            SizedBox(
                              width: 5,
                            ),
                            WidgetText(
                                data: '3',
                                size: font14,
                                color: green,
                                weight: FontWeight.w700)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            WidgetText(
                                data: 'เวลาที่รอคิว (นาที)',
                                size: font8,
                                color: text_grey,
                                weight: FontWeight.w700),
                            SizedBox(
                              width: 5,
                            ),
                            WidgetText(
                                data: '30',
                                size: font14,
                                color: green,
                                weight: FontWeight.w700)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
