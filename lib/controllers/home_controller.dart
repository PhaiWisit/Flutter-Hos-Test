import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedTab = 0.obs;
  var hasNotification = true.obs;

  var isShowFavorite = true.obs;

  void onTapTab(int index) {
    selectedTab(index);
  }

  void onTapSwitchFavorite() {
    isShowFavorite(!isShowFavorite.value);
  }

  void onTapReadNoti(id) {
    var noti = notiList.firstWhere((item) => item['id'] == id,
        orElse: () => {
              'id': -1,
              'title': '',
              'detail': '',
              'date_text': '',
              'isRead': true
            });

    if (noti['id'] != -1) {
      noti['isRead'] = true;
      notiList.refresh();
    }

    checkNoti();
  }

  void checkNoti() {
    var notiUnread =
        notiList.where((service) => service['isRead'] == false).toList();

    if (notiUnread.isEmpty) {
      hasNotification(false);
    } else {
      hasNotification(true);
    }
  }

  void onChangeFav(index) {
    bool isFavorite = serviceList[index]['isFavorite'] as bool? ?? false;
    serviceList[index]['isFavorite'] = !isFavorite;
    serviceList.refresh();
  }

  // mock data
  var serviceList = [
    {'name': 'Check-in', 'icon': 'icon_checkin.png', 'isFavorite': true},
    {'name': 'ประวัติการรักษา', 'icon': 'icon_history.png', 'isFavorite': true},
    {'name': 'ประวัติการใช้ยา', 'icon': 'icon_drug.png', 'isFavorite': true},
    {'name': 'การรับบริการ', 'icon': 'icon_service.png', 'isFavorite': true},
    {'name': 'ค่าใช้จ่าย', 'icon': 'icon_cost.png', 'isFavorite': true},
    {
      'name': 'บันทึกสุขภาพประชาชน',
      'icon': 'icon_record.png',
      'isFavorite': true
    },
    {'name': 'การแพทย์ทางไกล', 'icon': 'icon_telemed.png', 'isFavorite': false},
    {'name': 'นำทาง', 'icon': 'icon_navigate.png', 'isFavorite': false},
    {
      'name': 'โทรเรียกรถฉุกเฉิน',
      'icon': 'icon_emergency.png',
      'isFavorite': false
    },
    {'name': 'หมอพร้อม', 'icon': 'icon_morprom.png', 'isFavorite': false},
  ].obs;

  var notiList = [
    {
      'id': 1,
      'title': 'คุณมีนัดหมายการพบแพทย์ในวันพรุ่งนี้',
      'department': 'ห้องตรวจอายุรกรรม',
      'time': '09.00 น. - 12.00 น.',
      'date': '29 ก.ย. 2567',
      'date_text': 'พรุ่งนี้',
      'isRead': false,
      'doctor_name': 'นพ. สมชาย ใจดี',
      'building': 'อาคาร A',
      'appointment_type': 'นัดติดตามอาการ',
    },
    {
      'id': 2,
      'title': 'คุณมีนัดหมายการพบแพทย์ในอีก 7 วัน',
      'department': 'ห้องตรวจอายุรกรรม',
      'time': '09.00 น. - 12.00 น.',
      'date': '5 ต.ค. 2567',
      'date_text': 'อีก 7 วัน',
      'isRead': false,
      'doctor_name': 'นพ. วิภา สวยงาม',
      'building': 'อาคาร B',
      'appointment_type': 'นัดตรวจสุขภาพ',
    },
    {
      'id': 3,
      'title': 'คุณมีนัดหมายการตรวจสุขภาพในอีก 3 วัน',
      'department': 'ห้องตรวจสุขภาพ',
      'time': '08.00 น. - 10.00 น.',
      'date': '2 ต.ค. 2567',
      'date_text': 'อีก 3 วัน',
      'isRead': true,
      'doctor_name': 'นพ. อุษา กล้าแกร่ง',
      'building': 'อาคาร C',
      'appointment_type': 'นัดตรวจสุขภาพ',
    },
    {
      'id': 4,
      'title': 'ผลการตรวจสุขภาพของคุณพร้อมแล้ว',
      'department': 'ห้องตรวจสุขภาพ',
      'time': '08.00 น. - 10.00 น.',
      'date': '29 ก.ย. 2567',
      'date_text': 'วันนี้',
      'isRead': true,
      'doctor_name': 'นพ. สมชาย ใจดี',
      'building': 'อาคาร A',
      'appointment_type': 'นัดติดตามผลการตรวจ',
    },
  ].obs;
}
