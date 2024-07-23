// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:universityservices/Serveces2.dart';
import 'package:universityservices/Serveces3.dart';
import 'package:universityservices/Serveces4.dart';
import 'package:universityservices/Serveces5.dart';
import 'package:universityservices/Serveces6.dart';
import 'package:universityservices/Serveces7.dart';
import 'package:universityservices/Serveces8.dart';

import 'package:universityservices/Services1.dart';
import 'package:universityservices/admin/SuperAdmin.dart';
import 'package:universityservices/admin/adminaddlecttere.dart';
import 'package:universityservices/admin/adminaddnews.dart';
import 'package:universityservices/admin/adminmangedonation.dart';
import 'package:universityservices/admin/adminmangerequest.dart';
import 'package:universityservices/admin/adminmangeshakwa.dart';
import 'package:universityservices/admin/adminmangesport.dart';
import 'package:universityservices/core/constant/routes.dart';
import 'package:universityservices/home.dart';
import 'package:universityservices/homescreen.dart';
import 'package:universityservices/newuser.dart';
import 'package:universityservices/register.dart';
// import 'package:universityservices/main.dart';
import 'package:universityservices/view/screen/auth/forgetPassword/forgetpasswrd.dart';
import 'package:universityservices/view/screen/auth/forgetPassword/restpassword.dart';
import 'package:universityservices/view/screen/auth/forgetPassword/success_resetpassword.dart';
import 'package:universityservices/view/screen/auth/forgetPassword/success_signup.dart';
import 'package:universityservices/view/screen/auth/forgetPassword/vefifycoodsingnup.dart';
import 'package:universityservices/view/screen/auth/forgetPassword/verifycoode.dart';
import 'package:universityservices/view/screen/auth/login.dart';
import 'package:universityservices/view/screen/auth/singnup.dart';
import 'package:universityservices/view/screen/onboarding.dart';
import 'package:universityservices/view/widget/services_page/Page%20details.dart';
import 'package:universityservices/view/widget/services_page/Page%20details2.dart';
import 'package:universityservices/view/widget/services_page/Page%20details3.dart';
import 'package:universityservices/view/widget/services_page/Poetry.dart';
import 'package:universityservices/view/widget/services_page/addshakwa.dart';
import 'package:universityservices/view/widget/services_page/blood.dart';
import 'package:universityservices/view/widget/services_page/book.dart';
import 'package:universityservices/view/widget/services_page/bookseducation.dart';
import 'package:universityservices/view/widget/services_page/chat.dart';
import 'package:universityservices/view/widget/services_page/chatgpt.dart';
import 'package:universityservices/view/widget/services_page/chatingPage.dart';
import 'package:universityservices/view/widget/services_page/clothes.dart';
import 'package:universityservices/view/widget/services_page/contestAd.dart';
import 'package:universityservices/view/widget/services_page/createchat.dart';
import 'package:universityservices/view/widget/services_page/deleteUser.dart';
import 'package:universityservices/view/widget/services_page/demos.dart';
import 'package:universityservices/view/widget/services_page/file_list.dart';
import 'package:universityservices/view/widget/services_page/gradtionbooks.dart';
import 'package:universityservices/view/widget/services_page/meassage1.dart';
import 'package:universityservices/view/widget/services_page/messges.dart';
import 'package:universityservices/view/widget/services_page/music.dart';
import 'package:universityservices/view/widget/services_page/program.dart';
import 'package:universityservices/view/widget/services_page/questions.dart';
import 'package:universityservices/view/widget/services_page/qustionaboutsport.dart';
import 'package:universityservices/view/widget/services_page/searchUser.dart';
import 'package:universityservices/view/widget/services_page/showurser.dart';
import 'package:universityservices/view/widget/services_page/souvenirphoto.dart';
import 'package:universityservices/view/widget/services_page/staterequest.dart';
import 'package:universityservices/view/widget/services_page/studentTalentphoto.dart';
import 'package:universityservices/view/widget/services_page/studentservice1.dart';
import 'package:universityservices/view/widget/services_page/universityAd.dart';



import 'package:universityservices/view/widget/services_page/videoeducation.dart';


List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.SingUp, page: () => const SingUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.VerFiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSingup()),
  GetPage(
      name: AppRoute.VerfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),

  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Home
  GetPage(name: "/", page: () => const HomePage()),
  GetPage(name: AppRoute.Services1, page: () => const Services1()),
  GetPage(name: AppRoute.Services2, page: () => const Services2()),
  GetPage(name: AppRoute.Services3, page: () => const Services3()),
  GetPage(name: AppRoute.Services4, page: () => const Services4()),
  GetPage(name: AppRoute.Services5, page: () => const Services5()),
  GetPage(name: AppRoute.Services6, page: () => const Services6()),
  GetPage(name: AppRoute.Services7, page: () => const Services7()),
  GetPage(name: AppRoute.Services8, page: () => const Serveces8()),
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
  GetPage(name: AppRoute.Pagedetails1, page: () => const Pagedetails1()),
  GetPage(name: AppRoute.Pagedetails2, page: () => const Pagedetails2()),
  GetPage(name: AppRoute.Pagedetails3, page: () => const Pagedetails3()),
  GetPage(name: AppRoute.Funny1, page: () => const Funny1()),
  GetPage(name: AppRoute.Funny2, page: () => const Funny2()),
  GetPage(name: AppRoute.Funny3, page: () => const Funny3()),

  GetPage(name: AppRoute.Donation1, page: () =>  Donation1()),
  GetPage(name: AppRoute.Donation2, page: () =>  Donation2()),
  GetPage(name: AppRoute.Donation3, page: () =>  Donation3()),
  GetPage(name: AppRoute.Education1, page: () =>  Education1()),
  GetPage(name: AppRoute.Education2, page: () =>  Education2()),
  GetPage(name: AppRoute.Education3, page: () =>  Education3()),
  GetPage(name: AppRoute.Education4, page: () =>  Education4()),
  GetPage(name: AppRoute.Advertisements1, page: () =>  Advertisements1()),
  GetPage(name: AppRoute.Advertisements2, page: () =>  Advertisements2()),
  GetPage(name: AppRoute.Arts1, page: () =>  Arts1()),
  GetPage(name: AppRoute.Arts2, page: () =>  Arts2()),

  GetPage(name: AppRoute.Gradtion1, page: () =>  Gradtion1()),
  GetPage(name: AppRoute.Gradtion2, page: () =>  Gradtion2()),






  GetPage(name: AppRoute.Information1, page: () =>  Information1()),
  GetPage(name: AppRoute.Information2, page: () =>  const Information2()),
  GetPage(name: AppRoute.Information3, page: () =>  const Information3()),
  GetPage(name: AppRoute.Information4, page: () =>  const Information4()),


  GetPage(name: AppRoute.CreateChat, page: () =>  const CreateChat(title: 'Create chat',)),
  GetPage(name: AppRoute.UserChatPage, page: () =>  const UserChatPage(title: 'UserChatPage',)),
  GetPage(name: AppRoute.MessageAdminPage, page: () =>  MessageAdminPage(title: 'meesage',)),
  GetPage(name: AppRoute.ChatPage, page: () =>  ChatPage(title: 'Chat',)),
  GetPage(name: AppRoute.Message, page: () =>  MessagePage(title: 'my massage',)),
 // GetPage(name: AppRoute.Lectures, page: () =>  Lectures()),

  GetPage(name: AppRoute.SuperAdmin, page: () =>  SuperAdmin(title: '',)),
  GetPage(name: AppRoute.AddNews, page: () =>  AddNews()),
  GetPage(name: AppRoute.AddPdf, page: () =>  AddPdf()),
  GetPage(name: AppRoute.MangeRequest, page: () =>  MangeRequest()),
  GetPage(name: AppRoute.MangeSport, page: () =>  MangeSport()),
  GetPage(name: AppRoute.MangeDonation, page: () =>  MangeDonation()),
  GetPage(name: AppRoute.MangeComplaints, page: () =>  MangeComplaints()),



  GetPage(name: AppRoute.Sport1, page: () =>  Sport1()),
  GetPage(name: AppRoute.UserPage, page: () =>  UserPage(title: 'Student',)),




  GetPage(name: AppRoute.Register, page: () =>  Register()),
  GetPage(name: AppRoute.SearchUserPage, page: () =>  SearchUserPage(title: 'Search Student',)),
  GetPage(name: AppRoute.DeleteUserPage, page: () =>  DeleteUserPage(title: 'Delete Student',)),







  GetPage(name: AppRoute.HomeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.UserForm, page: () => const UserForm()),

];
