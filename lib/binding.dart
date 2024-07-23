import 'package:get/get.dart';
import 'package:universityservices/controller/auth/auth/signupcontroller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(), fenix: true);
  }
}
