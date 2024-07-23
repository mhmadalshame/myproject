// ignore_for_file: file_names
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:universityservices/controller/auth/Services_controler.dart';
// import 'package:universityservices/core/constant/color.dart';

// class ListCategoriesServices extends GetView<ServicesController> {
//   const ListCategoriesServices({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         // separatorBuilder:(context, index)=>SizedBox(width: 10,)
//         // itemCount: controller.categories.length,

//         scrollDirection: Axis.horizontal,
//         itemBuilder: ((context, index) {
//           return Categories(
//             i: index,
//           );
//         }),
//       ),
//     );
//   }
// }

// class Categories extends GetView<ServicesControllerImp> {
//   // final CategoriesModel categoriesmodel;
//   final int? i;
//   const Categories({
//     super.key,
//     required this.i,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // controller.goToItems(controller.categories, i!);
//         controller.changecat(i!);
//       },
//       child: Column(
//         children: [
//           GetBuilder<ServicesControllerImp>(
//             builder: (controller) => Container(
//               padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
//               decoration: controller.selectedcat == i
//                   ? const BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                               width: 3, color: AppColor.primaryColor)))
//                   : null,
//               // child: Text(
//               //   // "${controller.categories}",
//               //   // style: const TextStyle(fontSize: 20, color: AppColor.grey2),
//               // ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
