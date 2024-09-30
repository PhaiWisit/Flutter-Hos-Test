import 'package:dev_deva_test/controllers/app_controller.dart';
import 'package:dev_deva_test/controllers/home_controller.dart';
import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/screens/home/widget_home/widget_dialog_noti_detail.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NotiTab extends StatelessWidget {
  const NotiTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find<HomeController>();

    return Container(
      color: white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Obx(() {
            var notiUnread = _homeController.notiList
                .where((service) => service['isRead'] == false)
                .toList();

            var notiRead = _homeController.notiList
                .where((service) => service['isRead'] == true)
                .toList();

            return Column(
              children: [
                notiUnread.isNotEmpty ? _label('ล่าสุด') : const SizedBox(),
                ...List.generate(notiUnread.length, (index) {
                  return _cardNoti(notiUnread, index, _homeController, context);
                }),
                notiRead.isNotEmpty ? _label('อ่านแล้ว') : const SizedBox(),
                ...List.generate(notiRead.length, (index) {
                  return _cardNoti(notiRead, index, _homeController, context);
                }),
              ],
            );
          }),
        ),
      ),
    );
  }

  Padding _cardNoti(List<Map<String, Object>> notiListFiltered, int index,
      HomeController homeController, BuildContext context) {
    AppController _appController = Get.find<AppController>();

    double height = 100;
    double font9 = 9;
    double font10 = 10;
    double font12 = 12;

    if (_appController.appScreen.value == AppScreen.large) {
      height = 180;

      font9 = 18;
      font10 = 20;
      font12 = 24;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (c) {
                return WidgetDialogNotiDetial(
                  data: notiListFiltered[index],
                );
              });
          homeController.onTapReadNoti(notiListFiltered[index]['id']);
        },
        child: Container(
          width: 100.w,
          height: height,
          decoration: BoxDecoration(
              color: notiListFiltered[index]['isRead'] as bool
                  ? white
                  : Color.fromARGB(13, 0, 0, 0),
              borderRadius: BorderRadius.circular(16),
              border:
                  Border(bottom: BorderSide(color: Colors.black12, width: 2))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset('assets/icons/icon_calendar_2.png'),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WidgetText(
                              data: '${notiListFiltered[index]['title']}',
                              size: font12,
                              color: black,
                              weight: FontWeight.w600),
                          WidgetText(
                              data:
                                  '${notiListFiltered[index]['department']} เวลา ${notiListFiltered[index]['time']}',
                              size: font10,
                              color: black,
                              weight: FontWeight.w400),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          WidgetText(
                              data: '${notiListFiltered[index]['date_text']}',
                              size: font9,
                              color: black,
                              weight: FontWeight.w400),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _label(String text, [String text2 = '']) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WidgetText(
              data: text, size: 18, color: text_grey, weight: FontWeight.w700),
          text2 != ''
              ? WidgetText(
                  data: text2, size: 12, color: green, weight: FontWeight.w500)
              : const SizedBox()
        ],
      ),
    );
  }
}
