// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get/get.dart';

abstract class ServicesController extends GetxController {
  initialData();
  changecat(int val);
  goToPageServices(List categories,int i );
  goToPagePagedetails(int i,String s,final args);
}

class ServicesControllerImp extends ServicesController {
  get selectedcat => null;

  get categories => null;

  // // ignore: non_constant_identifier_names
   List Services = [];
  // int? selectedcat;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    // Services = Get.arguments['categories'];
    // selectedcat = Get.arguments['selectedcat'];
  }

  @override
  changecat(val) {
    // selectedcat = val;
    update();
  }

  @override
  goToPagePagedetails(int i,String s,final args) {
    if(s=="sport"){
Get.toNamed("Pagedetails${i+1}", arguments: args);

    }
    else if(s=="education"){

Get.toNamed("Education${i+1}", arguments: args);

    }
    else if(s=="funny"){

Get.toNamed("Funny${i+1}", arguments: args);
    }else if(s=="arts"){
Get.toNamed("Arts${i+1}", arguments: args);

    }
    else if(s=="advertisements"){
Get.toNamed("Advertisements${i+1}", arguments: args);

    }
    else if(s=="gradtion"){
Get.toNamed("Gradtion${i+1}", arguments: args);

    }
    else if(s=="donation"){

Get.toNamed("Donation${i+1}", arguments: args);
    }else {

      Get.toNamed("Information${i+1}", arguments: args);
    }
  }

  @override
  goToPageServices(categories, int i) {
    Get.toNamed(
      "Services${i+1}",
    );
  }
}
