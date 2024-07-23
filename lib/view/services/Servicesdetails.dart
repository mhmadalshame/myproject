// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:universityservices/controller/auth/servicesdetails_controller.dart';
// import 'package:universityservices/core/constant/color.dart';

// class Servicesdetails extends StatelessWidget {
//   const Servicesdetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // ignore: unused_local_variable
//     servicesdetails_controllerImp controller =
//         Get.put(servicesdetails_controllerImp());
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 40,
//         margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         child: MaterialButton(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             color: AppColor.primaryColor,
//             onPressed: () {},
//             child: const Text(
//               "Add To Cart",
//               style:
//                   TextStyle(color: AppColor.white, fontWeight: FontWeight.bold),
//             )),
//       ),
//       body: ListView(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
//                 height: 150,
//                 decoration: const BoxDecoration(
//                   color: AppColor.primaryColor,
//                   // borderRadius:
//                   //     BorderRadius.vertical(bottom: Radius.circular(25)),
//                 ),
//               ),
//               // Chainman get image in baked
//               Positioned(
//                 top: 30.0,
//                 right: Get.width / 8,
//                 left: Get.width / 8,
//                 child: Image.asset(
//                   "assets/images/6.png",
//                   height: 200,
//                   fit: BoxFit.fill,
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           Container(
//             padding: const EdgeInsets.all(20),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               // Text("${controller.itemodel.itemsName}")
//               const Text("Chair",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: AppColor.primaryColor)),

//               // PriceAndCountItems(
//               //   onAdd: () {},
//               //   onRemove: () {},
//               //   count: "2",
//               //   price: "200.0\$",
//               // ),
//               const SizedBox(
//                 height: 10,
//               ),

//               const Text(
//                   "Beautiful looking wall Chair jbkhguihk hbihuio jbhojhoiuh ouho ",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold, color: AppColor.grey2)),

//               const SizedBox(
//                 height: 10,
//               ),

//               const Text("Color",
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: AppColor.primaryColor)),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(right: 5),
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(bottom: 5),
//                     height: 50,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColor.black),
//                       borderRadius: BorderRadius.circular(10),
//                       color: AppColor.red,
//                     ),
//                     // child: const Text(
//                     //   "Red",
//                     //   style: TextStyle(
//                     //       color: AppColor.white, fontWeight: FontWeight.bold),
//                     // ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(right: 5),
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(bottom: 5),
//                     height: 50,
//                     width: 60,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: AppColor.black),
//                       borderRadius: BorderRadius.circular(10),
//                       color: AppColor.black,
//                     ),
//                     // child: const Text(
//                     //   "black",
//                     //   style: TextStyle(
//                     //       color: AppColor.white, fontWeight: FontWeight.bold),
//                     // ),
//                   )
//                 ],
//               )
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }
