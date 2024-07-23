// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:universityservices/core/constant/routes.dart';

// ignore: camel_case_types
class Settings_controller extends GetxController {
  logout() {

      Get.offNamed(AppRoute.login);
  }
}
