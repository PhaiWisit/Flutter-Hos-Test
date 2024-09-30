import 'package:dev_deva_test/utils/app_color.dart';
import 'package:dev_deva_test/widgets/widget_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class WidgetDialogNotiDetial extends StatelessWidget {
  const WidgetDialogNotiDetial({super.key, this.data});

  final data;

  @override
  Widget build(BuildContext context) {
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
                      Image.asset('assets/icons/icon_calendar_2.png'),
                      WidgetText(
                          data: 'รายละเอียดการนัด',
                          size: 18,
                          color: green,
                          weight: FontWeight.w700)
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _details('การนัด', data['appointment_type']),
                          _details('วันที่', data['date']),
                          _details('เวลา', data['time']),
                          _details('สถานที่', data['building']),
                          _details('แผนก', data['department']),
                          _details('แพทย์', data['doctor_name']),
                          _details('แผนก', data['department']),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: red,
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
                      ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'แก้ไขวันนัดหมาย',
                              middleText:
                                  'เจ้าหน้าที่จะติดต่อกลับเพื่อนัดหมายอีกครั้ง',
                              textConfirm: 'ตกลง',
                              textCancel: 'ยกเลิก',
                              onConfirm: () async {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              WidgetText(
                                  data: 'แก้ไข',
                                  size: 16,
                                  color: white,
                                  weight: FontWeight.w700),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )));
  }

  Padding _details(String label, String data) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              WidgetText(
                  data: label, size: 14, color: black, weight: FontWeight.w700),
            ],
          ),
          Row(
            children: [
              WidgetText(
                  data: data, size: 12, color: black, weight: FontWeight.w500),
            ],
          )
        ],
      ),
    );
  }
}
