

import 'package:get/get.dart';
import 'package:universityservices/core/constant/routes.dart';
// import 'package:universityservices/core/constant/routes.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToServices(List categories,int selectedCat,final args);
  goToPagePagedetails();
}

class HomeControllerImp extends HomeController {
  // MyServices myServices = Get.find();

  String? username;
  String? id;

  List get categories => [null];
  // HomeData homeData = HomeData(Get.find());

  // List categories [];
  @override
  getdata() {}

  @override
  initialData() {}

  @override
  goToServices(List categories,int selectedCat,final args) {


    Get.toNamed(
      selectedCat==0?AppRoute.Services1: selectedCat==1?AppRoute.Services2: selectedCat==2?AppRoute.Services3: selectedCat==3?AppRoute.Services4: selectedCat==4?AppRoute.Services5:selectedCat==5?AppRoute.Services6:selectedCat==6?AppRoute.Services7:AppRoute.Services8,
 arguments: args
        
      

      
    );
  }

  @override
  goToPagePagedetails() {
    Get.toNamed("Pagedetails", arguments: {});
  }
}
