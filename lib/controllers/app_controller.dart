import 'package:get/get.dart';

enum AppScreen { small, medium, large }

class AppController extends GetxController {
  var appScreen = AppScreen.medium.obs;

  @override
  void onInit() {
    super.onInit();
  }
}
